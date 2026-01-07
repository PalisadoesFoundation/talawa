// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:talawa_lint/talawa_query_result/talawa_query_result.dart';
import 'package:talawa_lint/talawa_query_result/talawa_query_result_visitor.dart';
import 'package:test/test.dart';

void main() {
  group('TalawaQueryResultLintRule Integration Tests', () {
    late TalawaQueryResultLintRule rule;

    setUp(() {
      rule = const TalawaQueryResultLintRule();
    });

    group('Core detection - Type validation', () {
      test('should correctly identify QueryResult type names', () {
        // Exact match
        expect(
          TalawaQueryResultVisitor.isQueryResultTypeName('QueryResult'),
          true,
        );
        // With generic
        expect(
          TalawaQueryResultVisitor.isQueryResultTypeName(
              'QueryResult<Object?>'),
          true,
        );
        expect(
          TalawaQueryResultVisitor.isQueryResultTypeName(
              'QueryResult<Map<String, dynamic>>'),
          true,
        );
      });

      test('should not identify similar but different types', () {
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
        expect(
          TalawaQueryResultVisitor.isQueryResultTypeName('String'),
          false,
        );
        expect(
          TalawaQueryResultVisitor.isQueryResultTypeName('Future'),
          false,
        );
      });
    });

    group('Core detection - Package validation', () {
      test('should identify graphql_flutter package', () {
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
              'package:graphql_flutter/graphql_flutter.dart'),
          true,
        );
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
              'package:graphql_flutter/src/core/query_result.dart'),
          true,
        );
      });

      test('should identify graphql package', () {
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
              'package:graphql/client.dart'),
          true,
        );
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
              'package:graphql/src/core/query_result.dart'),
          true,
        );
      });

      test('should not identify other packages', () {
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
              'package:my_custom_package/query_result.dart'),
          false,
        );
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
              'package:flutter/material.dart'),
          false,
        );
      });
    });

    group('No false positives - Property detection', () {
      test('should recognize hasException property', () {
        expect(
            TalawaQueryResultVisitor.isExceptionProperty('hasException'), true);
      });

      test('should recognize exception property', () {
        expect(TalawaQueryResultVisitor.isExceptionProperty('exception'), true);
      });

      test('should not treat data as exception property', () {
        expect(TalawaQueryResultVisitor.isExceptionProperty('data'), false);
        expect(TalawaQueryResultVisitor.isExceptionProperty('hasData'), false);
        expect(
            TalawaQueryResultVisitor.isExceptionProperty('isLoading'), false);
      });

      test('should correctly identify data property', () {
        expect(TalawaQueryResultVisitor.isDataProperty('data'), true);
        expect(TalawaQueryResultVisitor.isDataProperty('hasData'), false);
        expect(TalawaQueryResultVisitor.isDataProperty('exception'), false);
        expect(TalawaQueryResultVisitor.isDataProperty('hasException'), false);
      });
    });

    group('File exclusion - Test files', () {
      test('should identify Unix test file paths', () {
        expect(
            rule.isTestFileForTesting('/path/to/test/widget_test.dart'), true);
        expect(rule.isTestFileForTesting('/project/test/models/user_test.dart'),
            true);
        expect(
            rule.isTestFileForTesting(
                '/project/test/view_model_tests/login_test.dart'),
            true);
        expect(rule.isTestFileForTesting('/test/unit_test.dart'), true);
      });

      test('should identify Windows test file paths', () {
        expect(rule.isTestFileForTesting('C:\\project\\test\\widget_test.dart'),
            true);
        expect(
            rule.isTestFileForTesting(
                'D:\\talawa\\test\\models\\user_test.dart'),
            true);
      });

      test('should not identify non-test files', () {
        expect(rule.isTestFileForTesting('/path/to/lib/service.dart'), false);
        expect(
            rule.isTestFileForTesting('/path/to/lib/test_helper.dart'), false);
        expect(
            rule.isTestFileForTesting('/path/to/contest/widget.dart'), false);
        expect(rule.isTestFileForTesting('/lib/utils/test_utils.dart'), false);
      });

      test('should require both /test/ directory and _test.dart suffix', () {
        // Has _test.dart but not in test directory
        expect(rule.isTestFileForTesting('/lib/widget_test.dart'), false);
        // In test directory but no _test.dart suffix
        expect(rule.isTestFileForTesting('/test/helper.dart'), false);
      });
    });

    group('File exclusion - Generated files', () {
      test('should identify .g.dart files', () {
        expect(rule.isGeneratedFileForTesting('user.g.dart'), true);
        expect(rule.isGeneratedFileForTesting('/path/to/models/user.g.dart'),
            true);
        expect(rule.isGeneratedFileForTesting('org_info.g.dart'), true);
      });

      test('should identify .mocks.dart files', () {
        expect(rule.isGeneratedFileForTesting('setup_hive.mocks.dart'), true);
        expect(rule.isGeneratedFileForTesting('/test/helpers/setup.mocks.dart'),
            true);
      });

      test('should not identify regular files', () {
        expect(rule.isGeneratedFileForTesting('user.dart'), false);
        expect(rule.isGeneratedFileForTesting('logging.dart'), false);
        expect(rule.isGeneratedFileForTesting('debugging.dart'), false);
        expect(rule.isGeneratedFileForTesting('config.dart'), false);
      });
    });

    group('Edge cases - Access patterns', () {
      test('should correctly identify data property only', () {
        // The data property should be exactly "data"
        expect(TalawaQueryResultVisitor.isDataProperty('data'), true);
        // These should not match
        expect(TalawaQueryResultVisitor.isDataProperty('userData'), false);
        expect(TalawaQueryResultVisitor.isDataProperty('dataSource'), false);
      });

      test('should correctly identify exception properties only', () {
        expect(
            TalawaQueryResultVisitor.isExceptionProperty('hasException'), true);
        expect(TalawaQueryResultVisitor.isExceptionProperty('exception'), true);
        // These should not match
        expect(TalawaQueryResultVisitor.isExceptionProperty('exceptionHandler'),
            false);
        expect(TalawaQueryResultVisitor.isExceptionProperty('hasExceptionFlag'),
            false);
      });
    });

    group('Edge cases - QueryResult type patterns', () {
      test('should handle various QueryResult generic patterns', () {
        expect(TalawaQueryResultVisitor.isQueryResultTypeName('QueryResult'),
            true);
        expect(
            TalawaQueryResultVisitor.isQueryResultTypeName(
                'QueryResult<Object?>'),
            true);
        expect(
            TalawaQueryResultVisitor.isQueryResultTypeName(
                'QueryResult<dynamic>'),
            true);
        expect(
            TalawaQueryResultVisitor.isQueryResultTypeName(
                'QueryResult<Map<String, dynamic>>'),
            true);
      });

      test('should not match types that start with different prefix', () {
        expect(TalawaQueryResultVisitor.isQueryResultTypeName('AQueryResult'),
            false);
        expect(TalawaQueryResultVisitor.isQueryResultTypeName('_QueryResult'),
            false);
      });
    });

    group('LintCode configuration', () {
      test('should have correct lint code name', () {
        expect(rule.code.name, 'talawa_query_result_check');
      });

      test('should have descriptive problem message', () {
        expect(
          rule.code.problemMessage,
          'QueryResult.data accessed without checking hasException first.',
        );
      });

      test('should have helpful correction message', () {
        expect(
          rule.code.correctionMessage,
          'Add an if (result.hasException) check before accessing data.',
        );
      });

      test('should have warning severity', () {
        expect(rule.code.errorSeverity.name, 'WARNING');
      });

      test('should have documentation URL', () {
        expect(
          rule.code.url,
          'https://docs.talawa.io/docs/developers/talawa/talawa-lint/',
        );
      });
    });
  });
}
