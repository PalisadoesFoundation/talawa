::::::::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_model/AttendeeAdapter-class-sidebar.html" below-sidebar=""}
<div>

# [operator ==]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype}
[operator ==]{.name}(

1.  [[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation}
    [other]{.parameter-name}]{#==-param-other .parameter}

)

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
The equality operator.

The default behavior for all
[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)s
is to return true if and only if this object and `other` are the same
object.

Override this method to specify a different equality relation on a
class. The overriding method must still be an equivalence relation. That
is, it must be:

-   Total: It must return a boolean for all arguments. It should never
    throw.

-   Reflexive: For all objects `o`, `o == o` must be true.

-   Symmetric: For all objects `o1` and `o2`, `o1 == o2` and `o2 == o1`
    must either both be true, or both be false.

-   Transitive: For all objects `o1`, `o2`, and `o3`, if `o1 == o2` and
    `o2 == o3` are true, then `o1 == o3` must be true.

The method should also be consistent over time, so whether two objects
are equal should only change if at least one of the objects was
modified.

If a subclass overrides the equality operator, it should override the
[hashCode](../../models_events_event_model/AttendeeAdapter/hashCode.html)
method as well to maintain consistency.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
bool operator ==(Object other) =>
    identical(this, other) ||
    other is AttendeeAdapter &&
        runtimeType == other.runtimeType &&
        typeId == other.typeId;
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_model](../../models_events_event_model/)
3.  [AttendeeAdapter](../../models_events_event_model/AttendeeAdapter-class.html)
4.  operator == method

##### AttendeeAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
