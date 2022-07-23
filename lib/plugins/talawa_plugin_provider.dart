import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/user_config.dart';

/// TalwaPluginProvider provides ability to implement features as plugins
class TalawaPluginProvider extends StatelessWidget {
  const TalawaPluginProvider(
      {Key? key,
      @required this.child,
      required this.visible,
      required this.pluginName})
      : super(key: key);

  ///child contains the widget for the plugin UI.
  final Widget? child;

  ///visible is the property that decides visibility of the UI.
  final bool visible;

  ///name of plugin preferred with underscores(_) insted of spaces
  final String pluginName;

  ///return `bool` decides the final visibility of the verifying from database and current OrgId
  bool checkFromPluginList() {
    final UserConfig _userConfig = locator<UserConfig>();
    final Box box;
    bool res = false;
    box = Hive.box('pluginBox');
    final pluginList = box.get('plugins');

    ///mapping over the list from the server
    pluginList
        .map((plugin) => {
              if (plugin["pluginName"] == pluginName)
                {
                  if (plugin["pluginInstallStatus"] as bool)
                    {
                      res = plugin["pluginInstallStatus"] as bool ||
                          plugin["installedOrgs"]
                              .contains(_userConfig.currentOrg.id) as bool
                    }
                }
            })
        .toList();
    return res;
  }

  ///build the Plugin combining local `visibility` property and `serverVisible` property
  @override
  Widget build(BuildContext context) {
    var serverVisible = false;
    serverVisible = checkFromPluginList();
    return Visibility(visible: serverVisible || visible, child: child!);
  }
}
