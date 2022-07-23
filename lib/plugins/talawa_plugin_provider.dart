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

  final Widget? child;
  final bool visible;
  final String pluginName;

  bool checkFromPluginList() {
    final UserConfig _userConfig = locator<UserConfig>();
    final Box box;
    bool res = false;
    box = Hive.box('myBox');
    final pluginList = box.get('name');
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

  @override
  Widget build(BuildContext context) {
    var serverVisible = false;
    serverVisible = checkFromPluginList();
    return Visibility(visible: serverVisible || visible, child: child!);
  }
}
