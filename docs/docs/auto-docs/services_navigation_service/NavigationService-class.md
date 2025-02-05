


# NavigationService class









<p>NavigationService class provides different functions as service in the context of navigation.</p>
<p>Services include:</p>
<ul>
<li><code>pushScreen</code></li>
<li><code>popAndPushScreen</code></li>
<li><code>pushReplacementScreen</code></li>
<li><code>removeAllAndPush</code></li>
<li><code>showSnackBar</code></li>
<li><code>pushDialog</code></li>
<li><code>showTalawaErrorWidget</code></li>
<li><code>showTalawaErrorDialog</code></li>
<li><code>pop</code></li>
</ul>




## Constructors

[NavigationService](../services_navigation_service/NavigationService/NavigationService.md) ()

   


## Properties

##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [navigatorKey](../services_navigation_service/NavigationService/navigatorKey.md) &#8596; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[NavigatorState](https://api.flutter.dev/flutter/widgets/NavigatorState-class.html)>



  
_<span class="feature">read / write</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [fromInviteLink](../services_navigation_service/NavigationService/fromInviteLink.md)([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html)> routeNames, [List](https://api.flutter.dev/flutter/dart-core/List-class.html) arguments) void



  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [pop](../services_navigation_service/NavigationService/pop.md)() void



This function pops the current state.  




##### [popAndPushScreen](../services_navigation_service/NavigationService/popAndPushScreen.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) routeName, {dynamic arguments}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function pop the initial route and push the new route to the navigator.  




##### [pushDialog](../services_navigation_service/NavigationService/pushDialog.md)([Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) dialog) void



This function is used to show the custom Dialog.  




##### [pushReplacementScreen](../services_navigation_service/NavigationService/pushReplacementScreen.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) routeName, {dynamic arguments}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function push the route and replace the screen.  




##### [pushScreen](../services_navigation_service/NavigationService/pushScreen.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) routeName, {dynamic arguments}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function push the route to the navigator.  




##### [removeAllAndPush](../services_navigation_service/NavigationService/removeAllAndPush.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) routeName, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) tillRoute, {dynamic arguments}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function remove all the routes till the particular route and add new route.  




##### [showSnackBar](../services_navigation_service/NavigationService/showSnackBar.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) message, {[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html) duration = const Duration(seconds: 2)}) void



This is used for the quick alert of <code>duration: 2 seconds</code> with text message(passed).  




##### [showTalawaErrorDialog](../services_navigation_service/NavigationService/showTalawaErrorDialog.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) errorMessage, [MessageType](../enums_enums/MessageType.md) messageType) void



  




##### [showTalawaErrorSnackBar](../services_navigation_service/NavigationService/showTalawaErrorSnackBar.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) errorMessage, [MessageType](../enums_enums/MessageType.md) messageType, {[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html) duration = const Duration(seconds: 2)}) void



  




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















