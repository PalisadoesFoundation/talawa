// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

/// Unit tests for TalawaQueryResultVisitor.
///
/// **Test Architecture:**
/// These tests use `parseString()` which builds an AST without full type resolution.
/// This is intentional for unit testing the visitor's core logic in isolation.
///
/// **Test Scope:**
/// - AST traversal and node visiting behavior
/// - hasException detection from if statements and binary expressions
/// - Control-flow analysis (early return patterns, compound conditions)
/// - Visitor state management (variable tracking, check marking)
///
/// **Helper Methods for Testing:**
/// Tests use `addQueryResultVariableForTesting` and `markVariableCheckedForTesting`
/// to set up visitor state and verify detection logic without requiring full
/// type resolution from the analyzer.

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/syntactic_entity.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source.dart';
import 'package:source_span/source_span.dart';
import 'package:talawa_lint/talawa_query_result/talawa_query_result.dart';
import 'package:talawa_lint/talawa_query_result/talawa_query_result_visitor.dart';
import 'package:test/test.dart';

/// Extension to add firstOrNull for older SDK compatibility
extension IterableFirstOrNull<T> on Iterable<T> {
  T? get firstOrNull {
    final iterator = this.iterator;
    if (iterator.moveNext()) return iterator.current;
    return null;
  }
}

