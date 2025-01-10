


# pushReplacementScreen method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) pushReplacementScreen
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) routeName, {dynamic arguments})





<p>This function push the route and replace the screen.</p>
<p>params:</p>
<ul>
<li><code>routeName</code></li>
<li><code>arguments</code> : necessary data for the route</li>
</ul>



## Implementation

```dart
Future<dynamic> pushReplacementScreen(String routeName, {dynamic arguments}) {
  return navigatorKey.currentState!
      .pushReplacementNamed(routeName, arguments: arguments);
}
```







