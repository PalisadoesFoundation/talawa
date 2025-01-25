




build method - TalawaPluginProvider class - talawa\_plugin\_provider library - Dart API







menu

1. [talawa](../../index.html)
2. [plugins/talawa\_plugin\_provider.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_plugins_talawa_plugin_provider/)
3. [TalawaPluginProvider](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_plugins_talawa_plugin_provider/TalawaPluginProvider-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
@override
Widget build(BuildContext context) {
  var serverVisible = false;
  serverVisible = checkFromPluginList();
  return serverVisible || visible ? child! : Container();
}
```

 


1. [talawa](../../index.html)
2. [talawa\_plugin\_provider](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_plugins_talawa_plugin_provider/)
3. [TalawaPluginProvider](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_plugins_talawa_plugin_provider/TalawaPluginProvider-class.html)
4. build method

##### TalawaPluginProvider class





talawa
1.0.0+1






