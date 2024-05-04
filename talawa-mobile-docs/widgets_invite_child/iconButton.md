


# iconButton function










[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) iconButton
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) key, [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) icon, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) onTap)





<p>This function is for debugging purposes.
It prints "tapped" in the console for the developer to know that the button was tapped.</p>



## Implementation

```dart
Widget iconButton(String key, Widget icon, Function onTap) {
  return Stack(
    children: [
      IconButton(
        key: Key(key),
        onPressed: () {
          print('tapped');
          onTap();
        },
        icon: icon,
      ),
    ],
  );
}
```







