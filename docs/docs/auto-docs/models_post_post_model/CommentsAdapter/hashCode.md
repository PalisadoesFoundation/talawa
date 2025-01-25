::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/post/post_model.dart](../../models_post_post_model/)
3.  [CommentsAdapter](../../models_post_post_model/CommentsAdapter-class.html)
4.  hashCode property

::: self-name
hashCode
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_post_post_model/CommentsAdapter-class-sidebar.html" below-sidebar=""}
<div>

# [hashCode]{.kind-property} property

</div>

::: {#getter .section}
::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.returntype}
get [hashCode]{.name}

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
The hash code for this object.

A hash code is a single integer which represents the state of the object
that affects [operator
==](../../models_post_post_model/CommentsAdapter/operator_equals.html)
comparisons.

All objects have hash codes. The default hash code implemented by
[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
represents only the identity of the object, the same way as the default
[operator
==](../../models_post_post_model/CommentsAdapter/operator_equals.html)
implementation only considers objects equal if they are identical (see
[identityHashCode](https://api.flutter.dev/flutter/dart-core/identityHashCode.html)).

If [operator
==](../../models_post_post_model/CommentsAdapter/operator_equals.html)
is overridden to use the object state instead, the hash code must also
be changed to represent that state, otherwise the object cannot be used
in hash based data structures like the default
[Set](https://api.flutter.dev/flutter/dart-core/Set-class.html) and
[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)
implementations.

Hash codes must be the same for objects that are equal to each other
according to [operator
==](../../models_post_post_model/CommentsAdapter/operator_equals.html).
The hash code of an object should only change if the object changes in a
way that affects equality. There are no further requirements for the
hash codes. They need not be consistent between executions of the same
program and there are no distribution guarantees.

Objects that are not equal are allowed to have the same hash code. It is
even technically allowed that all instances have the same hash code, but
if clashes happen too often, it may reduce the efficiency of hash-based
data structures like
[HashSet](https://api.flutter.dev/flutter/dart-collection/HashSet-class.html)
or
[HashMap](https://api.flutter.dev/flutter/dart-collection/HashMap-class.html).

If a subclass overrides
[hashCode](../../models_post_post_model/CommentsAdapter/hashCode.html),
it should override the [operator
==](../../models_post_post_model/CommentsAdapter/operator_equals.html)
operator as well to maintain consistency.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
int get hashCode => typeId.hashCode;
```
:::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [CommentsAdapter](../../models_post_post_model/CommentsAdapter-class.html)
4.  hashCode property

##### CommentsAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
