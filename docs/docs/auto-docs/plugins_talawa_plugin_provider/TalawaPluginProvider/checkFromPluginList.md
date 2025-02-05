


# checkFromPluginList method








[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) checkFromPluginList
()





<p>return <code>bool</code> decides the final visibility of the verifying from database and current OrgId</p>



## Implementation

```dart
bool checkFromPluginList() {
  final UserConfig userConfig = locator<UserConfig>();
  final Box box;
  bool res = false;
  box = Hive.box('pluginBox');
  var pluginList = box.get('plugins');
  pluginList ??= []; // if null then make it  []

  ///mapping over the list from the server
  pluginList
      .map(
        (plugin) => {
          if (plugin["pluginName"] == pluginName)
            {
              if (plugin["pluginInstallStatus"] as bool)
                {
                  res = plugin["pluginInstallStatus"] as bool ||
                      plugin["installedOrgs"]
                          .contains(userConfig.currentOrg.id) as bool
                }
            }
        },
      )
      .toList();
  return res;
}
```







