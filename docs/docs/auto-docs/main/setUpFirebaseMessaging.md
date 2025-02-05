


# setUpFirebaseMessaging function










[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setUpFirebaseMessaging
()





<p>Set up firebase instance, enbables messaging,listens to icoming messages.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;void&gt;</code>: promise that will be fulfilled Firebase is setted up.</li>
</ul>



## Implementation

```dart
Future<void> setUpFirebaseMessaging() async {
  /// Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Update the iOS foreground notification presentation options to allow heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.instance
      .getInitialMessage()
      .then((RemoteMessage? message) {});

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final RemoteNotification? notification = message.notification;
    final AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'launch_background',
          ),
        ),
      );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
}
```







