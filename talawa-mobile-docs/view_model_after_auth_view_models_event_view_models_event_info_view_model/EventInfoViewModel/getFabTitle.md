


# getFabTitle method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) getFabTitle
()





<p>This function returns <code>String</code> type for the event registration status.</p>



## Implementation

```dart
String getFabTitle() {
  if (event.isRegisterable == false) {
    return "Not Registrable";
  } else if (event.isRegistered == true) {
    return "Registered";
  } else {
    return "Register";
  }
}
```







