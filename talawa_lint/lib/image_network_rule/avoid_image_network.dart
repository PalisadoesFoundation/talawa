import 'package:analyzer/error/error.dart' as analyzer;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class AvoidImageNetworkLintRule extends DartLintRule {
  const AvoidImageNetworkLintRule() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_image_network',
    problemMessage: 'Avoid using Image.network directly.',
    correctionMessage:
        'Use AppCachedImage instead for consistent caching and error handling.',
    errorSeverity: analyzer.ErrorSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (reporter.source.fullName.endsWith('widgets/common/cached_image.dart')) {
      return;
    }

    context.registry.addInstanceCreationExpression((node) {
      final constructorName = node.constructorName;
      final type = constructorName.type.element;
      final name = constructorName.name?.name;

      if (type?.name == 'Image' && name == 'network') {
        reporter.reportErrorForNode(_code, node);
      }
    });
  }
}
