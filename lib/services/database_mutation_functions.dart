import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/exceptions/graphql_exception_resolver.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/utils/time_conversion.dart';

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

  /// This function clears the GraphQL cache to ensure fresh data fetch.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void clearGraphQLCache() {
    clientAuth.cache.store.reset();
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
      fetchPolicy: FetchPolicy.networkOnly,
    );
    final response = await cacheService.executeOrCacheOperation(
      operation: query,
      variables: variables,
      operationType: CachedOperationType.gqlAuthQuery,
      whenOnline: () async {
        final QueryResult result = await clientAuth.query(options);
        // if there is an error or exception in [result]
        if (result.hasException) {
          final exception =
              GraphqlExceptionResolver.encounteredExceptionOrError(
            result.exception!,
          );
          if (exception!) {
            return await gqlAuthQuery(query, variables: variables);
          }
        } else if (result.data != null && result.isConcrete) {
          // coverage:ignore-start
          traverseAndConvertDates(
            result.data ?? <String, dynamic>{},
            convertUTCToLocal,
            splitDateTimeLocal,
          );
          // coverage:ignore-end
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
    // coverage:ignore-start
    if (variables != null) {
      traverseAndConvertDates(variables, convertLocalToUTC, splitDateTimeUTC);
    }
    // coverage:ignore-end
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
          GraphqlExceptionResolver.encounteredExceptionOrError(
            result.exception!,
          );
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
    // coverage:ignore-start
    if (variables != null) {
      traverseAndConvertDates(variables, convertLocalToUTC, splitDateTimeUTC);
    }
    // coverage:ignore-end
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
          GraphqlExceptionResolver.encounteredExceptionOrError(
            result.exception!,
          );
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
          GraphqlExceptionResolver.encounteredExceptionOrError(
            result.exception!,
          );
        } else if (result.data != null && result.isConcrete) {
          // coverage:ignore-start
          traverseAndConvertDates(
            result.data ?? <String, dynamic>{},
            convertUTCToLocal,
            splitDateTimeLocal,
          );
          // coverage:ignore-end
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
      final exception = GraphqlExceptionResolver.encounteredExceptionOrError(
        result.exception!,
      );
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
    final QueryResult result = await clientNonAuth
        .mutate(MutationOptions(document: gql(_query.fetchOrgById(id))));
    // if there is an error or exception in [result]
    if (result.hasException) {
      final exception = GraphqlExceptionResolver.encounteredExceptionOrError(
        result.exception!,
      );
      if (exception!) {
        fetchOrgById(id);
      }
    } else if (result.data != null && result.isConcrete) {
      return OrgInfo.fromJson(
        (result.data!['organizations'] as List<Map<String, dynamic>>)[0],
      );
    }
    return false;
  }

  /// This function is used to run the graph-ql subscription for authenticated user.
  ///
  /// **params**:
  /// * `subscription`: subscription query string for real-time data
  /// * `variables`: variables to be passed with subscription
  ///
  /// **returns**:
  /// * `Stream<QueryResult<Object?>>`: Stream of subscription results
  Stream<QueryResult<Object?>> gqlAuthSubscription(
    String subscription, {
    Map<String, dynamic>? variables,
  }) async* {
    final SubscriptionOptions options = SubscriptionOptions(
      document: gql(subscription),
      variables: variables ?? <String, dynamic>{},
    );

    try {
      // Use the auth client with WebSocket support for subscriptions
      final stream = clientAuth.subscribe(options);

      await for (final result in stream) {
        // Handle exceptions similar to other methods
        if (result.hasException) {
          final exception =
              GraphqlExceptionResolver.encounteredExceptionOrError(
            result.exception!,
          );
          if (exception != null && exception) {
            // In case of token refresh, continue the stream
            continue;
          }
        } else if (result.data != null && result.isConcrete) {
          // Apply time conversion for subscription data
          traverseAndConvertDates(
            result.data ?? <String, dynamic>{},
            convertUTCToLocal,
            splitDateTimeLocal,
          );
          yield result;
        }
      }
    } catch (e) {
      // Log subscription errors but don't break the stream
      // Note: Subscriptions are real-time streams, so we don't use caching here
      // as caching doesn't make sense for live data
      debugPrint('Subscription error: $e');
    }
  }
}
