
<div>

# getPluginsList method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




`getPluginList` queries all properties of pluginList from the server.

**params**: None

**returns**:

-   `String`: query in string form, to be passed on to graphql client.



## Implementation

``` language-dart
String  {
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







1.  [talawa](../../index.html)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  getPluginsList method

##### Queries class







