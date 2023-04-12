import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:talawa_lint/talawa_api_doc/talawa_api_doc_fixer.dart';
import 'package:talawa_lint/talawa_api_doc/talawa_api_doc_visitor.dart';

class TalawaApiDocLintRule extends DartLintRule {
  const TalawaApiDocLintRule() : super(code: _code);

  /// Metadata about the warning that will show-up in the IDE.
  /// This is used for `// ignore: code` and enabling/disabling the lint
  static const _code = LintCode(
    name: 'talawa_api_doc',
    problemMessage: 'No documentation found for this field.',
    correctionMessage: "Add a valid documentation describing usecase.",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final visitor = TalawaApiDocVisitor(
      this,
      context,
      reporter,
    );

    context.registry.addClassDeclaration(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addClassTypeAlias(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addCompilationUnit(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addConstructorDeclaration(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addEnumConstantDeclaration(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addEnumDeclaration(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addExtensionDeclaration(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addFieldDeclaration(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addFunctionDeclaration(
      (node) => visitor.check(node),
    );
    context.registry.addFunctionTypeAlias(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addGenericTypeAlias(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addMixinDeclaration(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addVariableDeclaration(
      (node) => node.visitChildren(visitor),
    );
    context.registry.addTopLevelVariableDeclaration(
      (node) => node.visitChildren(visitor),
    );
  }

  @override
  List<Fix> getFixes() => [
        TalawaAPIDocFixer(),
      ];
}
