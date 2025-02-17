
<div>

# pushScreen method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
pushScreen(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    routeName, {]
2.  [dynamic arguments,
    ]

})



Pushes a Screen.

**params**:

-   `routeName`: Name of the Route
-   `arguments`: Set of arguments

**returns**:

-   `Future<dynamic>`: resolves if the Screen was succesfully pushed.



## Implementation

``` language-dart
Future<dynamic> pushScreen(String routeName, {dynamic arguments}) {
  return navigatorKey.currentState!
      .pushNamed(routeName, arguments: arguments);
}
```







1.  [talawa](../../index.html)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  pushScreen method

##### NavigationService class







