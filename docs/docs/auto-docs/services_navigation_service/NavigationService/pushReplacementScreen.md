




pushReplacementScreen method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. pushReplacementScreen method

pushReplacementScreen


dark\_mode

light\_mode




# pushReplacementScreen method


Future
pushReplacementScreen(

1. String routeName, {
2. dynamic arguments,

})

This function push the route and replace the screen.

**params**:

* `routeName`: Name of the Route
* `arguments`: Set of arguments

**returns**:

* `Future<dynamic>`: resolves if the Screen was succesfully pushedReplacementScreen.

## Implementation

```
Future<dynamic> pushReplacementScreen(String routeName, {dynamic arguments}) {
  return navigatorKey.currentState!
      .pushReplacementNamed(routeName, arguments: arguments);
}
```

 


1. [talawa](../../index.html)
2. [navigation\_service](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. pushReplacementScreen method

##### NavigationService class





talawa
1.0.0+1






