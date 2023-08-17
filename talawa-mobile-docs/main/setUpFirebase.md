


# setUpFirebase function










[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setUpFirebase
()





<p>Initializes the firebase in the app according to the userplatform (android/iOS).</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;void&gt;</code>: promise that will be fulfilled Firebase is setted up in app.</li>
</ul>



## Implementation

```dart
Future<void> setUpFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(
      androidFirebaseOptions,
      iosFirebaseOptions,
    ),
  );
}
```







