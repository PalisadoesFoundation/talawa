// ignore_for_file: avoid_dynamic_calls

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
  ///Defining the parameters for non authorised client.
  late GraphQLClient clientNonAuth;

  ///Defining the parameters for an authorised client.
  late GraphQLClient clientAuth;
  late Queries _query;

  /// init function for initializatioin of parameters.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void init() {
    clientNonAuth = graphqlConfig.clientToQuery();
    clientAuth = graphqlConfig.authClient();
    _query = Queries();
  }

  /// initialising default messages for an event.
  ///
  ///Error message when a user is not found.
  GraphQLError userNotFound = const GraphQLError(message: 'User not found');

  ///Error message when a user is not authenticated.
  GraphQLError userNotAuthenticated =
      const GraphQLError(message: 'User is not authenticated');

  ///Error message when an email address already exists.
  GraphQLError emailAccountPresent =
      const GraphQLError(message: 'Email address already exists');

  ///Error message when the entered credentials are wrong.
  GraphQLError wrongCredentials =
      const GraphQLError(message: 'Invalid credentials');

  ///Error message when the specified organization cannot be found.
  GraphQLError organizationNotFound =
      const GraphQLError(message: 'Organization not found');

  ///Error message when the access token has expired.
  GraphQLError refreshAccessTokenExpiredException = const GraphQLError(
    message:
        'Access Token has expired. Please refresh session.: Undefined location',
  );

  ///Error message when the membership request already exists.
  GraphQLError memberRequestExist =
      const GraphQLError(message: 'Membership Request already exists');

  /// This function is used to check if any exceptions or error encountered.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `exception`: the exception encounterred
  /// * `showSnackBar`: parameter for showing the snack bar.
  ///
  /// **returns**:
  /// * `bool?`: wether it is an exception(true) or an error(false)
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
  ///
  /// **params**:
  /// * `query`: the query used for authentication
  /// * `variables`: the map of variables required for authentication
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>?>`: returns the query result after authentication
  Future<QueryResult<Object?>?> gqlAuthQuery(
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
  ///
  /// **params**:
  /// * `mutation`: the mutation for authenticated user
  /// * `variables`: The map of variables required for authentication
  ///
  /// **returns**:
  /// * `Future<dynamic>`: returns the query result after authentication
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
  ///
  /// **params**:
  /// * `mutation`: the mutation for authenticated user
  /// * `variables`: The map of variables required for authentication
  /// * `reCall`: wether it is required to recall the function
  ///
  /// **returns**:
  /// * `Future<dynamic>`: the query result after sign in attempt by the user
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
  ///
  /// **params**:
  /// * `query`: query for non signed-in users
  /// * `variables`: variables required for authorization
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>?>`: the query result after sign in attempt by the user
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
  ///
  /// **params**:
  /// * `refreshToken`: the refresh token involved
  ///
  /// **returns**:
  /// * `Future<bool>`: if the access token has expired or not
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

  /// This function is used to fetch the organization.
  ///
  /// **params**:
  /// * `id`: id of the organization to be fetched
  ///
  /// **returns**:
  /// * `Future<dynamic>`: boolean return for wether the org could be fetched or not
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
