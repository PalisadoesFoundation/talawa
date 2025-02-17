
<div>

# registerPlugins function

</div>


void registerPlugins(

1.  [[[Registrar](https://api.flutter.dev/flutter/flutter_web_plugins/Registrar-class.md)]
    registrar]

)



## Implementation

``` language-dart
void registerPlugins(Registrar registrar) {
  ConnectivityPlusPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  UniLinksPlugin.registerWith(registrar);
  VibrationWebPlugin.registerWith(registrar);
  registrar.;
}
```







1.  [talawa](../index.md)
2.  [generated_plugin_registrant](../generated_plugin_registrant/)
3.  registerPlugins function

##### generated_plugin_registrant library







