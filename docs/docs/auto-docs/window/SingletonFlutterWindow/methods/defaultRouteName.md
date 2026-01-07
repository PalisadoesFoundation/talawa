# Method: `defaultRouteName`

## Description

The route or path that the embedder requested when the application was
 launched.

 

 This will be the string "`/`" if no particular route was requested.

 ## Android

 On Android, the initial route can be set on the [initialRoute](..//javadoc/io/flutter/embedding/android/FlutterActivity.NewEngineIntentBuilder#initialRoute-java.lang.String-.md)
 method of the [FlutterActivity](..//javadoc/io/flutter/embedding/android/FlutterActivity.md)'s
 intent builder.

 On a standalone engine, see https://flutter.dev/docs/development/add-to-app/android/add-flutter-screen#initial-route-with-a-cached-engine.

 ## iOS

 On iOS, the initial route can be set with the
 [`FlutterViewController.setInitialRoute`](..//ios-embedder/interface_flutter_view_controller#a7f269c2da73312f856d42611cc12a33f.md)
 initializer.

 On a standalone engine, see https://flutter.dev/docs/development/add-to-app/ios/add-flutter-screen#route.

 See also:

  * [Navigator], a widget that handles routing.
  * [SystemChannels.navigation], which handles subsequent navigation
    requests from the embedder.

## Return Type
`String`

