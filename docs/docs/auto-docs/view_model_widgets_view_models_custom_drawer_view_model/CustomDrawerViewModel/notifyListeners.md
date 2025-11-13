<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [view_model/widgets_view_models/custom_drawer_view_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.md)
4.  notifyListeners method

<div class="self-name">

notifyListeners

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">notifyListeners</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">notifyListeners</span>

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div class="section desc markdown">

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

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
void  
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [custom_drawer_view_model](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.md)
4.  notifyListeners method

##### CustomDrawerViewModel class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
