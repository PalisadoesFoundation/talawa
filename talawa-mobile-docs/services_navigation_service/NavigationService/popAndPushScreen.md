


# popAndPushScreen method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) popAndPushScreen
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) routeName, {dynamic arguments})





<p>This function pop the initial route and push the new route to the navigator.</p>
<p>params:</p>
<ul>
<li><code>routeName</code></li>
<li><code>arguments</code> : necessary data for the route</li>
</ul>



## Implementation

```dart
Future<dynamic> popAndPushScreen(String routeName, {dynamic arguments}) {
  navigatorKey.currentState!.pop();
  return pushScreen(routeName, arguments: arguments);
}
```







