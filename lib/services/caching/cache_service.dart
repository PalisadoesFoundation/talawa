import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/caching/cached_user_action.dart';
import 'package:talawa/services/caching/offline_action_queue.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

/// This class provides functionalities for caching GraphQL operations.
class CacheService {
  /// Initializes the cache service and the offline action queue.
  CacheService() {
    offlineActionQueue = OfflineActionQueue();
  }

  /// Duration for which cached operations are considered valid.
  final Duration _timeToLive = const Duration(hours: 24);

  /// Queue for storing user actions to be executed offline.
  late final OfflineActionQueue offlineActionQueue;

  /// static graphql result when device is offline.
  static final QueryResult offlineResult = QueryResult(
    options: QueryOptions(
      document: gql(
        '''
        query {
          __typename
        }
        ''',
      ),
    ),
    data: {
      'cached': true,
    },
    source: QueryResultSource.cache,
  );

  /// Executes a GraphQL operation or caches it for offline execution.
  ///
  /// This function checks internet connectivity. If online, it executes the
  /// provided `whenOnline` function and returns the result. If offline, it creates
  /// a `CachedUserAction` object representing the operation and stores it
  /// in the `offlineActionQueue`. It then returns null.
  ///
  /// **params**:
  /// * `operation`: The GraphQL operation string.
  /// * `variables`: Optional variables for the operation (`Map<String, dynamic>`).
  /// * `operationType`: The type of the GraphQL operation (from `CachedOperationType` enum).
  /// * `whenOnline`: A function that executes the operation online and returns the result (`Future<QueryResult<Object?>?>`).
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: Returns the result of the operation.
  Future<QueryResult<Object?>> executeOrCacheOperation({
    required String operation,
    Map<String, dynamic>? variables,
    required CachedOperationType operationType,
    required Future<QueryResult<Object?>> Function() whenOnline,
  }) async {
    if (AppConnectivity.isOnline) {
      final result = await whenOnline();
      return result;
    } else {
      // Create a CachedUserAction for offline execution
      final timeStamp = DateTime.now();
      final expiry = timeStamp.add(_timeToLive);
      final cachedAction = CachedUserAction(
        id: 'PlaceHolder', // Placeholder for actual ID generation
        operation: operation,
        variables: variables,
        operationType: operationType,
        status: CachedUserActionStatus.pending,
        timeStamp: timeStamp,
        expiry: expiry,
      );
      await offlineActionQueue.addAction(cachedAction);
      return offlineResult;
    }
  }
}
