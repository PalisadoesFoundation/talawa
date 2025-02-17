
<div>

# pushReplacementScreen method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
pushReplacementScreen(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    routeName,
    {]
2.  [dynamic arguments,
    ]

})



This function push the route and replace the screen.

**params**:

-   `routeName`: Name of the Route
-   `arguments`: Set of arguments

**returns**:

-   `Future<dynamic>`: resolves if the Screen was succesfully
    pushedReplacementScreen.



## Implementation

``` language-dart
Future<dynamic> pushReplacementScreen(String routeName, {dynamic arguments}) {
  return navigatorKey.currentState!
      .pushReplacementNamed(routeName, arguments: arguments);
}
```







1.  [talawa](../../index.md)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.md)
4.  pushReplacementScreen method

##### NavigationService class







