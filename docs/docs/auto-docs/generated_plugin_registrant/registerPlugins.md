




registerPlugins function - generated\_plugin\_registrant library - Dart API







menu

1. [talawa](../index.html)
2. [generated\_plugin\_registrant.dart](../generated_plugin_registrant/generated_plugin_registrant-library.html)
3. registerPlugins function

registerPlugins


dark\_mode

light\_mode




# registerPlugins function


void
registerPlugins(

1. [Registrar](https://api.flutter.dev/flutter/flutter_web_plugins/Registrar-class.html) registrar

)

## Implementation

```
void registerPlugins(Registrar registrar) {
  ConnectivityPlusPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  UniLinksPlugin.registerWith(registrar);
  VibrationWebPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
```

 


1. [talawa](../index.html)
2. [generated\_plugin\_registrant](../generated_plugin_registrant/generated_plugin_registrant-library.html)
3. registerPlugins function

##### generated\_plugin\_registrant library





talawa
1.0.0+1






