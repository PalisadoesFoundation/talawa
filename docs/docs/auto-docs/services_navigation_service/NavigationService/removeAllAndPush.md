


# removeAllAndPush method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) removeAllAndPush
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) routeName, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) tillRoute, {dynamic arguments})





<p>This function remove all the routes till the particular route and add new route.</p>
<p>params:</p>
<ul>
<li><code>routeName</code> : route that need to add</li>
<li><code>tillRoute</code> : remove all route until this route.</li>
<li><code>arguments</code> : necessary data for the route</li>
</ul>



## Implementation

```dart
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







