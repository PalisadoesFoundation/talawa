


# notifyListeners method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void notifyListeners
()

_<span class="feature">override</span>_



<p>Call all the registered listeners.</p>
<p>Call this method whenever the object changes, to notify any clients the
object may have changed. Listeners that are added during this iteration
will not be visited. Listeners that are removed during this iteration will
not be visited after they are removed.</p>
<p>Exceptions thrown by listeners will be caught and reported using
<a href="https://api.flutter.dev/flutter/foundation/FlutterError/reportError.html">FlutterError.reportError</a>.</p>
<p>This method must not be called after <a href="../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/dispose.md">dispose</a> has been called.</p>
<p>Surprising behavior can result when reentrantly removing a listener (e.g.
in response to a notification) that has been registered multiple times.
See the discussion at <a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html">removeListener</a>.</p>



## Implementation

```dart
@override
void notifyListeners() {
  if (!_disposed) {
    super.notifyListeners();
  }
}
```







