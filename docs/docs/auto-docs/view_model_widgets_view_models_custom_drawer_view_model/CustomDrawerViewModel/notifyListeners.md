::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/widgets_view_models/custom_drawer_view_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4.  notifyListeners method

::: self-name
notifyListeners
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [notifyListeners]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[void]{.returntype} [notifyListeners]{.name}()

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Call all the registered listeners.

Call this method whenever the object changes, to notify any clients the
object may have changed. Listeners that are added during this iteration
will not be visited. Listeners that are removed during this iteration
will not be visited after they are removed.

Exceptions thrown by listeners will be caught and reported using
[FlutterError.reportError](https://api.flutter.dev/flutter/foundation/FlutterError/reportError.html).

This method must not be called after
[dispose](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel/dispose.html)
has been called.

Surprising behavior can result when reentrantly removing a listener
(e.g. in response to a notification) that has been registered multiple
times. See the discussion at
[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html).
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
void notifyListeners() {
  if (!_disposed) {
    super.notifyListeners();
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [custom_drawer_view_model](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4.  notifyListeners method

##### CustomDrawerViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
