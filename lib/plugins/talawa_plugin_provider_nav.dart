import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/user_config.dart';

/// TalwaPluginProviderNavbar provides ability to implement features as plugins
class TalawaPluginProviderNav {
  const TalawaPluginProviderNav(
      {required this.child, required this.visible, required this.pluginName});

  ///child contains the widget for the plugin UI.
  final BottomNavigationBarItem child;

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
    var pluginList = box.get('plugins');
    pluginList ??= [];

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
  BottomNavigationBarItem build(BuildContext context) {
    var serverVisible = false;
    serverVisible = checkFromPluginList();
    if (serverVisible || visible) {
      // if one of them is true
      return child;
    } else {
      return const BottomNavigationBarItem(
          icon: Icon(Icons.home), label: "Default");
    }
    // return Visibility(visible: serverVisible || visible, child: child!);
  }
}
