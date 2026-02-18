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
    if (shouldExcludeFile(reporter.source.fullName)) {
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

  /// isFlutterImageNetwork checks whether the provided typeName, constructorName,
  /// and libraryUri correspond to Flutter's Image.network constructor.
  ///
  /// **params**:
  /// * `typeName`: The name of the type to check against 'Image'.
  /// * `constructorName`: The name of the constructor to check against 'network'.
  /// * `libraryUri`: The URI of the library to verify it starts with 'package:flutter/'.
  ///
  /// **returns**:
  /// * `bool`: Returns true if isFlutterImageNetwork determines the parameters match Flutter's Image.network constructor.
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

  /// Checks if the given file path should be excluded from linting.
  ///
  /// **params**:
  /// * `filePath`: Path of the file to check.
  ///
  /// **returns**:
  /// * `bool`: Returns true for files matching `widgets/common/cached_image.dart` with both POSIX (`/`) and Windows (`\`) separators.
  static bool shouldExcludeFile(String filePath) {
    return filePath
        .contains(RegExp(r'widgets[/\\]common[/\\]cached_image\.dart$'));
  }
}
