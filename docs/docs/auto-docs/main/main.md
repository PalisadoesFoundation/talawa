




main function - main library - Dart API







menu

1. [talawa](../index.html)
2. [main.dart](../main/main-library.html)
3. main function

main


dark\_mode

light\_mode




# main function


Future<void>
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
2. [main](../main/main-library.html)
3. main function

##### main library





talawa
1.0.0+1






