




NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../index.html)
2. [services/navigation\_service.dart](../services_navigation_service/services_navigation_service-library.html)
3. NavigationService class

NavigationService


dark\_mode

light\_mode




# NavigationService class


NavigationService class provides different functions as service in the context of navigation.

Services include:

* `pushScreen`
* `popAndPushScreen`
* `pushReplacementScreen`
* `removeAllAndPush`
* `showSnackBar`
* `pushDialog`
* `showTalawaErrorWidget`
* `showTalawaErrorDialog`
* `pop`

## Constructors

[NavigationService](../services_navigation_service/NavigationService/NavigationService.html)()




## Properties

[hashCode](../services_navigation_service/NavigationService/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[navigatorKey](../services_navigation_service/NavigationService/navigatorKey.html)
↔ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[NavigatorState](https://api.flutter.dev/flutter/widgets/NavigatorState-class.html)>

Key for Navigator State.
getter/setter pair

[runtimeType](../services_navigation_service/NavigationService/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[noSuchMethod](../services_navigation_service/NavigationService/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[pop](../services_navigation_service/NavigationService/pop.html)()
→ void


This function pops the current state.

[popAndPushScreen](../services_navigation_service/NavigationService/popAndPushScreen.html)(String routeName, {dynamic arguments})
→ Future


This function pop the initial route and push the new route to the navigator.

[printNavigatorState](../services_navigation_service/NavigationService/printNavigatorState.html)()
→ void


This function prints current navigation state.

[pushDialog](../services_navigation_service/NavigationService/pushDialog.html)([Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) dialog)
→ void


This function remove all the routes till the particular route and add new route.

[pushReplacementScreen](../services_navigation_service/NavigationService/pushReplacementScreen.html)(String routeName, {dynamic arguments})
→ Future


This function push the route and replace the screen.

[pushScreen](../services_navigation_service/NavigationService/pushScreen.html)(String routeName, {dynamic arguments})
→ Future


Pushes a Screen.

[removeAllAndPush](../services_navigation_service/NavigationService/removeAllAndPush.html)(String routeName, String tillRoute, {dynamic arguments})
→ Future


This function remove all the routes till the particular route and add new route.

[showCustomToast](../services_navigation_service/NavigationService/showCustomToast.html)(String msg)
→ void


Shows an Custom Toast.

[showSnackBar](../services_navigation_service/NavigationService/showSnackBar.html)(String message, {Duration duration = const Duration(seconds: 2)})
→ void


This is used for the quick alert of `duration: 2 seconds` with text message(passed).

[showTalawaErrorDialog](../services_navigation_service/NavigationService/showTalawaErrorDialog.html)(String errorMessage, [MessageType](../enums_enums/MessageType.html) messageType)
→ void


Shows an Error Dialog Box.

[showTalawaErrorSnackBar](../services_navigation_service/NavigationService/showTalawaErrorSnackBar.html)(String errorMessage, [MessageType](../enums_enums/MessageType.html) messageType)
→ void


This is used for the quick error of `duration: 2 seconds`.

[toString](../services_navigation_service/NavigationService/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../services_navigation_service/NavigationService/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [navigation\_service](../services_navigation_service/services_navigation_service-library.html)
3. NavigationService class

##### navigation\_service library





talawa
1.0.0+1






