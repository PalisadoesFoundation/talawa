::::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_post_container/PostContainer-class-sidebar.html" below-sidebar=""}
<div>

# [createState]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[PostContainerState](../../widgets_post_container/PostContainerState-class.html)]{.returntype}
[createState]{.name}()

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Creates the mutable state for this widget at a given location in the
tree.

Subclasses should override this method to return a newly created
instance of their associated
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
subclass:

``` language-dart
@override
State<SomeWidget> createState() => _SomeWidgetState();
```

The framework can call this method multiple times over the lifetime of a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html).
For example, if the widget is inserted into the tree in multiple
locations, the framework will create a separate
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
for each location. Similarly, if the widget is removed from the tree and
later inserted into the tree again, the framework will call
[createState](../../widgets_post_container/PostContainer/createState.html)
again to create a fresh
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object, simplifying the lifecycle of
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
objects.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
PostContainerState createState() => PostContainerState();
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_container](../../widgets_post_container/)
3.  [PostContainer](../../widgets_post_container/PostContainer-class.html)
4.  createState method

##### PostContainer class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
