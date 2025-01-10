


# currentPlatform method








[FirebaseOptions](https://pub.dev/documentation/firebase_core_platform_interface/4.8.0/firebase_core_platform_interface/FirebaseOptions-class.html) currentPlatform
([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> androidFirebaseOptions, [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> iosFirebaseOptions)





<p>Builds and returns <a href="https://pub.dev/documentation/firebase_core_platform_interface/4.8.0/firebase_core_platform_interface/FirebaseOptions-class.html">FirebaseOptions</a> based on the current platform.</p>
<p>Switches on the current platform and calls <a href="../../firebase_options/DefaultFirebaseOptions/android.md">android</a> or <code>iOS</code>
methods accordingly to build the <a href="https://pub.dev/documentation/firebase_core_platform_interface/4.8.0/firebase_core_platform_interface/FirebaseOptions-class.html">FirebaseOptions</a>. Throws
<a href="https://api.flutter.dev/flutter/dart-core/UnsupportedError-class.html">UnsupportedError</a> if the platform is other than these two.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>androidFirebaseOptions</code>: Firebase Options for Android</li>
<li><code>iosFirebaseOptions</code>: Firebase Options for iOS</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>FirebaseOptions</code>: The <a href="https://pub.dev/documentation/firebase_core_platform_interface/4.8.0/firebase_core_platform_interface/FirebaseOptions-class.html">FirebaseOptions</a> built according to the platform.</li>
</ul>



## Implementation

```dart
static FirebaseOptions currentPlatform(
  Map<String, dynamic> androidFirebaseOptions,
  Map<String, dynamic> iosFirebaseOptions,
) {
  if (kIsWeb) {
    throw UnsupportedError(
      'DefaultFirebaseOptions have not been configured for web - '
      'you can reconfigure this by running the FlutterFire CLI again.',
    );
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return android(androidFirebaseOptions);
    case TargetPlatform.iOS:
      return ios(iosFirebaseOptions);
    case TargetPlatform.macOS:
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for macos - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    default:
      throw UnsupportedError(
        'DefaultFirebaseOptions are not supported for this platform.',
      );
  }
}
```







