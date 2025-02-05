


# DefaultFirebaseOptions class









<p>Default <a href="https://pub.dev/documentation/firebase_core_platform_interface/4.8.0/firebase_core_platform_interface/FirebaseOptions-class.html">FirebaseOptions</a> for use with your Firebase apps.</p>
<p>Example:</p>
<pre class="language-dart"><code class="language-dart">import 'firebase_options.dart';
// ...
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
</code></pre>




## Constructors

[DefaultFirebaseOptions](../firebase_options/DefaultFirebaseOptions/DefaultFirebaseOptions.md) ()

   


## Properties

##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_







## Static Methods

##### [android](../firebase_options/DefaultFirebaseOptions/android.md)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> androidFirebaseOptions) [FirebaseOptions](https://pub.dev/documentation/firebase_core_platform_interface/4.8.0/firebase_core_platform_interface/FirebaseOptions-class.html)



Scaffolds androidFirebaseOptions around FirebaseOptions.  




##### [currentPlatform](../firebase_options/DefaultFirebaseOptions/currentPlatform.md)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> androidFirebaseOptions, [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> iosFirebaseOptions) [FirebaseOptions](https://pub.dev/documentation/firebase_core_platform_interface/4.8.0/firebase_core_platform_interface/FirebaseOptions-class.html)



Builds and returns <a href="https://pub.dev/documentation/firebase_core_platform_interface/4.8.0/firebase_core_platform_interface/FirebaseOptions-class.html">FirebaseOptions</a> based on the current platform.  




##### [ios](../firebase_options/DefaultFirebaseOptions/ios.md)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> iosFirebaseOptions) [FirebaseOptions](https://pub.dev/documentation/firebase_core_platform_interface/4.8.0/firebase_core_platform_interface/FirebaseOptions-class.html)



Scaffolds iosFirebaseOptions around FirebaseOptions.  












