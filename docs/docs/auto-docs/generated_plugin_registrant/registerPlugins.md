


# registerPlugins function










void registerPlugins
([Registrar](https://api.flutter.dev/flutter/flutter_web_plugins/Registrar-class.html) registrar)








## Implementation

```dart
void registerPlugins(Registrar registrar) {
  ConnectivityPlusPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  UniLinksPlugin.registerWith(registrar);
  VibrationWebPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
```







