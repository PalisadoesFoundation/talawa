



# main library











## Classes

##### [DemoPageView](../main/DemoPageView-class.md)



PageView is a scrollable list that works page by page.


##### [DemoViewModel](../main/DemoViewModel-class.md)



ViewModel uses property-based data binding to establish a connection.


##### [MyApp](../main/MyApp-class.md)



Main widget that sets up the quick actions, internationalization, routing , notifications.






## Properties

##### [androidFirebaseOptions](../main/androidFirebaseOptions.md) &#8596; [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>



HashMap of Firebase options for android.  
_<span class="feature">read / write</span>_



##### [channel](../main/channel.md) &#8596; [AndroidNotificationChannel](https://pub.dev/documentation/flutter_local_notifications/15.1.0+1/flutter_local_notifications/AndroidNotificationChannel-class.html)



Create a <a href="https://pub.dev/documentation/flutter_local_notifications/15.1.0+1/flutter_local_notifications/AndroidNotificationChannel-class.html">AndroidNotificationChannel</a> for heads up notifications.  
_<span class="feature">read / write</span>_



##### [flutterLocalNotificationsPlugin](../main/flutterLocalNotificationsPlugin.md) &#8596; [FlutterLocalNotificationsPlugin](https://pub.dev/documentation/flutter_local_notifications/15.1.0+1/flutter_local_notifications/FlutterLocalNotificationsPlugin-class.html)



Initialize the <a href="https://pub.dev/documentation/flutter_local_notifications/15.1.0+1/flutter_local_notifications/FlutterLocalNotificationsPlugin-class.html">FlutterLocalNotificationsPlugin</a> package.  
_<span class="feature">read / write</span>_



##### [iosFirebaseOptions](../main/iosFirebaseOptions.md) &#8596; [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>



HashMap of Firebase options for android.  
_<span class="feature">read / write</span>_




## Functions

##### [main](../main/main.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



First function to initialize the application, invoked automatically.  




##### [setUpFirebase](../main/setUpFirebase.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



Initializes the firebase in the app according to the userplatform (android/iOS).  




##### [setUpFirebaseKeys](../main/setUpFirebaseKeys.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



Initializes the firebase keys in the app according to the userplatform (android/iOS).  




##### [setUpFirebaseMessaging](../main/setUpFirebaseMessaging.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



Set up firebase instance, enbables messaging,listens to icoming messages.  












