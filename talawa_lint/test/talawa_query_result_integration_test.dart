// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:talawa_lint/talawa_query_result/talawa_query_result.dart';
import 'package:talawa_lint/talawa_query_result/talawa_query_result_visitor.dart';
import 'package:test/test.dart';

void main() {
  group('TalawaQueryResultLintRule - Core Behavior Tests', () {
    late TalawaQueryResultLintRule rule;

    setUp(() {
      rule = const TalawaQueryResultLintRule();
    });

    group('CRITICAL: Violation Reporting Tests', () {
      test(
          'MUST report violation when data is accessed without hasException check',
          () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Pre-populate variable as QueryResult (simulating type detection)
        visitor.addQueryResultVariableForTesting('result');

        // Parse code with result.data access (top-level variable declaration)
        const code = 'var x = result.data;';
        final parseResult = parseString(content: code);

        // Visit the compilation unit - this visits all top-level declarations
        parseResult.unit.accept(visitor);

        // CRITICAL ASSERTION: Verify violation was reported
        expect(
          mockReporter.reportedNodes,
          isNotEmpty,
          reason: 'Visitor must report violation for unguarded data access',
        );
      });

      test('MUST NOT report violation when hasException is checked first', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Pre-populate AND mark as checked
        visitor.addQueryResultVariableForTesting('result');
        visitor.markVariableCheckedForTesting('result');

        // Parse code with result.data access
        const code = 'var x = result.data;';
        final parseResult = parseString(content: code);

        // Visit directly
        parseResult.unit.accept(visitor);

        // CRITICAL ASSERTION: No violation for guarded access
        expect(
          mockReporter.reportedNodes,
          isEmpty,
          reason: 'Visitor must NOT report violation for guarded data access',
        );
      });

      test('reports violation for indexed data access pattern', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result');

        const code = 'var x = result.data["key"];';
        final parseResult = parseString(content: code);
        parseResult.unit.accept(visitor);

        expect(
          mockReporter.reportedNodes,
          isNotEmpty,
          reason: 'Indexed data access must also trigger violation',
        );
      });

      test('reports violation for data access in expression', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('response');

        const code = 'var value = response.data;';
        final parseResult = parseString(content: code);
        parseResult.unit.accept(visitor);

        expect(
          mockReporter.reportedNodes,
          isNotEmpty,
          reason: 'Data access must trigger violation',
        );
      });

      test('does not report for different variable names', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Track 'result' but access 'other.data'
        visitor.addQueryResultVariableForTesting('result');

        const code = 'var x = other.data;';
        final parseResult = parseString(content: code);
        parseResult.unit.accept(visitor);

        // Should not report - 'other' is not tracked
        expect(mockReporter.reportedNodes, isEmpty);
      });

      test('reports only for tracked QueryResult variables', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Track multiple variables, check one
        visitor.addQueryResultVariableForTesting('result1');
        visitor.addQueryResultVariableForTesting('result2');
        visitor.markVariableCheckedForTesting('result1');

        // Access result2.data (not checked)
        const code = 'var x = result2.data;';
        final parseResult = parseString(content: code);
        parseResult.unit.accept(visitor);

        // Should report for result2
        expect(mockReporter.reportedNodes, isNotEmpty);
      });
    });

    group('Visitor State Management', () {
      test('tracks QueryResult variables correctly', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result');
        expect(visitor.queryResultVariablesForTesting, contains('result'));
      });

      test('tracks checked variables correctly', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result');
        visitor.markVariableCheckedForTesting('result');
        expect(visitor.checkedVariablesForTesting, contains('result'));
      });

      test('reset clears all state', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result');
        visitor.markVariableCheckedForTesting('result');
        visitor.resetForTesting();

        expect(visitor.queryResultVariablesForTesting, isEmpty);
        expect(visitor.checkedVariablesForTesting, isEmpty);
      });

      test('tracks multiple variables independently', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result1');
        visitor.addQueryResultVariableForTesting('result2');
        visitor.markVariableCheckedForTesting('result1');

        expect(visitor.checkedVariablesForTesting, contains('result1'));
        expect(visitor.checkedVariablesForTesting, isNot(contains('result2')));
      });
    });

    group('Static Helper Methods', () {
      test('isQueryResultTypeName matches exact QueryResult', () {
        expect(TalawaQueryResultVisitor.isQueryResultTypeName('QueryResult'),
            true);
        expect(
            TalawaQueryResultVisitor.isQueryResultTypeName(
                'QueryResult<Object?>'),
            true);
      });

      test('isQueryResultTypeName rejects similar types', () {
        expect(
            TalawaQueryResultVisitor.isQueryResultTypeName(
                'QueryResultBuilder'),
            false);
        expect(TalawaQueryResultVisitor.isQueryResultTypeName('MyQueryResult'),
            false);
      });

      test('isFromGraphqlPackage validates package sources', () {
        expect(
            TalawaQueryResultVisitor.isFromGraphqlPackage(
                'package:graphql_flutter/graphql_flutter.dart'),
            true);
        expect(
            TalawaQueryResultVisitor.isFromGraphqlPackage(
                'package:graphql/client.dart'),
            true);
        expect(
            TalawaQueryResultVisitor.isFromGraphqlPackage(
                'package:other/query.dart'),
            false);
      });

      test('isExceptionProperty identifies exception checks', () {
        expect(
            TalawaQueryResultVisitor.isExceptionProperty('hasException'), true);
        expect(TalawaQueryResultVisitor.isExceptionProperty('exception'), true);
        expect(TalawaQueryResultVisitor.isExceptionProperty('data'), false);
      });

      test('isDataProperty identifies data property', () {
        expect(TalawaQueryResultVisitor.isDataProperty('data'), true);
        expect(TalawaQueryResultVisitor.isDataProperty('hasData'), false);
      });
    });

    group('File Exclusion', () {
      test('excludes test files', () {
        expect(rule.isTestFileForTesting('/test/widget_test.dart'), true);
        expect(rule.isTestFileForTesting('/project/test/unit_test.dart'), true);
        expect(rule.isTestFileForTesting('/lib/service.dart'), false);
      });

      test('excludes generated files', () {
        expect(rule.isGeneratedFileForTesting('model.g.dart'), true);
        expect(rule.isGeneratedFileForTesting('setup.mocks.dart'), true);
        expect(rule.isGeneratedFileForTesting('service.dart'), false);
      });

      test('handles Windows paths', () {
        expect(rule.isTestFileForTesting('C:\\test\\widget_test.dart'), true);
      });
    });

    group('LintCode Configuration', () {
      test('has correct rule name', () {
        expect(rule.code.name, 'talawa_query_result_check');
      });

      test('has descriptive messages', () {
        expect(rule.code.problemMessage,
            'QueryResult.data accessed without checking hasException first.');
        expect(rule.code.correctionMessage,
            'Add an if (result.hasException) check before accessing data.');
      });

      test('has WARNING severity', () {
        expect(rule.code.errorSeverity.name, 'WARNING');
      });
    });

    group('AST Traversal', () {
      test('can parse and traverse code without error', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        const code = '''
void test() {
  var x = 1;
}
''';
        final parseResult = parseString(content: code);

        // Should not throw
        for (final decl in parseResult.unit.declarations) {
          decl.accept(visitor);
        }
      });

      test('handles empty code', () {
        const code = '';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty);
      });

      test('handles nested expressions', () {
        const code = 'var x = a.b.c.data;';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty);
      });
    });

    group('Edge Cases', () {
      test('duplicate variable tracking uses Set', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result');
        visitor.addQueryResultVariableForTesting('result');

        expect(visitor.queryResultVariablesForTesting.length, 1);
      });

      test('untracked variables do not cause violations', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Don't track any variables
        const code = 'var x = result.data;';
        final parseResult = parseString(content: code);
        parseResult.unit.accept(visitor);

        // No violations for untracked variables
        expect(mockReporter.reportedNodes, isEmpty);
      });
    });
  });
}

/// Mock error reporter that captures nodes reported via atNode
class _MockErrorReporter implements ErrorReporter {
  final List<AstNode> reportedNodes = [];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #atNode) {
      final node = invocation.positionalArguments[0] as AstNode;
      reportedNodes.add(node);
    }
    return null;
  }
}
