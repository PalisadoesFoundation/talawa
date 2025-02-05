


# main function










[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> main
()





<p>First function to initialize the application, invoked automatically.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;void&gt;</code>: resolves if the application was successfully initialized.</li>
</ul>



## Implementation

```dart
Future<void> main() async {
  // Returns an instance of the binding that implements WidgetsBinding.
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Create an Android Notification Channel.
    // We use this channel in the `AndroidManifest.xml` file to override the
    // default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  final Directory dir = await path.getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());

  await Hive.openBox<User>('currentUser');
  await Hive.openBox<OrgInfo>('currentOrg');

  await Hive.openBox('pluginBox');
  await Hive.openBox('url');

  final urlBox = await Hive.openBox('url');

  try {
    if (urlBox.get('url') != null) {
      await setUpFirebaseKeys();

      await setUpFirebase();
      await setUpFirebaseMessaging();
    }
  } catch (e) {
    print("Firebase not working");
  }

  setupLocator();
  // The runApp() function takes the given Widget and makes it the root of the widget tree.
  runApp(MyApp());
}
```







