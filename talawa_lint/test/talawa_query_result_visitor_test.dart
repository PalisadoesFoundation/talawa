// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:talawa_lint/talawa_query_result/talawa_query_result_visitor.dart';
import 'package:test/test.dart';

void main() {
  group('TalawaQueryResultVisitor', () {
    group('Type checking helpers', () {
      test('isQueryResultTypeName should match exact QueryResult', () {
        expect(
          TalawaQueryResultVisitor.isQueryResultTypeName('QueryResult'),
          true,
        );
        expect(
          TalawaQueryResultVisitor.isQueryResultTypeName(
              'QueryResult<Object?>'),
          true,
        );
      });

      test('isQueryResultTypeName should not match similar types', () {
        expect(
          TalawaQueryResultVisitor.isQueryResultTypeName('QueryResultBuilder'),
          false,
        );
        expect(
          TalawaQueryResultVisitor.isQueryResultTypeName('MyQueryResult'),
          false,
        );
        expect(
          TalawaQueryResultVisitor.isQueryResultTypeName('QueryResultWrapper'),
          false,
        );
      });

      test('isFromGraphqlPackage should validate library source', () {
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
            'package:graphql_flutter/graphql_flutter.dart',
          ),
          true,
        );
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
            'package:graphql/client.dart',
          ),
          true,
        );
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
            'package:my_custom_package/query_result.dart',
          ),
          false,
        );
      });

      test('isExceptionProperty should identify exception-related properties',
          () {
        expect(
          TalawaQueryResultVisitor.isExceptionProperty('hasException'),
          true,
        );
        expect(
          TalawaQueryResultVisitor.isExceptionProperty('exception'),
          true,
        );
        expect(
          TalawaQueryResultVisitor.isExceptionProperty('data'),
          false,
        );
        expect(
          TalawaQueryResultVisitor.isExceptionProperty('hasData'),
          false,
        );
      });

      test('isDataProperty should identify data property', () {
        expect(TalawaQueryResultVisitor.isDataProperty('data'), true);
        expect(TalawaQueryResultVisitor.isDataProperty('hasData'), false);
        expect(TalawaQueryResultVisitor.isDataProperty('exception'), false);
      });
    });
  });
}
