




showSnackBar method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. showSnackBar method

showSnackBar


dark\_mode

light\_mode




# showSnackBar method


void
showSnackBar(

1. String message, {
2. Duration duration = const Duration(seconds: 2),

})

This is used for the quick alert of `duration: 2 seconds` with text message(passed).

**params**:

* `message`: Message would be shown on snackbar
* `duration`: Duration of Snackbar

**returns**:
None


## Implementation

```
void showSnackBar(
  String message, {
  Duration duration = const Duration(seconds: 2),
}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: duration,
      content: Text(
        AppLocalizations.of(navigatorKey.currentContext!)!
            .strictTranslate(message),
      ),
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [navigation\_service](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. showSnackBar method

##### NavigationService class





talawa
1.0.0+1






