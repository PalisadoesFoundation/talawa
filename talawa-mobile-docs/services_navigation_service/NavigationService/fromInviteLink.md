


# fromInviteLink method








void fromInviteLink
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html)> routeNames, [List](https://api.flutter.dev/flutter/dart-core/List-class.html) arguments)








## Implementation

```dart
void fromInviteLink(List<String> routeNames, List<dynamic> arguments) {
  int i = 0;
  removeAllAndPush('/${routeNames[i]}', '/', arguments: arguments[i]);
  for (i = 1; i < routeNames.length; i++) {
    pushScreen('/${routeNames[i]}', arguments: arguments[i]);
  }
}
```







