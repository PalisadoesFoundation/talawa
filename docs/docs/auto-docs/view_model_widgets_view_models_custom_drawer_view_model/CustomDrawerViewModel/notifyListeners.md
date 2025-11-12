



menu

1.  [talawa](../../index.md)
2.  [view_model/widgets_view_models/custom_drawer_view_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.md)
4.  notifyListeners method


notifyListeners


 dark_mode   light_mode 




<div>

# notifyListeners method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

void 


override




Call all the registered listeners.

Call this method whenever the object changes, to notify any clients the
object may have changed. Listeners that are added during this iteration
will not be visited. Listeners that are removed during this iteration
will not be visited after they are removed.

Exceptions thrown by listeners will be caught and reported using
[FlutterError.reportError](https://api.flutter.dev/flutter/foundation/FlutterError/reportError.html).

This method must not be called after
[dispose](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/dispose.md)
has been called.

Surprising behavior can result when reentrantly removing a listener
(e.g. in response to a notification) that has been registered multiple
times. See the discussion at
[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html).



## Implementation

``` language-dart
@override
void  
```







1.  [talawa](../../index.md)
2.  [custom_drawer_view_model](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.md)
4.  notifyListeners method

##### CustomDrawerViewModel class









 talawa 1.0.0+1 
