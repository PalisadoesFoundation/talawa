




getPluginsList method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. getPluginsList method

getPluginsList


dark\_mode

light\_mode




# getPluginsList method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
getPluginsList()

`getPluginList` queries all properties of pluginList from the server.

**params**:
None

**returns**:

* `String`: query in string form, to be passed on to graphql client.

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. getPluginsList method

##### Queries class





talawa
1.0.0+1






