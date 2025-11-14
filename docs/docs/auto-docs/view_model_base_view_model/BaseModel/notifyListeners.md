<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [base_view_model](../../view_model_base_view_model/view_model_base_view_model-library.md)
3.  [BaseModel](../../view_model_base_view_model/BaseModel-class.md)
4.  notifyListeners method

<div class="self-name">

notifyListeners

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

# <span class="kind-method">notifyListeners</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[protected](https://pub.dev/documentation/meta/1.16.0/meta/protected-constant.html)
2.  @[visibleForTesting](https://pub.dev/documentation/meta/1.16.0/meta/visibleForTesting-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">notifyListeners</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Call all the registered listeners.

Call this method whenever the object changes, to notify any clients the
object may have changed. Listeners that are added during this iteration
will not be visited. Listeners that are removed during this iteration
will not be visited after they are removed.

Exceptions thrown by listeners will be caught and reported using
`FlutterError.reportError`.

This method must not be called after
[dispose](../../view_model_base_view_model/BaseModel/dispose.md) has
been called.

Surprising behavior can result when reentrantly removing a listener
(e.g. in response to a notification) that has been registered multiple
times. See the discussion at
[removeListener](../../view_model_base_view_model/BaseModel/removeListener.md).

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@protected
@visibleForTesting
@pragma('vm:notify-debugger-on-exception')
void  
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [base_view_model](../../view_model_base_view_model/view_model_base_view_model-library.md)
3.  [BaseModel](../../view_model_base_view_model/BaseModel-class.md)
4.  notifyListeners method

##### BaseModel class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
