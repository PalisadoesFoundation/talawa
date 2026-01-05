// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/error/error.dart' as analyzer;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:talawa_lint/talawa_query_result/talawa_query_result_visitor.dart';

/// Lint rule that enforces checking `hasException` on QueryResult objects
/// before accessing the `data` property.
class TalawaQueryResultLintRule extends DartLintRule {
  const TalawaQueryResultLintRule() : super(code: _code);

  /// Metadata about the warning that will show-up in the IDE.
  static const _code = LintCode(
    name: 'talawa_query_result_check',
    problemMessage:
        'QueryResult.data accessed without checking hasException first.',
    correctionMessage:
        'Add an if (result.hasException) check before accessing data.',
    url: 'https://docs.talawa.io/docs/developers/talawa/talawa-lint/',
    errorSeverity: analyzer.ErrorSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // Skip test files
    if (reporter.source.fullName.contains(RegExp('.*/test/.*/.*test.dart')) ||
        reporter.source.fullName.contains(RegExp('.*/.*g.dart'))) {
      return;
    }

    final visitor = TalawaQueryResultVisitor(
      this,
      reporter,
    );

    // Register for method invocations to detect QueryResult usage
    context.registry.addMethodDeclaration((node) {
      node.accept(visitor);
    });

    context.registry.addFunctionDeclaration((node) {
      node.accept(visitor);
    });
  }
}
