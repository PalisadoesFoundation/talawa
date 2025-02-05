


# setUpFirebaseKeys function










[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setUpFirebaseKeys
()





<p>Initializes the firebase keys in the app according to the userplatform (android/iOS).</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;void&gt;</code>: promise that will be fulfilled Firebase keys are setted up.</li>
</ul>



## Implementation

```dart
Future<void> setUpFirebaseKeys() async {
  final androidFirebaseOptionsBox =
      await Hive.openBox('androidFirebaseOptions');
  final androidFirebaseOptionsMap = androidFirebaseOptionsBox
      .get('androidFirebaseOptions') as Map<dynamic, dynamic>?;

  final iosFirebaseOptionsBox = await Hive.openBox('iosFirebaseOptions');
  final iosFirebaseOptionsMap =
      iosFirebaseOptionsBox.get('iosFirebaseOptions') as Map<dynamic, dynamic>?;
  if (androidFirebaseOptionsMap != null) {
    androidFirebaseOptions = androidFirebaseOptionsMap.map((key, value) {
      return MapEntry(key.toString(), value);
    });
  }
  if (iosFirebaseOptionsMap != null) {
    iosFirebaseOptions = iosFirebaseOptionsMap.map((key, value) {
      return MapEntry(key.toString(), value);
    });
  }
}
```







