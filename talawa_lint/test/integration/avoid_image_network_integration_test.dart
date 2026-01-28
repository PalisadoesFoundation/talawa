// ignore_for_file: implementation_imports, invalid_use_of_visible_for_testing_member, avoid_implementing_value_types
import 'package:analyzer/dart/ast/token.dart'; // For TokenType
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/diagnostic/diagnostic.dart'; // For DiagnosticMessage
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source.dart';
import 'package:analyzer/src/dart/ast/ast.dart';
import 'package:analyzer/src/dart/ast/token.dart'; // For StringToken
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:talawa_lint/image_network_rule/avoid_image_network.dart';
import 'package:test/test.dart';

// Mocks
class MockCustomLintContext implements CustomLintContext {
  @override
  final MockLintRuleNodeRegistry registry = MockLintRuleNodeRegistry();

  @override
  void addPostRunCallback(void Function() callback) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockLintRuleNodeRegistry implements LintRuleNodeRegistry {
  final List<void Function(InstanceCreationExpression)>
      _instanceCreationListeners = [];

  @override
  void addInstanceCreationExpression(
      void Function(InstanceCreationExpression) listener) {
    _instanceCreationListeners.add(listener);
  }

  void simulateNodeVisit(InstanceCreationExpression node) {
    for (final listener in _instanceCreationListeners) {
      listener(node);
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockErrorReporter implements ErrorReporter {
  MockErrorReporter(this.source);

  final List<LintCode> reportedCodes = [];

  @override
  final Source source;

  @override
  void reportErrorForNode(
    ErrorCode errorCode,
    AstNode node, [
    List<Object?>? arguments,
    List<DiagnosticMessage>? messages,
    Object? data,
  ]) {
    if (errorCode is LintCode) {
      reportedCodes.add(errorCode);
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockCustomLintResolver implements CustomLintResolver {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockSource implements Source {
  MockSource(this.fullName);

  @override
  final String fullName;

  @override
  Uri get uri => Uri.parse('package:test/test.dart');

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockLibrarySource implements Source {
  MockLibrarySource(this._uri);

  final Uri _uri;

  @override
  Uri get uri => _uri;
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// Element types are usually interfaces, so we can mock them.
class MockElement implements Element {
  MockElement(this._name, this._library);

  final String? _name;
  final LibraryElement? _library;

  @override
  String? get name => _name;

  @override
  LibraryElement? get library => _library;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockLibraryElement implements LibraryElement {
  MockLibraryElement(this._source);

  final Source _source;

  @override
  Source get source => _source;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('AvoidImageNetworkLintRule Integration', () {
    late AvoidImageNetworkLintRule rule;
    late MockCustomLintContext context;
    late MockCustomLintResolver resolver;

    setUp(() {
      rule = const AvoidImageNetworkLintRule();
      context = MockCustomLintContext();
      resolver = MockCustomLintResolver();
    });

    InstanceCreationExpression createMockNode({
      String typeName = 'Image',
      String? constructorName = 'network',
      String libraryUri = 'package:flutter/src/widgets/image.dart',
    }) {
      // 1. Setup Elements
      final librarySource = MockLibrarySource(Uri.parse(libraryUri));
      final libraryElement = MockLibraryElement(librarySource);
      final element = MockElement(typeName, libraryElement);

      // 2. Setup AST Nodes using Impl classes

      // SimpleIdentifierImpl for constructor name (e.g. 'network')
      // SimpleIdentifierImpl wraps a Token.
      final nameNode = constructorName != null
          ? SimpleIdentifierImpl(
              StringToken(TokenType.STRING, constructorName, 0))
          : null;

      // NamedTypeImpl
      // name2 is a Token.
      final typeIdentifierToken = StringToken(TokenType.STRING, typeName, 0);

      final namedTypeNode = NamedTypeImpl(
        importPrefix: null,
        name2: typeIdentifierToken,
        typeArguments: null,
        question: null,
      );
      namedTypeNode.element = element;

      // ConstructorNameImpl
      final constructorNameNode = ConstructorNameImpl(
        type: namedTypeNode,
        period: nameNode != null ? Token(TokenType.PERIOD, 0) : null,
        name: nameNode,
      );

      // InstanceCreationExpressionImpl
      final instanceCreationNode = InstanceCreationExpressionImpl(
        keyword: null, // 'new' is optional
        constructorName: constructorNameNode,
        argumentList: ArgumentListImpl(
            leftParenthesis: Token(TokenType.OPEN_PAREN, 0),
            arguments: [],
            rightParenthesis: Token(TokenType.CLOSE_PAREN, 0)),
        typeArguments: null,
      );

      return instanceCreationNode;
    }

    test('reports error for Image.network usage', () {
      final source = MockSource('/lib/main.dart');
      final reporter = MockErrorReporter(source);

      // 1. Run the rule setup (registers callback)
      rule.run(resolver, reporter, context);

      // 2. Simulate AST visit with a violation node
      final node = createMockNode();
      context.registry.simulateNodeVisit(node);

      // 3. Assert error reported
      expect(
          reporter.reportedCodes,
          contains(isA<LintCode>()
              .having((c) => c.name, 'name', 'avoid_image_network')));
    });

    test('does NOT report error for excluded file (cached_image.dart)', () {
      final source = MockSource('/lib/widgets/common/cached_image.dart');
      final reporter = MockErrorReporter(source);

      rule.run(resolver, reporter, context);

      final node = createMockNode();
      context.registry.simulateNodeVisit(node);

      expect(reporter.reportedCodes, isEmpty);
    });

    test(
        'does NOT report error for non-Image.network nodes (validates detection logic)',
        () {
      final source = MockSource('/lib/main.dart');
      final reporter = MockErrorReporter(source);

      rule.run(resolver, reporter, context);

      // Variant 1: Image.asset
      context.registry
          .simulateNodeVisit(createMockNode(constructorName: 'asset'));

      // Variant 2: Not Image class
      context.registry.simulateNodeVisit(createMockNode(typeName: 'NotImage'));

      // Variant 3: Not Flutter library
      context.registry.simulateNodeVisit(
          createMockNode(libraryUri: 'package:other/image.dart'));

      expect(reporter.reportedCodes, isEmpty);
    });
  });
}
