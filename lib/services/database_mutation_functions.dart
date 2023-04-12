// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/utils/queries.dart';

/// DataBaseMutationFunctions class provides different services that are under the context of graphQL mutations and queries.
///
/// Services include:
/// * `encounteredExceptionOrError`
/// * `gqlAuthQuery`
/// * `gqlAuthMutation`
/// * `gqlNonAuthMutation`
/// * `gqlNonAuthQuery`
/// * `refreshAccessToken`
/// * `fetchOrgById`
class DataBaseMutationFunctions {
  late GraphQLClient clientNonAuth;
  late GraphQLClient clientAuth;
  late Queries _query;

  void init() {
    clientNonAuth = graphqlConfig.clientToQuery();
    clientAuth = graphqlConfig.authClient();
    _query = Queries();
  }

  // initialising default messages for an event.
  GraphQLError userNotFound = const GraphQLError(message: 'User not found');
  GraphQLError userNotAuthenticated =
      const GraphQLError(message: 'User is not authenticated');
  GraphQLError emailAccountPresent =
      const GraphQLError(message: 'Email address already exists');
  GraphQLError wrongCredentials =
      const GraphQLError(message: 'Invalid credentials');
  GraphQLError organizationNotFound =
      const GraphQLError(message: 'Organization not found');
  GraphQLError refreshAccessTokenExpiredException = const GraphQLError(
    message:
        'Access Token has expired. Please refresh session.: Undefined location',
  );
  GraphQLError memberRequestExist =
      const GraphQLError(message: 'Membership Request already exists');