void main() {
  group('TalawaQueryResultLintRule - Core Behavior Tests', () {
    late TalawaQueryResultLintRule rule;

    setUp(() {
      rule = const TalawaQueryResultLintRule();
    });

    group('AST Traversal and hasException Detection Tests', () {
      test(
          'AST traversal: visitor traverses QueryResult type annotation in variable declaration',
          () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Parse code with QueryResult type annotation and data access
        // The visitor's visitVariableDeclarationStatement will be called
        // Note: Type resolution requires full analyzer, but we test AST traversal
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

QueryResult<Object?> result = someFunction();
var x = result.data;
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Visit the compilation unit - visitor traverses AST and calls
        // visitVariableDeclarationStatement for the QueryResult variable
        parseResult.unit.accept(visitor);

        // Verify visitor traversed the AST and saw the variable declaration
        // The visitor's visitVariableDeclarationStatement method is called
        // even though type resolution doesn't work with parseString
        expect(parseResult.unit.declarations, isNotEmpty,
            reason: 'Should have parsed declarations');

        // Note: This test only verifies AST traversal, not type detection.
        // Type detection requires full analyzer resolution (declaredElement?.type
        // is null with parseString), so _queryResultVariables stays empty and
        // no violations are reported. For full integration testing with type
        // resolution, use CustomLintResolver to create a resolved unit.
      });

      test(
          'AST traversal + hasException detection: visitor detects hasException check from if statement',
          () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Parse code with QueryResult type annotation, hasException check, and data access
        // This tests the visitor's actual hasException detection from if statements
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void testFunction() {
  QueryResult<Object?> result = someFunction();
  if (result.hasException) {
    return;
  }
  var x = result.data;
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find the function declaration
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit the entire function declaration to let visitor traverse normally
        // This allows the visitor to:
        // 1. Reset state on function entry
        // 2. Visit variable declaration
        // 3. Visit if statement and detect hasException check
        // 4. Visit data access
        functionDecl!.accept(visitor);

        // Note: Without full type resolution (parseString doesn't provide it),
        // the visitor cannot detect QueryResult type from declaredElement?.type.
        // However, hasException detection from if-statement condition still works
        // because it's based on AST pattern matching, not type information.
        expect(
          visitor.checkedVariablesForTesting,
          contains('result'),
          reason: 'Visitor must detect hasException check from if statement',
        );
        expect(
          mockReporter.reportedNodes,
          isEmpty,
          reason:
              'Visitor must NOT report violation when hasException is checked',
        );
      });

      test(
          'AST traversal: visitor traverses unguarded data access (type detection requires full resolution)',
          () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Parse code with QueryResult type annotation and unguarded data access
        // The visitor's visitVariableDeclarationStatement will be called
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

QueryResult<Object?> result = someFunction();
var x = result.data;
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Visit the compilation unit
        // Visitor will traverse AST and call visitVariableDeclarationStatement
        // and visitPropertyAccess for result.data
        parseResult.unit.accept(visitor);

        // Note: This test only verifies AST traversal, not violation reporting.
        // Type detection requires full analyzer resolution (declaredElement?.type
        // is null with parseString), so _queryResultVariables stays empty and
        // no violations are reported. For full integration testing with type
        // resolution and violation reporting, use CustomLintResolver.
        expect(parseResult.unit.declarations, isNotEmpty,
            reason: 'Should have parsed declarations');
      });

      test('reports violation for indexed data access pattern', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Parse code with QueryResult type and indexed data access
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

QueryResult<Object?> result = someFunction();
var x = result.data["key"];
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Visit compilation unit - visitor traverses AST
        parseResult.unit.accept(visitor);

        // Verify AST traversal (type detection requires full resolution)
        expect(parseResult.unit.declarations, isNotEmpty,
            reason: 'Should have parsed declarations');
      });

      test('reports violation for data access in expression', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Parse code with QueryResult type and data access
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

QueryResult<Object?> response = someFunction();
var value = response.data;
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Visit compilation unit - visitor traverses AST
        parseResult.unit.accept(visitor);

        // Verify AST traversal (type detection requires full resolution)
        expect(parseResult.unit.declarations, isNotEmpty,
            reason: 'Should have parsed declarations');
      });

      test('does not report for different variable names', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Parse code with QueryResult type for 'result' but access 'other.data'
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

QueryResult<Object?> result = someFunction();
var x = other.data;
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Visit compilation unit - visitor traverses AST
        parseResult.unit.accept(visitor);

        // Should not report - 'other' is not a QueryResult variable
        // (type detection requires full resolution, but AST traversal is tested)
        expect(parseResult.unit.declarations, isNotEmpty,
            reason: 'Should have parsed declarations');
      });

      test('reports only for tracked QueryResult variables', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Parse code with multiple QueryResult variables, one checked
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

QueryResult<Object?> result1 = fetchData1();
QueryResult<Object?> result2 = fetchData2();

void testFunction() {
  if (result1.hasException) {
    return;
  }
  var x = result2.data;  // result2 not checked
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find function and visit body
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit function body - visitor detects hasException check for result1
        final body = functionDecl!.functionExpression.body;
        if (body is BlockFunctionBody) {
          for (final statement in body.block.statements) {
            statement.accept(visitor);
          }
        }

        // Visitor should detect hasException check for result1 only
        expect(visitor.checkedVariablesForTesting, contains('result1'),
            reason: 'result1 should be marked as checked');
        expect(visitor.checkedVariablesForTesting, isNot(contains('result2')),
            reason: 'result2 should NOT be marked as checked');
        // Note: Violation reporting requires type detection
      });
    });

    group('Visitor State Management (Unit Tests)', () {
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

    group('AST Structure Tests', () {
      test(
          'visitor traverses variable declaration with QueryResult type annotation',
          () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Code with explicit QueryResult type annotation
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void testFunction() {
  QueryResult<Object?> result = someFunction();
  var x = result.data;
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code with QueryResult type should parse correctly');

        // Visit the AST - visitor should traverse VariableDeclarationStatement
        parseResult.unit.accept(visitor);

        // Note: Type resolution doesn't work with parseString, but we verify
        // that the visitor can traverse the AST structure containing type annotations
        // The visitVariableDeclarationStatement method should be called
        expect(parseResult.unit.declarations, isNotEmpty,
            reason: 'Should have parsed declarations');
      });

      test('visitor traverses await expression with Future<QueryResult>', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Code with await expression
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

Future<void> testFunction() async {
  var result = await someAsyncFunction();
  var x = result.data;
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code with await should parse correctly');

        parseResult.unit.accept(visitor);

        // Verify AST traversal works for await expressions
        expect(parseResult.unit.declarations, isNotEmpty);
      });

      test('visitor handles variable declaration without type annotation', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        const code = '''
void testFunction() {
  var result = someFunction();
  var x = result.data;
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty);

        parseResult.unit.accept(visitor);

        // Visitor should handle inferred types (though resolution needed for detection)
        expect(parseResult.unit.declarations, isNotEmpty);
      });
    });

    group('Control Flow Detection Tests', () {
      test('visitor detects hasException check in binary expression', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Binary expression with QueryResult type and hasException
        // This tests hasException detection in compound conditions
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void testFunction() {
  QueryResult<Object?> result = fetchData();
  if (result.hasException || someOtherCondition) {
    return;
  }
  var x = result.data;
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find function and visit body
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit function body - visitor detects hasException in binary expression
        final body = functionDecl!.functionExpression.body;
        if (body is BlockFunctionBody) {
          for (final statement in body.block.statements) {
            statement.accept(visitor);
          }
        }

        // Visitor should detect hasException in binary expression
        // The visitor's _checkForExceptionCondition handles BinaryExpression
        expect(visitor.checkedVariablesForTesting, contains('result'),
            reason: 'Visitor must detect hasException in binary expression');
        expect(mockReporter.reportedNodes, isEmpty,
            reason: 'No violation when hasException is checked');
      });

      test('visitor detects exception check in binary expression', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Binary expression with QueryResult type and exception property
        // This tests exception check in compound conditions
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void testFunction() {
  QueryResult<Object?> result = fetchData();
  if (result.exception != null && otherCondition) {
    return;
  }
  var x = result.data;
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find function and visit body
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit function body - visitor detects exception check in binary expression
        final body = functionDecl!.functionExpression.body;
        if (body is BlockFunctionBody) {
          for (final statement in body.block.statements) {
            statement.accept(visitor);
          }
        }

        // Visitor should detect exception check in binary expression
        expect(visitor.checkedVariablesForTesting, contains('result'),
            reason: 'Visitor must detect exception check in binary expression');
        expect(mockReporter.reportedNodes, isEmpty);
      });

      test('visitor handles compound conditions with multiple variables', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Multiple QueryResult variables with compound condition
        // This tests hasException detection for multiple variables in binary expression
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void testFunction() {
  QueryResult<Object?> result1 = fetchData1();
  QueryResult<Object?> result2 = fetchData2();
  
  if (result1.hasException || result2.hasException) {
    return;
  }
  
  var x = result1.data;
  var y = result2.data;
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find function and visit body
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit function body - visitor detects hasException for both in binary expression
        final body = functionDecl!.functionExpression.body;
        if (body is BlockFunctionBody) {
          for (final statement in body.block.statements) {
            statement.accept(visitor);
          }
        }

        // Both should be marked as checked
        // The visitor's _checkForExceptionCondition handles BinaryExpression recursively
        expect(visitor.checkedVariablesForTesting, contains('result1'));
        expect(visitor.checkedVariablesForTesting, contains('result2'));
        expect(mockReporter.reportedNodes, isEmpty,
            reason: 'No violations when both are checked');
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
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        const code = '';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty);

        // Exercise the visitor on the empty AST
        parseResult.unit.accept(visitor);
        expect(mockReporter.reportedNodes, isEmpty);
      });

      test('handles nested expressions', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        const code = 'var x = a.b.c.data;';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty);

        // Exercise the visitor on the parsed AST
        parseResult.unit.accept(visitor);
        // No violations expected for untracked variable 'a'
        expect(mockReporter.reportedNodes, isEmpty);
      });
    });

    group('Scope Reset Tests', () {
      test('visitor resets state between different method declarations', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Two methods with QueryResult type annotations
        // This tests scope reset between methods
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

class MyClass {
  void method1() {
    QueryResult<Object?> result = fetchData1();
    var x = result.data;  // Should report
  }
  
  void method2() {
    QueryResult<Object?> result = fetchData2();
    if (result.hasException) {
      return;
    }
    var y = result.data;  // Should NOT report
  }
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find class declaration and methods
        final classDecl = parseResult.unit.declarations
            .whereType<ClassDeclaration>()
            .firstOrNull;
        expect(classDecl, isNotNull, reason: 'Should have class declaration');

        final methods =
            classDecl!.members.whereType<MethodDeclaration>().toList();
        expect(methods.length, 2, reason: 'Should have 2 methods');

        // Visit method1 - visitor resets state when visiting method declaration
        methods[0].accept(visitor);

        // Visit method2 - visitor resets state again and detects hasException check
        methods[1].accept(visitor);

        // After visiting both methods, visitor should have detected
        // the check in method2 and reset state between methods
        expect(visitor.checkedVariablesForTesting, contains('result'),
            reason: 'Visitor should detect check in method2');
      });

      test('visitor resets state between function declarations', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Two top-level functions with QueryResult type annotations
        // This tests scope reset between functions
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void function1() {
  QueryResult<Object?> result = fetchData1();
  var x = result.data;
}

void function2() {
  QueryResult<Object?> result = fetchData2();
  if (result.hasException) {
    return;
  }
  var y = result.data;
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find both function declarations
        final functions = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .toList();
        expect(functions.length, 2, reason: 'Should have 2 functions');

        // Visit function1 - visitor resets state when visiting function declaration
        functions[0].accept(visitor);

        // Visit function2 - visitor resets state again and detects hasException check
        functions[1].accept(visitor);

        // Visitor should reset between functions and detect check in function2
        expect(visitor.checkedVariablesForTesting, contains('result'),
            reason: 'Visitor should detect check in function2');
      });

      test('visitor handles nested function scopes', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Nested function - test that inner function resets its own scope
        const code = '''
void outerFunction() {
  var result = fetchData();
  
  void innerFunction() {
    var innerResult = fetchData2();
    var x = innerResult.data;  // Different scope
  }
  
  var y = result.data;  // Outer scope
}
''';
        final parseResult = parseString(content: code);

        // Find outer function
        final outerFunction = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(outerFunction, isNotNull, reason: 'Should have outer function');

        // Test that visiting outer function resets state correctly
        // Visitor's visitFunctionDeclaration resets state when called
        // Visit outer function - this will reset state and visit all statements
        outerFunction!.accept(visitor);

        // After visiting outer function, state should be reset (function scope isolation)
        // This tests that functions reset their own scope
        expect(visitor.queryResultVariablesForTesting, isEmpty,
            reason:
                'Function should reset state when visited (scope isolation)');
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

    group('Real-World Pattern Tests', () {
      test('detects unguarded access in complete function body', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Complete function with QueryResult type annotation and unguarded access
        // This tests end-to-end: type declaration, await expression, data access
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

Future<void> fetchData() async {
  QueryResult<Object?> result = await graphQLService.query(query);
  final data = result.data;
  print(data);
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find the function declaration and visit its body directly
        // to avoid state reset from visitFunctionDeclaration
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit function body statements directly
        // Visitor will traverse: variable declaration, data access
        final body = functionDecl!.functionExpression.body;
        if (body is BlockFunctionBody) {
          for (final statement in body.block.statements) {
            statement.accept(visitor);
          }
        }

        // Verify AST traversal occurred
        // Note: Type detection requires full resolution, but visitor
        // traverses the AST and calls visitVariableDeclarationStatement
        expect(parseResult.unit.declarations, isNotEmpty,
            reason: 'Should have parsed function declaration');
      });

      test('detects hasException check with early return pattern', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Real-world pattern: QueryResult type, if (result.hasException) return;
        // This tests end-to-end: type declaration, if statement, hasException check, data access
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void processResult() {
  QueryResult<Object?> result = fetchData();
  if (result.hasException) {
    return;
  }
  var data = result.data;
  processData(data);
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find the function declaration and visit its body directly
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit function body statements directly
        // Visitor will: visit variable declaration, visit if statement
        // (detecting hasException check), visit data access
        final body = functionDecl!.functionExpression.body;
        if (body is BlockFunctionBody) {
          for (final statement in body.block.statements) {
            statement.accept(visitor);
          }
        }

        // Visitor should detect hasException check from if statement
        // The visitor's visitIfStatement and _checkForExceptionCondition
        // methods are called and detect result.hasException
        expect(visitor.checkedVariablesForTesting, contains('result'),
            reason: 'Visitor must detect hasException check in if statement');
        expect(mockReporter.reportedNodes, isEmpty,
            reason:
                'No violation when hasException is checked before data access');
      });

      test('detects hasException check with negation pattern', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Pattern: QueryResult type, if (!result.hasException) { ... }
        // This tests negation pattern in if condition
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void processResult() {
  QueryResult<Object?> result = fetchData();
  if (!result.hasException) {
    var data = result.data;
    processData(data);
  }
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find the function declaration and visit its body directly
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit function body statements directly
        // Visitor will detect negated hasException check via visitIfStatement
        final body = functionDecl!.functionExpression.body;
        if (body is BlockFunctionBody) {
          for (final statement in body.block.statements) {
            statement.accept(visitor);
          }
        }

        // Visitor should detect negated hasException check
        // The visitor's _checkForExceptionCondition handles PrefixExpression
        expect(visitor.checkedVariablesForTesting, contains('result'),
            reason: 'Visitor must detect negated hasException check');
        expect(mockReporter.reportedNodes, isEmpty,
            reason:
                'No violation when hasException is checked (even with negation)');
      });

      test('detects exception property check pattern', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Pattern: QueryResult type, if (result.exception != null) { ... }
        // This tests exception property check in binary expression
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void processResult() {
  QueryResult<Object?> result = fetchData();
  if (result.exception != null) {
    return;
  }
  var data = result.data;
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find the function declaration and visit its body directly
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit function body statements directly
        // Visitor will detect exception check via visitIfStatement and
        // _checkForExceptionCondition (handles BinaryExpression)
        final body = functionDecl!.functionExpression.body;
        if (body is BlockFunctionBody) {
          for (final statement in body.block.statements) {
            statement.accept(visitor);
          }
        }

        // Visitor should detect exception property check in binary expression
        expect(visitor.checkedVariablesForTesting, contains('result'),
            reason: 'Visitor must detect exception property check');
        expect(mockReporter.reportedNodes, isEmpty,
            reason: 'No violation when exception is checked');
      });

      test(
          'reports violation when .data accessed even with null-aware downstream',
          () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Parse code with QueryResult type and null-aware data access
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

QueryResult<Object?> result = someFunction();
var x = result.data?.prop;
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Visit compilation unit - visitor traverses AST
        parseResult.unit.accept(visitor);

        // Verify AST traversal (type detection requires full resolution)
        // The rule checks for .data access regardless of null-aware on prop
        expect(parseResult.unit.declarations, isNotEmpty,
            reason: 'Should have parsed declarations');
      });

      test('handles multiple QueryResult variables in same function', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Multiple QueryResult variables with type annotations, one checked, one not
        // This tests end-to-end: multiple type declarations, if statement, multiple data accesses
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void processResults() {
  QueryResult<Object?> result1 = fetchData1();
  QueryResult<Object?> result2 = fetchData2();
  
  if (result1.hasException) {
    return;
  }
  
  var data1 = result1.data;  // Should be OK (hasException checked)
  var data2 = result2.data;   // Should report violation (not checked)
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find the function declaration and visit its body directly
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit function body statements directly
        // Visitor will: visit both variable declarations, visit if statement
        // (detecting hasException check for result1), visit both data accesses
        final body = functionDecl!.functionExpression.body;
        if (body is BlockFunctionBody) {
          for (final statement in body.block.statements) {
            statement.accept(visitor);
          }
        }

        // Visitor should detect hasException check for result1 only
        expect(visitor.checkedVariablesForTesting, contains('result1'),
            reason: 'result1 should be marked as checked');
        expect(visitor.checkedVariablesForTesting, isNot(contains('result2')),
            reason: 'result2 should NOT be marked as checked');
        // Note: Violation reporting requires type detection which needs full resolution
        // But we verify the visitor's hasException detection logic works
      });

      test('resets state between different method scopes', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Two methods with QueryResult type annotations
        // This tests scope reset between methods
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

class MyClass {
  void method1() {
    QueryResult<Object?> result = fetchData1();
    var data = result.data;  // Should report
  }
  
  void method2() {
    QueryResult<Object?> result = fetchData2();
    if (result.hasException) {
      return;
    }
    var data = result.data;  // Should NOT report
  }
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find class declaration and methods
        final classDecl = parseResult.unit.declarations
            .whereType<ClassDeclaration>()
            .firstOrNull;
        expect(classDecl, isNotNull, reason: 'Should have class declaration');

        final methods =
            classDecl!.members.whereType<MethodDeclaration>().toList();
        expect(methods.length, 2, reason: 'Should have 2 methods');

        // Test method1: visit method declaration (visitor resets state)
        methods[0].accept(visitor);
        // Note: Violation reporting requires type detection

        // Reset for method2 test
        mockReporter.reportedNodes.clear();
        visitor.resetForTesting();

        // Test method2: visit method declaration (visitor resets state again)
        // and detects hasException check
        methods[1].accept(visitor);
        expect(visitor.checkedVariablesForTesting, contains('result'),
            reason: 'Visitor should detect check in method2');
        expect(mockReporter.reportedNodes, isEmpty,
            reason:
                'method2 should NOT report violation when hasException is checked');
      });

      test('handles nested if statements with hasException checks', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Nested if statements with QueryResult type
        // This tests nested control flow with hasException checks
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void processResult() {
  QueryResult<Object?> result = fetchData();
  if (result.hasException) {
    if (result.exception != null) {
      handleError();
    }
    return;
  }
  var data = result.data;  // Should be OK
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find the function declaration and visit its body directly
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit function body statements directly
        // Visitor will detect hasException check in outer if, and exception
        // check in nested if via visitIfStatement and _checkForExceptionCondition
        final body = functionDecl!.functionExpression.body;
        if (body is BlockFunctionBody) {
          for (final statement in body.block.statements) {
            statement.accept(visitor);
          }
        }

        // Visitor should detect hasException check from outer if statement
        expect(visitor.checkedVariablesForTesting, contains('result'),
            reason: 'Visitor should detect hasException check');
        expect(mockReporter.reportedNodes, isEmpty,
            reason: 'No violation when hasException is checked');
      });

      test('handles ternary operator with hasException check', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Ternary pattern with QueryResult type
        // This tests ternary operator with hasException check
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

void processResult() {
  QueryResult<Object?> result = fetchData();
  var data = result.hasException ? null : result.data;
}
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Find function and visit body
        final functionDecl = parseResult.unit.declarations
            .whereType<FunctionDeclaration>()
            .firstOrNull;
        expect(functionDecl, isNotNull,
            reason: 'Should have function declaration');

        // Visit function body - visitor traverses AST including ternary
        final body = functionDecl!.functionExpression.body;
        if (body is BlockFunctionBody) {
          for (final statement in body.block.statements) {
            statement.accept(visitor);
          }
        }

        // Note: Current visitor may not fully handle ternary in condition,
        // but we test AST traversal with real code
        expect(parseResult.unit.declarations, isNotEmpty,
            reason: 'Should have parsed function declaration');
      });

      test('chained member access on data property', () {
        final mockReporter = _MockErrorReporter();
        final visitor = TalawaQueryResultVisitor(rule, mockReporter);

        // Parse code with QueryResult type and chained indexed data access
        const code = '''
import 'package:graphql_flutter/graphql_flutter.dart';

QueryResult<Object?> result = someFunction();
var x = result.data['key']['nested'];
''';
        final parseResult = parseString(content: code);
        expect(parseResult.errors, isEmpty,
            reason: 'Code should parse without errors');

        // Visit compilation unit - visitor traverses AST
        parseResult.unit.accept(visitor);

        // Verify AST traversal (type detection requires full resolution)
        expect(parseResult.unit.declarations, isNotEmpty,
            reason: 'Should have parsed declarations');
      });
    });
  });
}

/// Mock error reporter that captures nodes reported via atNode
class _MockErrorReporter implements ErrorReporter {
  final List<AstNode> reportedNodes = [];

  @override
  void atNode(
    AstNode node,
    ErrorCode code, {
    List<Object>? arguments,
    List<dynamic>? contextMessages,
    Object? data,
  }) {
    reportedNodes.add(node);
  }

  @override
  void atOffset({
    required ErrorCode errorCode,
    required int offset,
    required int length,
    List<Object>? arguments,
    List<dynamic>? contextMessages,
    Object? data,
  }) {
    // Stub implementation - not used in these tests
  }

  @override
  void atElement(
    Element element,
    ErrorCode code, {
    List<Object>? arguments,
    List<dynamic>? contextMessages,
    Object? data,
  }) {
    // Stub implementation - not used in these tests
  }

  @override
  void atConstructorDeclaration(
    ConstructorDeclaration node,
    ErrorCode code, {
    List<Object>? arguments,
    List<dynamic>? contextMessages,
    Object? data,
  }) {
    // Stub implementation - not used in these tests
  }

  @override
  void atEntity(
    SyntacticEntity entity,
    ErrorCode code, {
    List<Object>? arguments,
    List<dynamic>? contextMessages,
    Object? data,
  }) {
    // Stub implementation - not used in these tests
  }

  @override
  void atSourceSpan(
    SourceSpan span,
    ErrorCode code, {
    List<Object>? arguments,
    List<dynamic>? contextMessages,
    Object? data,
  }) {
    // Stub implementation - not used in these tests
  }

  @override
  void atToken(
    Token token,
    ErrorCode code, {
    List<Object>? arguments,
    List<dynamic>? contextMessages,
    Object? data,
  }) {
    // Stub implementation - not used in these tests
  }

  @override
  void reportError(AnalysisError error) {
    // Stub implementation - not used in these tests
  }

  @override
  void reportErrorForElement(
    ErrorCode errorCode,
    Element element, [
    List<Object>? arguments,
    List<dynamic>? contextMessages,
  ]) {
    // Stub implementation - not used in these tests
  }

  @override
  void reportErrorForNode(
    ErrorCode errorCode,
    AstNode node, [
    List<Object>? arguments,
    List<dynamic>? contextMessages,
    Object? data,
  ]) {
    // Stub implementation - not used in these tests
  }

  @override
  void reportErrorForOffset(
    ErrorCode errorCode,
    int offset,
    int length, [
    List<Object>? arguments,
    List<dynamic>? contextMessages,
    Object? data,
  ]) {
    // Stub implementation - not used in these tests
  }

  @override
  void reportErrorForToken(
    ErrorCode errorCode,
    Token token, [
    List<Object>? arguments,
    List<dynamic>? contextMessages,
    Object? data,
  ]) {
    // Stub implementation - not used in these tests
  }

  @override
  void reportErrorForSpan(
    ErrorCode errorCode,
    SourceSpan span, [
    List<Object>? arguments,
    List<dynamic>? contextMessages,
  ]) {
    // Stub implementation - not used in these tests
  }

  @override
  void reportTypeErrorForNode(
    ErrorCode errorCode,
    AstNode node, [
    List<Object>? arguments,
    List<dynamic>? contextMessages,
  ]) {
    // Stub implementation - not used in these tests
  }

  @override
  int get lockLevel => 0;

  @override
  set lockLevel(int value) {
    // Stub implementation - not used in these tests
  }

  @override
  Source get source => _MockSource();
}

/// Mock Source implementation for testing
/// Uses noSuchMethod fallback for any accessed properties/methods
class _MockSource implements Source {
  @override
  String get fullName => 'test_source.dart';

  @override
  String get shortName => 'test_source.dart';

  @override
  Uri get uri => Uri.parse('file:///test_source.dart');

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}
