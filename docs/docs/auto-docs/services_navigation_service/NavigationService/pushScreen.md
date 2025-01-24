




pushScreen method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. pushScreen method

pushScreen


dark\_mode

light\_mode




# pushScreen method


Future
pushScreen(

1. String routeName, {
2. dynamic arguments,

})

Pushes a Screen.

**params**:

* `routeName`: Name of the Route
* `arguments`: Set of arguments

**returns**:

* `Future<dynamic>`: resolves if the Screen was succesfully pushed.

## Implementation

```
Future<dynamic> pushScreen(String routeName, {dynamic arguments}) {
  return navigatorKey.currentState!
      .pushNamed(routeName, arguments: arguments);
}
```

 


1. [talawa](../../index.html)
2. [navigation\_service](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. pushScreen method

##### NavigationService class





talawa
1.0.0+1






