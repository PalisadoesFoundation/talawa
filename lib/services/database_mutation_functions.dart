import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/exceptions/critical_action_exception.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/utils/post_queries.dart';
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
  /// Client Auth for handling non-authenticated request.
  late GraphQLClient clientNonAuth;

  /// Client Auth for handling authenticated request.
  late GraphQLClient clientAuth;

  /// Query passed by fucntion calling this function.
  late Queries _query;

  /// Initialization function.
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

  /// Initializes [clientNonAuth] function.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initClientNonAuth() {
    graphqlConfig.getOrgUrl();
    clientNonAuth = graphqlConfig.clientToQuery();
    _query = Queries();
  }

  /// Graphql error for handling.
  GraphQLError userNotFound =
      const GraphQLError(message: TalawaErrors.userNotFound);

  /// Graphql error for handling.
  GraphQLError userNotAuthenticated =
      const GraphQLError(message: TalawaErrors.userNotAuthenticated);

  /// Graphql error for handling.
  GraphQLError emailAccountPresent =
      const GraphQLError(message: TalawaErrors.emailAccountPresent);

  /// Graphql error for handling.
  GraphQLError wrongCredentials =
      const GraphQLError(message: TalawaErrors.wrongCredentials);

  /// Graphql error for handling.
  GraphQLError organizationNotFound =
      const GraphQLError(message: TalawaErrors.organizationNotFound);

  /// Graphql error for handling.
  GraphQLError refreshAccessTokenExpiredException = const GraphQLError(
    message: TalawaErrors.refreshAccessTokenExpiredException,
  );

  /// Graphql error for handling.
  GraphQLError memberRequestExist =
      const GraphQLError(message: TalawaErrors.memberRequestExist);

  /// Graphql error for handling.
  GraphQLError notifFeatureNotInstalled = const GraphQLError(
    message: TalawaErrors.failedToDetermineProject,
  );

  /// when result has no data and null.
  QueryResult noData = QueryResult(
    options: QueryOptions(
      document: gql(
        PostQueries().addLike(),
      ),
    ),
    data: null,
    source: QueryResultSource.network,
  );

  /// This function is used to check if any exceptions or error encountered. The return type is [boolean].
  ///
  /// **params**:
  /// * `exception`: OperationException which occur when calling for graphql post request
  /// * `showSnackBar`: Tell if the the place where this function is called wants a SnackBar on error
  ///
  /// **returns**:
  /// * `bool?`: returns a bool whether or not their is error, can be null
  bool? encounteredExceptionOrError(
    OperationException exception, {
    bool showSnackBar = true,
  }) {
    print('came');
    // If server link is wrong.
    if (exception.linkException != null) {
      debugPrint(exception.linkException.toString());
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

    if (exception is CriticalActionException) {
      debugPrint(exception.toString());
      if (showSnackBar) {
        navigationService.showCustomToast(exception.actionError);
      }
      return false;
    }

    /// Looping through graphQL errors.
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

      /// If the error message is "User is not authenticated"
      if (exception.graphqlErrors[i].message == userNotAuthenticated.message) {
        print('client refreshed');
        refreshAccessToken(userConfig.currentUser.refreshToken!).then(
          (value) => graphqlConfig
              .getToken()
              .then((value) => databaseFunctions.init()),
        );
        return true;
      }

      /// If the error message is "User not found"
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

      /// If the error message is "Membership Request already exists"
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

      /// If the error message is "Invalid credentials"
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

      /// If the error message is "Organization not found"
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

      /// If the error message is "Email address already exists"
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
    // If the error is unknown
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
  /// * `query`: query is used to fetch data in graphql, for more info read graphql docs
  /// * `variables`: variables to be passed with query
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: it returns Future of dynamic
  Future<QueryResult<Object?>> gqlAuthQuery(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables ?? <String, dynamic>{},
    );
    final response = await cacheService.executeOrCacheOperation(
      operation: query,
      variables: variables,
      operationType: CachedOperationType.gqlAuthQuery,
      whenOnline: () async {
        final QueryResult result = await clientAuth.query(options);
        // if there is an error or exception in [result]
        if (result.hasException) {
          final exception = encounteredExceptionOrError(result.exception!);
          if (exception!) {
            return await gqlAuthQuery(query, variables: variables);
          }
        } else if (result.data != null && result.isConcrete) {
          return result;
        }
        return noData;
      },
    );
    return response;
  }

  /// This function is used to run the graph-ql mutation for authenticated user.
  ///
  /// **params**:
  /// * `mutation`: mutation is used to change/add/delete data in graphql, for more info read graphql docs
  /// * `variables`: variables to be passed with mutation
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: it returns Future of dynamic
  Future<QueryResult<Object?>> gqlAuthMutation(
    String mutation, {
    Map<String, dynamic>? variables,
  }) async {
    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: variables ?? <String, dynamic>{},
    );
    final response = await cacheService.executeOrCacheOperation(
      operation: mutation,
      variables: variables,
      operationType: CachedOperationType.gqlAuthMutation,
      whenOnline: () async {
        final QueryResult result = await clientAuth.mutate(options);
        // If there is an error or exception in [result]
        if (result.hasException) {
          encounteredExceptionOrError(result.exception!);
        } else if (result.data != null && result.isConcrete) {
          return result;
        }
        return noData;
      },
    );
    return response;
  }

  /// This function is used to run the graph-ql mutation to authenticate the non signed-in user.
  ///
  ///
  /// **params**:
  /// * `mutation`: mutation is used to change/add/delete data in graphql, for more info read graphql docs
  /// * `variables`: variables to be passed with mutation
  /// * `reCall`: when not first fetch call
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: it returns Future of dynamic
  Future<QueryResult<Object?>> gqlNonAuthMutation(
    String mutation, {
    Map<String, dynamic>? variables,
    bool reCall = true,
  }) async {
    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: variables ?? <String, dynamic>{},
    );
    final response = await cacheService.executeOrCacheOperation(
      operation: mutation,
      variables: variables,
      operationType: CachedOperationType.gqlNonAuthMutation,
      whenOnline: () async {
        final QueryResult result = await clientNonAuth.mutate(options);
        // if there is an error or exception in [result]
        if (result.hasException) {
          encounteredExceptionOrError(result.exception!);
        } else if (result.data != null && result.isConcrete) {
          return result;
        }
        return noData;
      },
    );
    return response;
  }

  /// This function is used to run the graph-ql query for the non signed-in user.
  ///
  /// **params**:
  /// * `query`: query is used to fetch data in graphql, for more info read graphql docs
  /// * `variables`: variables to be passed with query
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: it returns Future of QueryResult, contains all data
  Future<QueryResult<Object?>> gqlNonAuthQuery(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    final queryOptions = QueryOptions(
      document: gql(query),
      variables: variables ?? <String, dynamic>{},
    );
    final response = await cacheService.executeOrCacheOperation(
      operation: query,
      variables: variables,
      operationType: CachedOperationType.gqlAuthQuery,
      whenOnline: () async {
        final result = await clientNonAuth.query(queryOptions);
        // if there is an error or exception in [result]
        if (result.hasException) {
          encounteredExceptionOrError(result.exception!);
        } else if (result.data != null && result.isConcrete) {
          return result;
        }
        return noData;
      },
    );
    return response;
  }

  /// This function is used to refresh the Authenication token to access the application.
  ///
  /// **params**:
  /// * `refreshToken`: Needed for authentication
  ///
  /// **returns**:
  /// * `Future<bool>`: it returns Future of dynamic
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
        refreshToken: (result.data!['refreshToken']
                as Map<String, dynamic>)['refreshToken']
            .toString(),
        accessToken: (result.data!['refreshToken']
                as Map<String, dynamic>)['accessToken']
            .toString(),
      );
      databaseFunctions.init();
      return true;
    }
    return false;
  }

  /// This function fetch the organization using the [id] passed.
  ///
  /// **params**:
  /// * `id`: id that identifies a particular org
  ///
  /// **returns**:
  /// * `Future<dynamic>`: it returns Future of dynamic
  Future<dynamic> fetchOrgById(String id) async {
    print(id);
    final QueryResult result = await clientNonAuth
        .mutate(MutationOptions(document: gql(_query.fetchOrgById(id))));
    // if there is an error or exception in [result]
    if (result.hasException) {
      final exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        fetchOrgById(id);
      }
    } else if (result.data != null && result.isConcrete) {
      print(result.data!['organizations']);
      return OrgInfo.fromJson(
        // ignore: collection_methods_unrelated_type
        (result.data!['organizations'] as List<Map<String, dynamic>>)[0],
      );
    }
    return false;
  }
}
