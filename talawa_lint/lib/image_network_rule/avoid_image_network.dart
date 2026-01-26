import 'package:analyzer/error/error.dart' as analyzer;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// A lint rule that discourages the direct use of [Image.network].
///
/// It recommends using `AppCachedImage` instead to ensure consistent caching,
/// error handling, and placeholder behavior across the application.
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
    // Exclude the cached_image.dart file itself to allow the underlying implementation
    // Matches both forward slash (POSIX) and backslash (Windows) separators.
    if (reporter.source.fullName
        .contains(RegExp(r'widgets[/\\]common[/\\]cached_image\.dart$'))) {
      return;
    }

    context.registry.addInstanceCreationExpression((node) {
      final constructorName = node.constructorName;
      final type = constructorName.type.element;
      final name = constructorName.name?.name;
      final libraryUri = type?.library?.source.uri.toString();

      if (isFlutterImageNetwork(type?.name, name, libraryUri)) {
        reporter.reportErrorForNode(_code, node);
      }
    });
  }

  /// Checks if the given type, constructor name, and library URI correspond to
  /// `Image.network` from the Flutter package.
  static bool isFlutterImageNetwork(
    String? typeName,
    String? constructorName,
    String? libraryUri,
  ) {
    return typeName == 'Image' &&
        constructorName == 'network' &&
        libraryUri != null &&
        libraryUri.startsWith('package:flutter/');
  }
}
