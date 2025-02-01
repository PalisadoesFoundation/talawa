::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/widgets_view_models/progress_dialog_view_model.dart](../../view_model_widgets_view_models_progress_dialog_view_model/)
3.  [ProgressDialogViewModel](../../view_model_widgets_view_models_progress_dialog_view_model/ProgressDialogViewModel-class.html)
4.  initialise method

::: self-name
initialise
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_progress_dialog_view_model/ProgressDialogViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialise]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[initialise]{.name}()
:::

::: {.section .desc .markdown}
Initializes the state of the component by checking the online status and
updating the view accordingly.

This method performs the following actions:

1.  Sets the view state to busy to indicate that an initialization
    process is underway.
2.  Checks the online status of the application.
    -   If the app is offline, it sets the `connectivityPresent` flag to
        `false`.
    -   If the app is online, it sets the `connectivityPresent` flag to
        `true`.
3.  Updates the view state to idle after the online status check is
    complete.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> initialise() async {
  setState(ViewState.busy);
  if (!AppConnectivity.isOnline) {
    connectivityPresent = false;
  } else {
    connectivityPresent = true;
  }
  setState(ViewState.idle);
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [progress_dialog_view_model](../../view_model_widgets_view_models_progress_dialog_view_model/)
3.  [ProgressDialogViewModel](../../view_model_widgets_view_models_progress_dialog_view_model/ProgressDialogViewModel-class.html)
4.  initialise method

##### ProgressDialogViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
