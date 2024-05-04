


# getPluginsList method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) getPluginsList
()





<p><code>getPluginList</code> queries all properties of  pluginList from the server</p>



## Implementation

```dart
String getPluginsList() {
  return '''
query  {
getPlugins {
  _id
  pluginName
  pluginCreatedBy
  pluginDesc
  pluginInstallStatus
  installedOrgs
}
}
''';
}
```







