


# android method








[FirebaseOptions](https://pub.dev/documentation/firebase_core_platform_interface/4.8.0/firebase_core_platform_interface/FirebaseOptions-class.html) android
([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> androidFirebaseOptions)





<p>Scaffolds androidFirebaseOptions around FirebaseOptions.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>androidFirebaseOptions</code>: The options which we want to scaffold</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>FirebaseOptions</code>: Scaffolded FirebaseOptions</li>
</ul>



## Implementation

```dart
static FirebaseOptions android(Map<String, dynamic> androidFirebaseOptions) =>
    FirebaseOptions(
      apiKey: androidFirebaseOptions['apiKey'] as String,
      appId: androidFirebaseOptions['appId'] as String,
      messagingSenderId:
          androidFirebaseOptions['messagingSenderId'] as String,
      projectId: androidFirebaseOptions['projectId'] as String,
      storageBucket: androidFirebaseOptions['storageBucket'] as String,
    );
```







