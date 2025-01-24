




notifyListeners method - CustomDrawerViewModel class - custom\_drawer\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/custom\_drawer\_view\_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. notifyListeners method

notifyListeners


dark\_mode

light\_mode




# notifyListeners method


1. @override

void
notifyListeners()
override

Call all the registered listeners.

Call this method whenever the object changes, to notify any clients the
object may have changed. Listeners that are added during this iteration
will not be visited. Listeners that are removed during this iteration will
not be visited after they are removed.

Exceptions thrown by listeners will be caught and reported using
[FlutterError.reportError](https://api.flutter.dev/flutter/foundation/FlutterError/reportError.html).

This method must not be called after [dispose](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/dispose.html) has been called.

Surprising behavior can result when reentrantly removing a listener (e.g.
in response to a notification) that has been registered multiple times.
See the discussion at [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html).


## Implementation

```
@override
void notifyListeners() {
  if (!_disposed) {
    super.notifyListeners();
  }
}
```

 


1. [talawa](../../index.html)
2. [custom\_drawer\_view\_model](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. notifyListeners method

##### CustomDrawerViewModel class





talawa
1.0.0+1






