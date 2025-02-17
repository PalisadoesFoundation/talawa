::::::::: {#dartdoc-main-content .main-content above-sidebar="exceptions_critical_action_exception/CriticalActionException-class-sidebar.html" below-sidebar=""}
<div>

# [toString]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[toString]{.name}()

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
A string representation of this object.

Some classes have a default textual representation, often paired with a
static `parse` function (like
[int.parse](https://api.flutter.dev/flutter/dart-core/int/parse.html)).
These classes will provide the textual representation as their string
representation.

Other classes have no meaningful textual representation that a program
will care about. Such classes will typically override `toString` to
provide useful information when inspecting the object, mainly for
debugging or logging.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
String toString() => 'CriticalActionException: $actionError';
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [critical_action_exception](../../exceptions_critical_action_exception/)
3.  [CriticalActionException](../../exceptions_critical_action_exception/CriticalActionException-class.html)
4.  toString method

##### CriticalActionException class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
