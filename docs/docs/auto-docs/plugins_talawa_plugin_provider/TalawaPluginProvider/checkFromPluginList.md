
<div>

# checkFromPluginList method

</div>


[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]




This function checks if the plugin is insatlled and therefore determine
visibility of the plugin.

**params**: None

**returns**:

-   `bool`: define_the_return



## Implementation

``` language-dart
bool  {
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







1.  [talawa](../../index.html)
2.  [talawa_plugin_provider](../../plugins_talawa_plugin_provider/)
3.  [TalawaPluginProvider](../../plugins_talawa_plugin_provider/TalawaPluginProvider-class.html)
4.  checkFromPluginList method

##### TalawaPluginProvider class







