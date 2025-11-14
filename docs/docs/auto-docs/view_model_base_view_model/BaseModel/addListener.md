<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [base_view_model](../../view_model_base_view_model/view_model_base_view_model-library.md)
3.  [BaseModel](../../view_model_base_view_model/BaseModel-class.md)
4.  addListener method

<div class="self-name">

addListener

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

# <span class="kind-method">addListener</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">addListener</span>(

1.  <span id="addListener-param-listener"
    class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span>
    <span class="parameter-name">listener</span></span>

)

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Register a closure to be called when the object changes.

If the given closure is already registered, an additional instance is
added, and must be removed the same number of times it is added before
it will stop being called.

This method must not be called after
[dispose](../../view_model_base_view_model/BaseModel/dispose.md) has
been called.

If a listener is added twice, and is removed once during an iteration
(e.g. in response to a notification), it will still be called again. If,
on the other hand, it is removed as many times as it was registered,
then it will no longer be called. This odd behavior is the result of the
`ChangeNotifier` not being able to determine which listener is being
removed, since they are identical, therefore it will conservatively
still call all the listeners when it knows that any are still
registered.

This surprising behavior can be unexpectedly observed when registering a
listener on two separate objects which are both forwarding all
registrations to a common upstream object.

See also:

- [removeListener](../../view_model_base_view_model/BaseModel/removeListener.md),
  which removes a previously registered closure from the list of
  closures that are notified when the object changes.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
void addListener(VoidCallback listener) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [base_view_model](../../view_model_base_view_model/view_model_base_view_model-library.md)
3.  [BaseModel](../../view_model_base_view_model/BaseModel-class.md)
4.  addListener method

##### BaseModel class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
