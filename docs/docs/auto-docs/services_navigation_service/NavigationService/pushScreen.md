


# pushScreen method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) pushScreen
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) routeName, \{dynamic arguments\})





<p>This function push the route to the navigator.</p>
<p>params:</p>
<ul>
<li>```dartrouteName```</li>
<li>```dartarguments``` : necessary data for the route</li>
</ul>



## Implementation

```dart
Future<dynamic> pushScreen(String routeName, \{dynamic arguments\}) \{
  return navigatorKey.currentState!
      .pushNamed(routeName, arguments: arguments);
\}
```







