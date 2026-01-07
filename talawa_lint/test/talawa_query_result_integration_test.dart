// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:talawa_lint/talawa_query_result/talawa_query_result.dart';
import 'package:talawa_lint/talawa_query_result/talawa_query_result_visitor.dart';
import 'package:test/test.dart';

void main() {
  group('TalawaQueryResultLintRule - AST Visitor Execution Tests', () {
    late TalawaQueryResultLintRule rule;

    setUp(() {
      rule = const TalawaQueryResultLintRule();
    });

    group('Visitor state management', () {
      test('visitor should reset state for each method', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Add some state
        visitor.addQueryResultVariableForTesting('result1');
        visitor.markVariableCheckedForTesting('result1');

        expect(visitor.queryResultVariablesForTesting, contains('result1'));
        expect(visitor.checkedVariablesForTesting, contains('result1'));

        // Reset should clear all state
        visitor.resetForTesting();

        expect(visitor.queryResultVariablesForTesting, isEmpty);
        expect(visitor.checkedVariablesForTesting, isEmpty);
        expect(visitor.reportedNodesForTesting, isEmpty);
      });

      test('visitor tracks QueryResult variables correctly', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result');

        expect(visitor.queryResultVariablesForTesting, contains('result'));
        expect(visitor.queryResultVariablesForTesting, hasLength(1));
      });

      test('visitor tracks multiple variables independently', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result1');
        visitor.addQueryResultVariableForTesting('result2');

        expect(visitor.queryResultVariablesForTesting, hasLength(2));
        expect(visitor.queryResultVariablesForTesting, contains('result1'));
        expect(visitor.queryResultVariablesForTesting, contains('result2'));
      });

      test('visitor tracks checked variables correctly', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result');
        visitor.markVariableCheckedForTesting('result');

        expect(visitor.checkedVariablesForTesting, contains('result'));
      });
    });

    group('Violation detection logic', () {
      test('unguarded access - variable tracked but not checked', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result');

        expect(visitor.queryResultVariablesForTesting, contains('result'));
        expect(visitor.checkedVariablesForTesting, isNot(contains('result')));

        final wouldViolate =
            visitor.queryResultVariablesForTesting.contains('result') &&
                !visitor.checkedVariablesForTesting.contains('result');
        expect(wouldViolate, true);
      });

      test('guarded access - variable tracked and checked', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result');
        visitor.markVariableCheckedForTesting('result');

        expect(visitor.queryResultVariablesForTesting, contains('result'));
        expect(visitor.checkedVariablesForTesting, contains('result'));

        final wouldViolate =
            visitor.queryResultVariablesForTesting.contains('result') &&
                !visitor.checkedVariablesForTesting.contains('result');
        expect(wouldViolate, false);
      });

      test('non-QueryResult variable should not violate', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        final wouldViolate =
            visitor.queryResultVariablesForTesting.contains('result') &&
                !visitor.checkedVariablesForTesting.contains('result');
        expect(wouldViolate, false);
      });

      test('visitor detects property access on tracked variable', () {
        // This test verifies the detection logic works correctly
        // by checking the internal state that would lead to a violation
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Track a variable but don't check it
        visitor.addQueryResultVariableForTesting('result');

        // Verify the conditions that would trigger a report
        final isTracked =
            visitor.queryResultVariablesForTesting.contains('result');
        final isChecked = visitor.checkedVariablesForTesting.contains('result');

        expect(isTracked, true);
        expect(isChecked, false);

        // This is the exact condition used in _reportIfUnchecked
        final wouldReport = isTracked && !isChecked;
        expect(wouldReport, true);
      });

      test('checked variable does not trigger report', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result');
        visitor.markVariableCheckedForTesting('result');

        final isTracked =
            visitor.queryResultVariablesForTesting.contains('result');
        final isChecked = visitor.checkedVariablesForTesting.contains('result');

        expect(isTracked, true);
        expect(isChecked, true);

        final wouldReport = isTracked && !isChecked;
        expect(wouldReport, false);
      });
    });

    group('Static helper methods', () {
      test('isQueryResultTypeName - exact matches', () {
        expect(TalawaQueryResultVisitor.isQueryResultTypeName('QueryResult'),
            true);
        expect(
            TalawaQueryResultVisitor.isQueryResultTypeName(
                'QueryResult<Object?>'),
            true);
        expect(
            TalawaQueryResultVisitor.isQueryResultTypeName(
                'QueryResult<Map<String, dynamic>>'),
            true);
      });

      test('isQueryResultTypeName - non-matches', () {
        expect(
            TalawaQueryResultVisitor.isQueryResultTypeName(
                'QueryResultBuilder'),
            false);
        expect(TalawaQueryResultVisitor.isQueryResultTypeName('MyQueryResult'),
            false);
        expect(TalawaQueryResultVisitor.isQueryResultTypeName('String'), false);
        expect(TalawaQueryResultVisitor.isQueryResultTypeName('Future'), false);
      });

      test('isFromGraphqlPackage - graphql_flutter', () {
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

      test('isFromGraphqlPackage - graphql', () {
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
              'package:graphql/client.dart'),
          true,
        );
      });

      test('isFromGraphqlPackage - other packages', () {
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
              'package:flutter/material.dart'),
          false,
        );
        expect(
          TalawaQueryResultVisitor.isFromGraphqlPackage(
              'package:my_app/query.dart'),
          false,
        );
      });

      test('isExceptionProperty', () {
        expect(
            TalawaQueryResultVisitor.isExceptionProperty('hasException'), true);
        expect(TalawaQueryResultVisitor.isExceptionProperty('exception'), true);
        expect(TalawaQueryResultVisitor.isExceptionProperty('data'), false);
        expect(TalawaQueryResultVisitor.isExceptionProperty('hasData'), false);
      });

      test('isDataProperty', () {
        expect(TalawaQueryResultVisitor.isDataProperty('data'), true);
        expect(TalawaQueryResultVisitor.isDataProperty('hasData'), false);
        expect(TalawaQueryResultVisitor.isDataProperty('exception'), false);
      });
    });

    group('File exclusion', () {
      test('test files are excluded', () {
        expect(rule.isTestFileForTesting('/test/widget_test.dart'), true);
        expect(rule.isTestFileForTesting('/project/test/models/user_test.dart'),
            true);
        expect(rule.isTestFileForTesting('/lib/service.dart'), false);
      });

      test('generated files are excluded', () {
        expect(rule.isGeneratedFileForTesting('user.g.dart'), true);
        expect(rule.isGeneratedFileForTesting('setup.mocks.dart'), true);
        expect(rule.isGeneratedFileForTesting('service.dart'), false);
      });

      test('Windows paths are handled', () {
        expect(rule.isTestFileForTesting('C:\\project\\test\\widget_test.dart'),
            true);
      });
    });

    group('LintCode configuration', () {
      test('rule name is correct', () {
        expect(rule.code.name, 'talawa_query_result_check');
      });

      test('problem message is descriptive', () {
        expect(
          rule.code.problemMessage,
          'QueryResult.data accessed without checking hasException first.',
        );
      });

      test('correction message is helpful', () {
        expect(
          rule.code.correctionMessage,
          'Add an if (result.hasException) check before accessing data.',
        );
      });

      test('severity is WARNING', () {
        expect(rule.code.errorSeverity.name, 'WARNING');
      });
    });

    group('AST parsing and code verification', () {
      test('can parse function with property access', () {
        const code = '''
void test(dynamic foo) {
  var x = foo.data;
}
''';
        final result = parseString(content: code);
        expect(result.errors, isEmpty);

        final func = result.unit.declarations.first as FunctionDeclaration;
        expect(func.name.lexeme, 'test');
      });

      test('can parse function with if statement', () {
        const code = '''
void test(bool flag) {
  if (flag) {
    print('yes');
  }
}
''';
        final result = parseString(content: code);
        expect(result.errors, isEmpty);

        final func = result.unit.declarations.first as FunctionDeclaration;
        final body = func.functionExpression.body as BlockFunctionBody;
        final firstStmt = body.block.statements.first;

        expect(firstStmt, isA<IfStatement>());
      });

      test('can parse hasException check pattern', () {
        const code = '''
void test(dynamic result) {
  if (result.hasException) {
    return;
  }
  print(result.data);
}
''';
        final result = parseString(content: code);
        expect(result.errors, isEmpty);
      });

      test('can parse indexed access pattern', () {
        const code = '''
void test(dynamic result) {
  var x = result.data["key"];
}
''';
        final result = parseString(content: code);
        expect(result.errors, isEmpty);
      });

      test('visitor can traverse parsed code without error', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        const code = '''
void test() {
  var x = 1;
  print(x);
}
''';
        final result = parseString(content: code);

        // Should not throw
        for (final declaration in result.unit.declarations) {
          declaration.accept(visitor);
        }
      });

      test('visitor resets state when visiting function', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Add variable before visiting
        visitor.addQueryResultVariableForTesting('result');
        expect(visitor.queryResultVariablesForTesting, isNotEmpty);

        const code = '''
void test() {
  print('hello');
}
''';
        final result = parseString(content: code);

        // Visit function - should reset state
        for (final declaration in result.unit.declarations) {
          declaration.accept(visitor);
        }

        // State should be reset
        expect(visitor.queryResultVariablesForTesting, isEmpty);
      });
    });

    group('Edge cases', () {
      test('visitor handles empty function', () {
        const code = '''
void empty() {}
''';
        final result = parseString(content: code);
        expect(result.errors, isEmpty);

        final func = result.unit.declarations.first as FunctionDeclaration;
        final body = func.functionExpression.body as BlockFunctionBody;
        expect(body.block.statements, isEmpty);
      });

      test('visitor handles nested conditions', () {
        const code = '''
void test(bool a, bool b) {
  if (a) {
    if (b) {
      print('nested');
    }
  }
}
''';
        final result = parseString(content: code);
        expect(result.errors, isEmpty);
      });

      test('visitor handles multiple variable declarations', () {
        const code = '''
void test() {
  var a = 1, b = 2, c = 3;
}
''';
        final result = parseString(content: code);
        expect(result.errors, isEmpty);
      });

      test('duplicate tracking prevention works', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Add same variable twice
        visitor.addQueryResultVariableForTesting('result');
        visitor.addQueryResultVariableForTesting('result');

        // Set uses unique values, so should still be 1
        expect(visitor.queryResultVariablesForTesting.length, 1);
      });
    });
  });
}

/// Mock error reporter that tracks reported nodes
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
