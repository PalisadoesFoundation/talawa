




removeAllAndPush method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. removeAllAndPush method

removeAllAndPush


dark\_mode

light\_mode




# removeAllAndPush method


Future
removeAllAndPush(

1. String routeName,
2. String tillRoute, {
3. dynamic arguments,

})

This function remove all the routes till the particular route and add new route.

**params**:

* `routeName`: Name of the Route
* `tillRoute`: Route till we want to remove
* `arguments`: Set of arguments

**returns**:

* `Future<dynamic>`: resolves if the Screen was succesfully removeAllAndPushed.

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [navigation\_service](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. removeAllAndPush method

##### NavigationService class





talawa
1.0.0+1






