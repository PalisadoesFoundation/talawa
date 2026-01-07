// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:talawa_lint/talawa_query_result/talawa_query_result.dart';
import 'package:test/test.dart';

void main() {
  group('TalawaQueryResultLintRule', () {
    late TalawaQueryResultLintRule rule;

    setUp(() {
      rule = const TalawaQueryResultLintRule();
    });

    group('File exclusion', () {
      test('should identify test files correctly', () {
        // Unix paths
        expect(
            rule.isTestFileForTesting('/path/to/test/widget_test.dart'), true);
        expect(rule.isTestFileForTesting('/path/to/test/models/user_test.dart'),
            true);
        expect(
            rule.isTestFileForTesting(
                '/project/test/view_model_tests/login_test.dart'),
            true);

        // Windows paths
        expect(rule.isTestFileForTesting('C:\\project\\test\\widget_test.dart'),
            true);
        expect(
            rule.isTestFileForTesting(
                'D:\\talawa\\test\\models\\user_test.dart'),
            true);

        // Non-test files
        expect(rule.isTestFileForTesting('/path/to/lib/service.dart'), false);
        expect(
            rule.isTestFileForTesting('/path/to/lib/test_helper.dart'), false);
        expect(
            rule.isTestFileForTesting('/path/to/contest/widget.dart'), false);
      });

      test('should identify generated files correctly', () {
        // .g.dart files (json_serializable, etc.)
        expect(rule.isGeneratedFileForTesting('user.g.dart'), true);
        expect(rule.isGeneratedFileForTesting('/path/to/models/user.g.dart'),
            true);

        // .mocks.dart files (mockito)
        expect(rule.isGeneratedFileForTesting('setup_hive.mocks.dart'), true);
        expect(rule.isGeneratedFileForTesting('/test/helpers/setup.mocks.dart'),
            true);

        // Regular files
        expect(rule.isGeneratedFileForTesting('user.dart'), false);
        expect(rule.isGeneratedFileForTesting('logging.dart'), false);
        expect(rule.isGeneratedFileForTesting('debugging.dart'), false);
      });
    });

    group('LintCode configuration', () {
      test('should have correct lint code name', () {
        expect(rule.code.name, 'talawa_query_result_check');
      });

      test('should have problem message', () {
        expect(
          rule.code.problemMessage,
          'QueryResult.data accessed without checking hasException first.',
        );
      });

      test('should have correction message', () {
        expect(
          rule.code.correctionMessage,
          'Add an if (result.hasException) check before accessing data.',
        );
      });

      test('should have warning severity', () {
        expect(rule.code.errorSeverity.name, 'WARNING');
      });
    });
  });
}
