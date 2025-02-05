


# build method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) build
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_<span class="feature">override</span>_



<p>build the Plugin combining local <code>visibility</code> property and <code>serverVisible</code> property</p>



## Implementation

```dart
@override
Widget build(BuildContext context) {
  var serverVisible = false;
  serverVisible = checkFromPluginList();
  return serverVisible || visible ? child! : Container();
}
```







