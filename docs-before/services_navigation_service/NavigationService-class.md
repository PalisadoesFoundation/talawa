<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [services/navigation_service.dart](../services_navigation_service/)
3.  NavigationService class

<div class="self-name">

NavigationService

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_navigation_service/services_navigation_service-library-sidebar.html"
below-sidebar="services_navigation_service/NavigationService-class-sidebar.html">

<div>

# <span class="kind-class">NavigationService</span> class

</div>

<div class="section desc markdown">

NavigationService class provides different functions as service in the
context of navigation.

Services include:

- `pushScreen`
- `popAndPushScreen`
- `pushReplacementScreen`
- `removeAllAndPush`
- `showSnackBar`
- `pushDialog`
- `showTalawaErrorWidget`
- `showTalawaErrorDialog`
- `pop`

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[NavigationService.new](../services_navigation_service/NavigationService/NavigationService.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[navigatorKey](../services_navigation_service/NavigationService/navigatorKey.md)</span> <span class="signature">↔ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[NavigatorState](https://api.flutter.dev/flutter/widgets/NavigatorState-class.html)</span>\></span></span>  
Key for Navigator State.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[pop](../services_navigation_service/NavigationService/pop.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function pops the current state.

<span class="name">[popAndPushScreen](../services_navigation_service/NavigationService/popAndPushScreen.md)</span><span class="signature">(<span id="popAndPushScreen-param-routeName" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">routeName</span>, ) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)</span> </span>  
This function pop the initial route and push the new route to the
navigator.

<span class="name">[printNavigatorState](../services_navigation_service/NavigationService/printNavigatorState.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function prints current navigation state.

<span class="name">[pushDialog](../services_navigation_service/NavigationService/pushDialog.md)</span><span class="signature">(<span id="pushDialog-param-dialog" class="parameter"><span class="type-annotation">[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.md)</span> <span class="parameter-name">dialog</span></span>) <span class="returntype parameter">→ void</span> </span>  
This function remove all the routes till the particular route and add
new route.

<span class="name">[pushReplacementScreen](../services_navigation_service/NavigationService/pushReplacementScreen.md)</span><span class="signature">(<span id="pushReplacementScreen-param-routeName" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">routeName</span>, ) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)</span> </span>  
This function push the route and replace the screen.

<span class="name">[pushScreen](../services_navigation_service/NavigationService/pushScreen.md)</span><span class="signature">(<span id="pushScreen-param-routeName" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">routeName</span>, ) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)</span> </span>  
Pushes a Screen.

<span class="name">[removeAllAndPush](../services_navigation_service/NavigationService/removeAllAndPush.md)</span><span class="signature">(<span id="removeAllAndPush-param-routeName" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">routeName</span>, </span><span id="removeAllAndPush-param-tillRoute" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">tillRoute</span>, ) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)</span> </span>  
This function remove all the routes till the particular route and add
new route.

<span class="name">[showCustomToast](../services_navigation_service/NavigationService/showCustomToast.md)</span><span class="signature">(<span id="showCustomToast-param-msg" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">msg</span></span>) <span class="returntype parameter">→ void</span> </span>  
Shows an Custom Toast.

<span class="name">[showSnackBar](../services_navigation_service/NavigationService/showSnackBar.md)</span><span class="signature">(<span id="showSnackBar-param-message" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">message</span>, ) <span class="returntype parameter">→ void</span> </span>  
This is used for the quick alert of `duration: 2 seconds` with text
message(passed).

<span class="name">[showTalawaErrorDialog](../services_navigation_service/NavigationService/showTalawaErrorDialog.md)</span><span class="signature">(<span id="showTalawaErrorDialog-param-errorMessage" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">errorMessage</span>, </span><span id="showTalawaErrorDialog-param-messageType" class="parameter"><span class="type-annotation">[MessageType](../enums_enums/MessageType.md)</span> <span class="parameter-name">messageType</span></span>) <span class="returntype parameter">→ void</span> </span>  
Shows an Error Dialog Box.

<span class="name">[showTalawaErrorSnackBar](../services_navigation_service/NavigationService/showTalawaErrorSnackBar.md)</span><span class="signature">(<span id="showTalawaErrorSnackBar-param-errorMessage" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">errorMessage</span>, </span><span id="showTalawaErrorSnackBar-param-messageType" class="parameter"><span class="type-annotation">[MessageType](../enums_enums/MessageType.md)</span> <span class="parameter-name">messageType</span></span>) <span class="returntype parameter">→ void</span> </span>  
This is used for the quick error of `duration: 2 seconds`.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [navigation_service](../services_navigation_service/)
3.  NavigationService class

##### navigation_service library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
