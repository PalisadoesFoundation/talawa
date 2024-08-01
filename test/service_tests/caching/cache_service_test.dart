import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

import '../../helpers/test_locator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testSetupLocator();
  AppConnectivity.isOnline = false;
  test('executeOrCacheOperation', () async {
    final query = PostQueries().addLike();
    final result = await cacheService.executeOrCacheOperation(
      operation: query,
      operationType: CachedOperationType.gqlAuthQuery,
      whenOnline: () {
        return Future.value(
          QueryResult(
            options: QueryOptions(document: gql(query)),
            exception: OperationException(
              graphqlErrors: [],
            ),
            source: QueryResultSource.network,
          ),
        );
      },
    );
    expect(result.data, {'cached': true});
  });
}
