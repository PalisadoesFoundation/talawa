




pushDialog method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. pushDialog method

pushDialog


dark\_mode

light\_mode




# pushDialog method


void
pushDialog(

1. [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) dialog

)

This function remove all the routes till the particular route and add new route.

**params**:

* `dialog`: Widget to show

**returns**:
None


## Implementation

```
void pushDialog(Widget dialog) {
  showDialog(
    context: navigatorKey.currentContext!,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [navigation\_service](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. pushDialog method

##### NavigationService class





talawa
1.0.0+1






