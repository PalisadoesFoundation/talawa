::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [widgets/post_container.dart](../../widgets_post_container/)
3.  [PostContainerState](../../widgets_post_container/PostContainerState-class.html)
4.  initState method

::: self-name
initState
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_post_container/PostContainerState-class-sidebar.html" below-sidebar=""}
<div>

# [initState]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[void]{.returntype} [initState]{.name}()

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Called when this object is inserted into the tree.

The framework will call this method exactly once for each
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
it creates.

Override this method to perform initialization that depends on the
location at which this object was inserted into the tree (i.e.,
[context](https://api.flutter.dev/flutter/widgets/State/context.html))
or on the widget used to configure this object (i.e.,
[widget](https://api.flutter.dev/flutter/widgets/State/widget.html)).

If a
[State](https://api.flutter.dev/flutter/widgets/State-class.html)\'s
[build](../../widgets_post_container/PostContainerState/build.html)
method depends on an object that can itself change state, for example a
[ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
or
[Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html),
or some other object to which one can subscribe to receive
notifications, then be sure to subscribe and unsubscribe properly in
[initState](../../widgets_post_container/PostContainerState/initState.html),
[didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html),
and
[dispose](../../widgets_post_container/PostContainerState/dispose.html):

-   In
    [initState](../../widgets_post_container/PostContainerState/initState.html),
    subscribe to the object.
-   In
    [didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html)
    unsubscribe from the old object and subscribe to the new one if the
    updated widget configuration requires replacing the object.
-   In
    [dispose](../../widgets_post_container/PostContainerState/dispose.html),
    unsubscribe from the object.

You should not use
[BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html)
from this method. However,
[didChangeDependencies](https://api.flutter.dev/flutter/widgets/State/didChangeDependencies.html)
will be called immediately following this method, and
[BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html)
can be used there.

Implementations of this method should start with a call to the inherited
method, as in `super.initState()`.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
void initState() {
  super.initState();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_container](../../widgets_post_container/)
3.  [PostContainerState](../../widgets_post_container/PostContainerState-class.html)
4.  initState method

##### PostContainerState class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