  /// This function is used to check if any exceptions or error encountered. The return type is [boolean].
  bool? encounteredExceptionOrError(
    OperationException exception, {
    bool showSnackBar = true,
  }) {
    // if server link is wrong.
    if (exception.linkException != null) {
      // debugPrint(exception.linkException.toString());
      if (showSnackBar) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => navigationService.showTalawaErrorSnackBar(
            "Server not running/wrong url",
            MessageType.info,
          ),
        );
      }
      return false;
    }
    // looping through graphQL errors.
    debugPrint(exception.graphqlErrors.toString());
    for (int i = 0; i < exception.graphqlErrors.length; i++) {
      // if the error message is "Access Token has expired. Please refresh session.: Undefined location"
      if (exception.graphqlErrors[i].message ==
          refreshAccessTokenExpiredException.message) {
        print('token refreshed');
        refreshAccessToken(userConfig.currentUser.refreshToken!).then(
          (value) => graphqlConfig
              .getToken()
              .then((value) => databaseFunctions.init()),
        );
        print('client refreshed');
        return true;
      }
      // if the error message is "User is not authenticated"
      if (exception.graphqlErrors[i].message == userNotAuthenticated.message) {
        print('client refreshed');
        refreshAccessToken(userConfig.currentUser.refreshToken!).then(
          (value) => graphqlConfig
              .getToken()
              .then((value) => databaseFunctions.init()),
        );
        return true;
      }
      // if the error message is "User not found"
      if (exception.graphqlErrors[i].message == userNotFound.message) {
        if (showSnackBar) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => navigationService.showTalawaErrorDialog(
              "No account registered with this email",
              MessageType.error,
            ),
          );
        }
        return false;
      }
      // if the error message is "Membership Request already exists"
      if (exception.graphqlErrors[i].message == memberRequestExist.message) {
        if (showSnackBar) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => navigationService.showTalawaErrorDialog(
              "Membership request already exist",
              MessageType.error,
            ),
          );
        }
        return false;
      }
      // if the error message is "Invalid credentials"
      if (exception.graphqlErrors[i].message == wrongCredentials.message) {
        if (showSnackBar) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => navigationService.showTalawaErrorDialog(
              "Enter a valid password",
              MessageType.error,
            ),
          );
        }
        return false;
      }
      // if the error message is "Organization not found"
      if (exception.graphqlErrors[i].message == organizationNotFound.message) {
        if (showSnackBar) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => navigationService.showTalawaErrorDialog(
              "Organization Not Found",
              MessageType.error,
            ),
          );
        }
        return false;
      }
      // if the error message is "Email address already exists"
      if (exception.graphqlErrors[i].message == emailAccountPresent.message) {
        if (showSnackBar) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => navigationService.showTalawaErrorDialog(
              "Account with this email already registered",
              MessageType.error,
            ),
          );
        }
        return false;
      }
    }
    // if the error is unknown

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => navigationService.showTalawaErrorDialog(
        "Something went wrong!",
        MessageType.error,
      ),
    );
    return false;
  }

  /// This function is used to run the graph-ql query for authentication.
  Future<dynamic> gqlAuthQuery(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables ?? <String, dynamic>{},
    );
    final QueryResult result = await clientAuth.query(options);
    // if there is an error or exception in [result]
    if (result.hasException) {
      final exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        gqlAuthQuery(query, variables: variables);
      }
    } else if (result.data != null && result.isConcrete) {
      return result;
    }
    return null;
  }

  /// This function is used to run the graph-ql mutation for authenticated user.
  Future<dynamic> gqlAuthMutation(
    String mutation, {
    Map<String, dynamic>? variables,
  }) async {
    final QueryResult result = await clientAuth.mutate(
      MutationOptions(
        document: gql(mutation),
        variables: variables ?? <String, dynamic>{},
      ),
    );
    // if there is an error or exception in [result]
    if (result.hasException) {
      final exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        gqlAuthMutation(mutation, variables: variables);
      }
    } else if (result.data != null && result.isConcrete) {
      return result;
    }
    return null;
  }

  /// This function is used to run the graph-ql mutation to authenticate the non signed-in user.
  Future<dynamic> gqlNonAuthMutation(
    String mutation, {
    Map<String, dynamic>? variables,
    bool reCall = true,
  }) async {
    final QueryResult result = await clientNonAuth.mutate(
      MutationOptions(
        document: gql(mutation),
        variables: variables ?? <String, dynamic>{},
      ),
    );
    // if there is an error or exception in [result]
    if (result.hasException) {
      final exception = encounteredExceptionOrError(result.exception!);
      if (exception! && reCall) {
        gqlNonAuthMutation(mutation, variables: variables);
      }
    } else if (result.data != null && result.isConcrete) {
      return result;
    }
    return null;
  }

  /// This function is used to run the graph-ql query for the non signed-in user.
  Future<QueryResult?> gqlNonAuthQuery(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    final queryOptions = QueryOptions(
      document: gql(query),
      variables: variables ?? <String, dynamic>{},
    );
    final result = await clientNonAuth.query(queryOptions);
    QueryResult? finalRes;
    // if there is an error or exception in [result]
    if (result.hasException) {
      final exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        finalRes = await gqlNonAuthQuery(query, variables: variables);
      }
    } else if (result.data != null && result.isConcrete) {
      return result;
    }
    return finalRes;
  }

  /// This function is used to refresh the Authenication token to access the application.
  Future<bool> refreshAccessToken(String refreshToken) async {
    // run the graphQL mutation
    final QueryResult result = await clientNonAuth.mutate(
      MutationOptions(
        document: gql(
          _query.refreshToken(refreshToken),
        ),
      ),
    );
    // if there is an error or exception in [result]
    if (result.hasException) {
      final exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        refreshAccessToken(refreshToken);
      } else {
        navigationService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      userConfig.updateAccessToken(
        refreshToken: result.data!['refreshToken']['refreshToken'].toString(),
        accessToken: result.data!['refreshToken']['accessToken'].toString(),
      );
      databaseFunctions.init();
      return true;
    }
    return false;
  }

  /// This function fetch the organization using the [id] passed.
  Future<dynamic> fetchOrgById(String id) async {
    final QueryResult result = await clientNonAuth
        .mutate(MutationOptions(document: gql(_query.fetchOrgById(id))));
    // if there is an error or exception in [result]
    if (result.hasException) {
      final exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        fetchOrgById(id);
      }
    } else if (result.data != null && result.isConcrete) {
      return OrgInfo.fromJson(
        result.data!['organizations'][0] as Map<String, dynamic>,
      );
    }
    return false;
  }
}
