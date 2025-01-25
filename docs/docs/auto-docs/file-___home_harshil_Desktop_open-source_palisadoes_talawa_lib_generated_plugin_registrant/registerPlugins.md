




registerPlugins function - generated\_plugin\_registrant library - Dart API







menu

1. [talawa](../index.html)
2. [generated\_plugin\_registrant.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_generated_plugin_registrant/)
3. registerPlugins function

registerPlugins


dark\_mode

light\_mode




# registerPlugins function


void
registerPlugins(

1. dynamic registrar

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
2. [generated\_plugin\_registrant](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_generated_plugin_registrant/)
3. registerPlugins function

##### generated\_plugin\_registrant library





talawa
1.0.0+1






