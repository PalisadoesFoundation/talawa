<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [base_view_model](../../view_model_base_view_model/view_model_base_view_model-library.md)
3.  [BaseModel](../../view_model_base_view_model/BaseModel-class.md)
4.  hasListeners property

<div class="self-name">

hasListeners

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_base_view_model/BaseModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">hasListeners</span> property

</div>

<div id="getter" class="section">

<div class="section multi-line-signature">

<div>

1.  @[protected](https://pub.dev/documentation/meta/1.16.0/meta/protected-constant.html)

</div>

<span class="returntype">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>
<span class="name">hasListeners</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Whether any listeners are currently registered.

Clients should not depend on this value for their behavior, because
having one listener's logic change when another listener happens to
start or stop listening will lead to extremely hard-to-track bugs.
Subclasses might use this information to determine whether to do any
work when there are no listeners, however; for example, resuming a
[Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)
when a listener is added and pausing it when a listener is removed.

Typically this is used by overriding
[addListener](../../view_model_base_view_model/BaseModel/addListener.md),
checking if
[hasListeners](../../view_model_base_view_model/BaseModel/hasListeners.md)
is false before calling `super.`, and if so, starting
whatever work is needed to determine when to call
[notifyListeners](../../view_model_base_view_model/BaseModel/notifyListeners.md);
and similarly, by overriding
[removeListener](../../view_model_base_view_model/BaseModel/removeListener.md),
checking if
[hasListeners](../../view_model_base_view_model/BaseModel/hasListeners.md)
is false after calling `super.`, and if so, stopping
that same work.

This method returns false if
[dispose](../../view_model_base_view_model/BaseModel/dispose.md) has
been called.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@protected
bool get hasListeners => _count > 0;
```

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [base_view_model](../../view_model_base_view_model/view_model_base_view_model-library.md)
3.  [BaseModel](../../view_model_base_view_model/BaseModel-class.md)
4.  hasListeners property

##### BaseModel class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
