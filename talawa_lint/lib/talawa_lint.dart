// This is the entrypoint of our custom linter
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:talawa_lint/talawa_api_doc/talawa_api_doc.dart';
import 'package:talawa_lint/talawa_good_doc/talawa_good_doc.dart';

PluginBase createPlugin() => _ExampleLinter();

/// A plugin class is used to list all the assists/lints defined by a plugin.
class _ExampleLinter extends PluginBase {
  /// We list all the custom warnings/infos/errors
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const TalawaApiDocLintRule(),
        const TalawaGoodDocComments(),
      ];
}
