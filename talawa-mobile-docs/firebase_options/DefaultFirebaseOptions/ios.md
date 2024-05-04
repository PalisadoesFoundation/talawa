


# ios method








[FirebaseOptions](https://pub.dev/documentation/firebase_core_platform_interface/4.8.0/firebase_core_platform_interface/FirebaseOptions-class.html) ios
([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> iosFirebaseOptions)





<p>Scaffolds iosFirebaseOptions around FirebaseOptions.</p>
<p>more_info_if_required</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>iosFirebaseOptions</code>: The options which we want to scaffold</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>FirebaseOptions</code>: Scaffolded FirebaseOptions</li>
</ul>



## Implementation

```dart
static FirebaseOptions ios(Map<String, dynamic> iosFirebaseOptions) =>
    FirebaseOptions(
      apiKey: iosFirebaseOptions['apiKey'] as String,
      appId: iosFirebaseOptions['appId'] as String,
      messagingSenderId: iosFirebaseOptions['messagingSenderId'] as String,
      projectId: iosFirebaseOptions['projectId'] as String,
      storageBucket: iosFirebaseOptions['storageBucket'] as String,
      iosClientId: iosFirebaseOptions['iosClientId'] as String,
      iosBundleId: iosFirebaseOptions['iosBundleId'] as String,
    );
```







