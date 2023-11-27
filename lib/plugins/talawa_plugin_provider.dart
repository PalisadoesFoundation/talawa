import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/user_config.dart';

/// TalwaPluginProvider provides ability to implement features as plugins.
class TalawaPluginProvider extends StatelessWidget {
  const TalawaPluginProvider({
    super.key,
    @required this.child,
    required this.visible,
    required this.pluginName,
  });

  ///child contains the widget for the plugin UI.
  final Widget? child;

  ///visible is the property that decides visibility of the UI.
  final bool visible;

  ///name of plugin preferred with underscores(_) instead of spaces.
  final String pluginName;

  /// This function checks if the plugin is insatlled and therefore determine visibility of the plugin.
  ///
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `bool`: define_the_return
  bool checkFromPluginList() {
    final UserConfig userConfig = locator<UserConfig>();
    final Box box;
    bool res = false;
    box = Hive.box('pluginBox');
    final List<Map<String, dynamic>> pluginList =
        (box.get('plugins') as List<Map<String, dynamic>>?) ?? [];

    ///mapping over the list from the server
    pluginList.forEach((plugin) {
      if (plugin["pluginName"] == pluginName) {
        if (plugin["pluginInstallStatus"] as bool) {
          res = plugin["pluginInstallStatus"] as bool ||
              (plugin["installedOrgs"] as List)
                  .contains(userConfig.currentOrg.id);
        }
      }
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    var serverVisible = false;
    serverVisible = checkFromPluginList();
    return serverVisible || visible ? child! : Container();
  }
}
