// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// A visitor that checks for QueryResult.data access without hasException check.
///
/// This visitor analyzes each function/method body and:
/// 1. Tracks all variables that are of type QueryResult from graphql_flutter
/// 2. Tracks when hasException or exception is checked on those variables
/// 3. Reports an error when .data is accessed without a prior check
///
/// Known limitations:
/// - Control flow analysis is limited (early return patterns may not be detected)
/// - Branch scoping is not tracked (check in one branch doesn't protect sibling branches)
class TalawaQueryResultVisitor extends RecursiveAstVisitor<void> {
  TalawaQueryResultVisitor(this.rule, this.reporter);

  final DartLintRule rule;
  final ErrorReporter reporter;

  /// Tracks variable names that have been checked for hasException/exception
  final Set<String> _checkedVariables = {};

  /// Tracks variable names that are of type QueryResult
  final Set<String> _queryResultVariables = {};

  /// Tracks nodes that have already been reported to avoid duplicates
  final Set<int> _reportedNodes = {};

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    // Reset tracking for each method
    _checkedVariables.clear();
    _queryResultVariables.clear();
    _reportedNodes.clear();
    super.visitMethodDeclaration(node);
  }

  @override
  void visitFunctionDeclaration(FunctionDeclaration node) {
    // Reset tracking for each function
    _checkedVariables.clear();
    _queryResultVariables.clear();
    _reportedNodes.clear();
    super.visitFunctionDeclaration(node);
  }

  @override
  void visitVariableDeclarationStatement(VariableDeclarationStatement node) {
    // Track QueryResult variable declarations
    for (final variable in node.variables.variables) {
      // Check the static type of the variable
      final type = variable.declaredElement?.type;
      if (type != null && _isQueryResultType(type)) {
        _queryResultVariables.add(variable.name.lexeme);
      }

      // Also check the initializer expression type
      final initializer = variable.initializer;
      if (initializer != null) {
        final initType = initializer.staticType;
        if (initType != null && _isQueryResultType(initType)) {
          _queryResultVariables.add(variable.name.lexeme);
        }

        // Check if this is an await expression
        if (initializer is AwaitExpression) {
          final awaitedType = initializer.expression.staticType;
          // Check if the awaited type is Future<QueryResult>
          if (awaitedType != null && _isFutureQueryResult(awaitedType)) {
            _queryResultVariables.add(variable.name.lexeme);
          }
        }
      }
    }
    super.visitVariableDeclarationStatement(node);
  }

  /// Check if a type is QueryResult from graphql_flutter package.
  ///
  /// This method checks both the type name and its source library to ensure
  /// we only match QueryResult from the graphql_flutter package, not similar
  /// types from other packages like QueryResultBuilder or custom types.
  bool _isQueryResultType(DartType type) {
    // Check if type name is exactly QueryResult (not QueryResultBuilder, etc.)
    final element = type.element;
    if (element == null) return false;

    final typeName = element.name;
    if (typeName != 'QueryResult') return false;

    // Verify it comes from graphql_flutter package
    final librarySource = element.library?.source.uri.toString() ?? '';
    return librarySource.contains('graphql_flutter') ||
        librarySource.contains('graphql/');
  }

  /// Check if a type is Future<QueryResult> from graphql_flutter package.
  bool _isFutureQueryResult(DartType type) {
    if (type is! InterfaceType) return false;

    // Check if it's a Future
    if (type.element.name != 'Future') return false;

    // Check if the type argument is QueryResult
    final typeArgs = type.typeArguments;
    if (typeArgs.isEmpty) return false;

    return _isQueryResultType(typeArgs.first);
  }

  @override
  void visitIfStatement(IfStatement node) {
    // Check if this is a hasException or exception check
    final condition = node.expression;
    _checkForExceptionCondition(condition);
    super.visitIfStatement(node);
  }

  void _checkForExceptionCondition(Expression condition) {
    // Check for result.hasException
    if (condition is PrefixedIdentifier) {
      final propertyName = condition.identifier.name;
      if (propertyName == 'hasException' || propertyName == 'exception') {
        _checkedVariables.add(condition.prefix.name);
      }
    } else if (condition is PropertyAccess) {
      final propertyName = condition.propertyName.name;
      if (propertyName == 'hasException' || propertyName == 'exception') {
        final target = condition.target;
        if (target is SimpleIdentifier) {
          _checkedVariables.add(target.name);
        }
      }
    } else if (condition is BinaryExpression) {
      // Handle compound conditions like `result.hasException || ...`
      // Also handle `result.exception != null`
      _checkForExceptionCondition(condition.leftOperand);
      _checkForExceptionCondition(condition.rightOperand);
    } else if (condition is PrefixExpression) {
      // Handle negation like `!result.hasException`
      _checkForExceptionCondition(condition.operand);
    }
  }

  @override
  void visitPropertyAccess(PropertyAccess node) {
    _checkDataAccess(node);
    super.visitPropertyAccess(node);
  }

  @override
  void visitPrefixedIdentifier(PrefixedIdentifier node) {
    _checkDataAccessPrefixed(node);
    super.visitPrefixedIdentifier(node);
  }

  @override
  void visitIndexExpression(IndexExpression node) {
    // Check for result.data!['key'] or result.data?['key'] patterns
    final target = node.target;
    if (target is PostfixExpression) {
      // result.data! case
      final operand = target.operand;
      _checkOperandForDataAccess(operand, node);
    } else if (target is PropertyAccess) {
      // result.data?['key'] case
      if (target.propertyName.name == 'data') {
        final propTarget = target.target;
        if (propTarget is SimpleIdentifier) {
          _reportIfUnchecked(propTarget.name, node);
        }
      }
    } else if (target is PrefixedIdentifier) {
      if (target.identifier.name == 'data') {
        _reportIfUnchecked(target.prefix.name, node);
      }
    }
    super.visitIndexExpression(node);
  }

  void _checkOperandForDataAccess(Expression operand, AstNode reportNode) {
    if (operand is PrefixedIdentifier && operand.identifier.name == 'data') {
      _reportIfUnchecked(operand.prefix.name, reportNode);
    } else if (operand is PropertyAccess &&
        operand.propertyName.name == 'data') {
      final propTarget = operand.target;
      if (propTarget is SimpleIdentifier) {
        _reportIfUnchecked(propTarget.name, reportNode);
      }
    }
  }

  void _checkDataAccess(PropertyAccess node) {
    // Check for result.data access
    if (node.propertyName.name == 'data') {
      final target = node.target;
      if (target is SimpleIdentifier) {
        _reportIfUnchecked(target.name, node);
      }
    }
  }

  void _checkDataAccessPrefixed(PrefixedIdentifier node) {
    // Check for result.data access (prefixed form)
    if (node.identifier.name == 'data') {
      _reportIfUnchecked(node.prefix.name, node);
    }
  }

  /// Report error if variable is a QueryResult and hasn't been checked
  void _reportIfUnchecked(String variableName, AstNode node) {
    // Avoid duplicate reports for same node
    final nodeHash = node.offset;
    if (_reportedNodes.contains(nodeHash)) {
      return;
    }

    if (_queryResultVariables.contains(variableName) &&
        !_checkedVariables.contains(variableName)) {
      reporter.atNode(node, rule.code);
      _reportedNodes.add(nodeHash);
    }
  }

  // Static helper methods exposed for unit testing

  /// Check if type name matches QueryResult exactly (not QueryResultBuilder, etc.)
  static bool isQueryResultTypeName(String typeName) {
    return typeName == 'QueryResult' || typeName.startsWith('QueryResult<');
  }

  /// Check if library source is from graphql_flutter or graphql package.
  static bool isFromGraphqlPackage(String librarySource) {
    return librarySource.contains('graphql_flutter') ||
        librarySource.contains('graphql/');
  }

  /// Check if property name is an exception-related property.
  static bool isExceptionProperty(String propertyName) {
    return propertyName == 'hasException' || propertyName == 'exception';
  }

  /// Check if property name is the data property.
  static bool isDataProperty(String propertyName) {
    return propertyName == 'data';
  }
}
