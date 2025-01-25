




main function - main library - Dart API







menu

1. [talawa](../index.html)
2. [main.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_main/)
3. main function

main


dark\_mode

light\_mode




# main function


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
main()

## Implementation

```
Future<void> main() async {
  // Returns an instance of the binding that implements WidgetsBinding.
  WidgetsFlutterBinding.ensureInitialized();

  final Directory dir = await path.getApplicationDocumentsDirectory();

  await HiveManager.initializeHive(dir: dir);

  setupLocator();

  // The runApp() function takes the given Widget and makes it the root of the widget tree.
  runApp(MyApp());
}
```

 


1. [talawa](../index.html)
2. [main](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_main/)
3. main function

##### main library





talawa
1.0.0+1






