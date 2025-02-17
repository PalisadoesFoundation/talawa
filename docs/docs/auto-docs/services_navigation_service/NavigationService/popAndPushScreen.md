
<div>

# popAndPushScreen method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
popAndPushScreen(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    routeName, {]
2.  [dynamic arguments,
    ]

})



This function pop the initial route and push the new route to the
navigator.

**params**:

-   `routeName`: Name of the Route
-   `arguments`: Set of arguments

**returns**:

-   `Future<dynamic>`: resolves if the Screen was succesfully
    popAndPushed.



## Implementation

``` language-dart
Future<dynamic> popAndPushScreen(String routeName, {dynamic arguments}) {
  navigatorKey.currentState!.;
  return pushScreen(routeName, arguments: arguments);
}
```







1.  [talawa](../../index.html)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  popAndPushScreen method

##### NavigationService class







