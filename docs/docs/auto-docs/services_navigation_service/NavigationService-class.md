
<div>

# NavigationService class

</div>


NavigationService class provides different functions as service in the
context of navigation.

Services include:

-   `pushScreen`
-   `popAndPushScreen`
-   `pushReplacementScreen`
-   `removeAllAndPush`
-   `showSnackBar`
-   `pushDialog`
-   `showTalawaErrorWidget`
-   `showTalawaErrorDialog`
-   `pop`



## Constructors

[NavigationService](../services_navigation_service/NavigationService/NavigationService.html)

:   



## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[navigatorKey](../services_navigation_service/NavigationService/navigatorKey.html)] [↔ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[NavigatorState](https://api.flutter.dev/flutter/widgets/NavigatorState-class.html)]\>]]
:   Key for Navigator State.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[pop](../services_navigation_service/NavigationService/pop.html) [→ void ]
:   This function pops the current state.

[[popAndPushScreen](../services_navigation_service/NavigationService/popAndPushScreen.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] routeName, {][dynamic arguments]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function pop the initial route and push the new route to the
    navigator.

[printNavigatorState](../services_navigation_service/NavigationService/printNavigatorState.html) [→ void ]
:   This function prints current navigation state.

[[pushDialog](../services_navigation_service/NavigationService/pushDialog.html)][([[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)] dialog]) → void ]
:   This function remove all the routes till the particular route and
    add new route.

[[pushReplacementScreen](../services_navigation_service/NavigationService/pushReplacementScreen.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] routeName, {][dynamic arguments]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function push the route and replace the screen.

[[pushScreen](../services_navigation_service/NavigationService/pushScreen.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] routeName, {][dynamic arguments]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   Pushes a Screen.

[[removeAllAndPush](../services_navigation_service/NavigationService/removeAllAndPush.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] routeName, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] tillRoute, {][dynamic arguments]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function remove all the routes till the particular route and
    add new route.

[[showCustomToast](../services_navigation_service/NavigationService/showCustomToast.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] msg]) → void ]
:   Shows an Custom Toast.

[[showSnackBar](../services_navigation_service/NavigationService/showSnackBar.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] message, {][[[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)] duration = const Duration(seconds: 2)]}) → void ]
:   This is used for the quick alert of `duration: 2 seconds` with text
    message(passed).

[[showTalawaErrorDialog](../services_navigation_service/NavigationService/showTalawaErrorDialog.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] errorMessage, ][[[MessageType](../enums_enums/MessageType.html)] messageType]) → void ]
:   Shows an Error Dialog Box.

[[showTalawaErrorSnackBar](../services_navigation_service/NavigationService/showTalawaErrorSnackBar.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] errorMessage, ][[[MessageType](../enums_enums/MessageType.html)] messageType]) → void ]
:   This is used for the quick error of `duration: 2 seconds`.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [navigation_service](../services_navigation_service/)
3.  NavigationService class

##### navigation_service library







