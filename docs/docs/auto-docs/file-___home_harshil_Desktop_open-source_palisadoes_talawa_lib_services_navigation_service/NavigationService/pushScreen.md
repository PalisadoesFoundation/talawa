




pushScreen method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/)
3. [NavigationService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/NavigationService-class.html)
4. pushScreen method

pushScreen


dark\_mode

light\_mode




# pushScreen method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
pushScreen(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) routeName, {
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
2. [navigation\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/)
3. [NavigationService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/NavigationService-class.html)
4. pushScreen method

##### NavigationService class





talawa
1.0.0+1






