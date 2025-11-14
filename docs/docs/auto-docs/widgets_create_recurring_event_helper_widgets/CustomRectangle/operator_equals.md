<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [create_recurring_event_helper_widgets](../../widgets_create_recurring_event_helper_widgets/widgets_create_recurring_event_helper_widgets-library.md)
3.  [CustomRectangle](../../widgets_create_recurring_event_helper_widgets/CustomRectangle-class.md)
4.  operator == method

<div class="self-name">

operator ==

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="widgets_create_recurring_event_helper_widgets/CustomRectangle-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">operator ==</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)
2.  @[nonVirtual](https://pub.dev/documentation/meta/1.16.0/meta/nonVirtual-constant.html)

</div>

<span class="returntype">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>
<span class="name">operator ==</span>(

1.  <span id="==-param-other"
    class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span>
    <span class="parameter-name">other</span></span>

)

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

The equality operator.

The default behavior for all
[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)s
is to return true if and only if this object and `other` are the same
object.

Override this method to specify a different equality relation on a
class. The overriding method must still be an equivalence relation. That
is, it must be:

- Total: It must return a boolean for all arguments. It should never
  throw.

- Reflexive: For all objects `o`, `o == o` must be true.

- Symmetric: For all objects `o1` and `o2`, `o1 == o2` and `o2 == o1`
  must either both be true, or both be false.

- Transitive: For all objects `o1`, `o2`, and `o3`, if `o1 == o2` and
  `o2 == o3` are true, then `o1 == o3` must be true.

The method should also be consistent over time, so whether two objects
are equal should only change if at least one of the objects was
modified.

If a subclass overrides the equality operator, it should override the
[hashCode](../../widgets_create_recurring_event_helper_widgets/CustomRectangle/hashCode.md)
method as well to maintain consistency.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
@nonVirtual
bool operator ==(Object other) => super == other;
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [create_recurring_event_helper_widgets](../../widgets_create_recurring_event_helper_widgets/widgets_create_recurring_event_helper_widgets-library.md)
3.  [CustomRectangle](../../widgets_create_recurring_event_helper_widgets/CustomRectangle-class.md)
4.  operator == method

##### CustomRectangle class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
