
<div>

# removeAllAndPush method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
removeAllAndPush(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    routeName, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    tillRoute, {]
3.  [dynamic arguments,
    ]

})



This function remove all the routes till the particular route and add
new route.

**params**:

-   `routeName`: Name of the Route
-   `tillRoute`: Route till we want to remove
-   `arguments`: Set of arguments

**returns**:

-   `Future<dynamic>`: resolves if the Screen was succesfully
    removeAllAndPushed.



## Implementation

``` language-dart
Future<dynamic> removeAllAndPush(
  String routeName,
  String tillRoute, {
  dynamic arguments,
}) {
  return navigatorKey.currentState!.pushNamedAndRemoveUntil(
    routeName,
    ModalRoute.withName(tillRoute),
    arguments: arguments,
  );
}
```







1.  [talawa](../../index.html)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  removeAllAndPush method

##### NavigationService class







