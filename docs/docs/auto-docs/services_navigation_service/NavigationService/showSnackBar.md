
<div>

# showSnackBar method

</div>


void showSnackBar(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    message, {]
2.  [[[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)]
    duration = const Duration(seconds:
    2), ]

})



This is used for the quick alert of `duration: 2 seconds` with text
message(passed).

**params**:

-   `message`: Message would be shown on snackbar
-   `duration`: Duration of Snackbar

**returns**: None



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.md)
4.  showSnackBar method

##### NavigationService class







