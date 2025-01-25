




checkFromPluginList method - TalawaPluginProvider class - talawa\_plugin\_provider library - Dart API







menu

1. [talawa](../../index.html)
2. [plugins/talawa\_plugin\_provider.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_plugins_talawa_plugin_provider/)
3. [TalawaPluginProvider](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_plugins_talawa_plugin_provider/TalawaPluginProvider-class.html)
4. checkFromPluginList method

checkFromPluginList


dark\_mode

light\_mode




# checkFromPluginList method


[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)
checkFromPluginList()

This function checks if the plugin is insatlled and therefore determine visibility of the plugin.

**params**:
None

**returns**:

* `bool`: define\_the\_return

## Implementation

```
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
      res = plugin["pluginInstallStatus"] as bool ||
          (plugin["installedOrgs"] as List)
              .contains(userConfig.currentOrg.id);
    }
  });
  return res;
}
```

 


1. [talawa](../../index.html)
2. [talawa\_plugin\_provider](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_plugins_talawa_plugin_provider/)
3. [TalawaPluginProvider](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_plugins_talawa_plugin_provider/TalawaPluginProvider-class.html)
4. checkFromPluginList method

##### TalawaPluginProvider class





talawa
1.0.0+1






