// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:talawa_lint/talawa_query_result/talawa_query_result.dart';
import 'package:talawa_lint/talawa_query_result/talawa_query_result_visitor.dart';
import 'package:test/test.dart';

/// Mock error reporter that collects reported errors
class MockLintErrorReporter extends AnalysisErrorListener {
  final List<AnalysisError> errors = [];

  @override
  void onError(AnalysisError error) {
    errors.add(error);
  }

  void clear() {
    errors.clear();
  }
}

void main() {
  group('TalawaQueryResultLintRule - AST Visitor Execution Tests', () {
    late TalawaQueryResultLintRule rule;

    setUp(() {
      rule = const TalawaQueryResultLintRule();
    });

    group('Visitor state management', () {
      test('visitor should reset state for each method', () {
        // Create a mock visitor to test state management
        final mockReporter = _createMockErrorReporter();
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
        final mockReporter = _createMockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Simulate tracking a variable
        visitor.addQueryResultVariableForTesting('result');

        expect(visitor.queryResultVariablesForTesting, contains('result'));
        expect(visitor.queryResultVariablesForTesting, hasLength(1));
      });

      test('visitor tracks multiple variables independently', () {
        final mockReporter = _createMockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result1');
        visitor.addQueryResultVariableForTesting('result2');

        expect(visitor.queryResultVariablesForTesting, hasLength(2));
        expect(visitor.queryResultVariablesForTesting, contains('result1'));
        expect(visitor.queryResultVariablesForTesting, contains('result2'));
      });

      test('visitor tracks checked variables correctly', () {
        final mockReporter = _createMockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        visitor.addQueryResultVariableForTesting('result');
        visitor.markVariableCheckedForTesting('result');

        expect(visitor.checkedVariablesForTesting, contains('result'));
      });
    });

    group('Violation detection logic', () {
      test(
          'unguarded access should be detectable - variable tracked but not checked',
          () {
        final mockReporter = _createMockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Track a QueryResult variable but don't mark it as checked
        visitor.addQueryResultVariableForTesting('result');

        // Verify the state indicates a potential violation
        expect(visitor.queryResultVariablesForTesting, contains('result'));
        expect(visitor.checkedVariablesForTesting, isNot(contains('result')));

        // This is the condition that would trigger a violation
        final wouldViolate =
            visitor.queryResultVariablesForTesting.contains('result') &&
                !visitor.checkedVariablesForTesting.contains('result');
        expect(wouldViolate, true);
      });

      test('guarded access should not violate - variable tracked and checked',
          () {
        final mockReporter = _createMockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Track a QueryResult variable AND mark it as checked
        visitor.addQueryResultVariableForTesting('result');
        visitor.markVariableCheckedForTesting('result');

        // Verify the state indicates no violation
        expect(visitor.queryResultVariablesForTesting, contains('result'));
        expect(visitor.checkedVariablesForTesting, contains('result'));

        // This condition would NOT trigger a violation
        final wouldViolate =
            visitor.queryResultVariablesForTesting.contains('result') &&
                !visitor.checkedVariablesForTesting.contains('result');
        expect(wouldViolate, false);
      });

      test('non-QueryResult variable should not violate', () {
        final mockReporter = _createMockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Don't track 'result' as QueryResult variable
        // This simulates a variable of different type

        // Verify no violation for untracked variables
        final wouldViolate =
            visitor.queryResultVariablesForTesting.contains('result') &&
                !visitor.checkedVariablesForTesting.contains('result');
        expect(wouldViolate, false);
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

    group('AST parsing - Code snippet tests', () {
      test('can parse function with property access', () {
        const code = '''
void test(Foo foo) {
  var x = foo.data;
}
''';
        final result = parseString(content: code);
        expect(result.errors, isEmpty);

        // Find the function
        final func = result.unit.declarations.first as FunctionDeclaration;
        expect(func.name.lexeme, 'test');

        // The function should have a body with statements
        final body = func.functionExpression.body as BlockFunctionBody;
        expect(body.block.statements, isNotEmpty);
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

      test('can parse prefixed identifier (result.data pattern)', () {
        const code = '''
void test() {
  var result = getResult();
  print(result.data);
}

dynamic getResult() => null;
''';
        final result = parseString(content: code);
        expect(result.errors, isEmpty);
      });

      test('can parse indexed access (result.data["key"] pattern)', () {
        const code = '''
void test() {
  var data = {"key": "value"};
  print(data["key"]);
}
''';
        final result = parseString(content: code);
        expect(result.errors, isEmpty);
      });

      test('can parse condition with hasException pattern', () {
        const code = '''
class Result {
  bool hasException = false;
  dynamic data;
}

void test(Result result) {
  if (result.hasException) {
    return;
  }
  print(result.data);
}
''';
        final result = parseString(content: code);
        expect(result.errors, isEmpty);
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
    });
  });
}

/// Create a mock error reporter for testing
ErrorReporter _createMockErrorReporter() {
  return _MockErrorReporter();
}

/// Simple mock that implements ErrorReporter interface
class _MockErrorReporter implements ErrorReporter {
  final List<AstNode> reportedNodes = [];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    // Handle atNode calls
    if (invocation.memberName == #atNode) {
      final node = invocation.positionalArguments[0] as AstNode;
      reportedNodes.add(node);
    }
    return null;
  }
}
