::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [widgets/post_container.dart](../../widgets_post_container/)
3.  [PostContainerState](../../widgets_post_container/PostContainerState-class.html)
4.  dispose method

::: self-name
dispose
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_post_container/PostContainerState-class-sidebar.html" below-sidebar=""}
<div>

# [dispose]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[void]{.returntype} [dispose]{.name}()

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Called when this object is removed from the tree permanently.

The framework calls this method when this
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
will never build again. After the framework calls
[dispose](../../widgets_post_container/PostContainerState/dispose.html),
the [State](https://api.flutter.dev/flutter/widgets/State-class.html)
object is considered unmounted and the
[mounted](https://api.flutter.dev/flutter/widgets/State/mounted.html)
property is false. It is an error to call
[setState](https://api.flutter.dev/flutter/widgets/State/setState.html)
at this point. This stage of the lifecycle is terminal: there is no way
to remount a
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
that has been disposed.

Subclasses should override this method to release any resources retained
by this object (e.g., stop any active animations).

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

Implementations of this method should end with a call to the inherited
method, as in `super.dispose()`.

## Caveats

This method is *not* invoked at times where a developer might otherwise
expect it, such as application shutdown or dismissal via platform native
methods.

### Application shutdown

There is no way to predict when application shutdown will happen. For
example, a user\'s battery could catch fire, or the user could drop the
device into a swimming pool, or the operating system could unilaterally
terminate the application process due to memory pressure.

Applications are responsible for ensuring that they are well-behaved
even in the face of a rapid unscheduled termination.

To artificially cause the entire widget tree to be disposed, consider
calling [runApp](https://api.flutter.dev/flutter/widgets/runApp.html)
with a widget such as
[SizedBox.shrink](https://api.flutter.dev/flutter/widgets/SizedBox/SizedBox.shrink.html).

To listen for platform shutdown messages (and other lifecycle changes),
consider the
[AppLifecycleListener](https://api.flutter.dev/flutter/widgets/AppLifecycleListener-class.html)
API.

## Dismissing Flutter UI via platform native methods

An application may have both Flutter and non-Flutter UI in it. If the
application calls non-Flutter methods to remove Flutter based UI such as
platform native API to manipulate the platform native navigation stack,
the framework does not know if the developer intends to eagerly free
resources or not. The widget tree remains mounted and ready to render as
soon as it is displayed again.

See the method used to bootstrap the app (e.g.
[runApp](https://api.flutter.dev/flutter/widgets/runApp.html) or
[runWidget](https://api.flutter.dev/flutter/widgets/runWidget.html)) for
suggestions on how to release resources more eagerly.

See also:

-   [deactivate](https://api.flutter.dev/flutter/widgets/State/deactivate.html),
    which is called prior to
    [dispose](../../widgets_post_container/PostContainerState/dispose.html).
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
void dispose() {
  controller.dispose();
  super.dispose();
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
4.  dispose method

##### PostContainerState class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
