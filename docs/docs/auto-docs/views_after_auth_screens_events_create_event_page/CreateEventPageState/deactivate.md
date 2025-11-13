<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/events/create_event_page.dart](../../views_after_auth_screens_events_create_event_page/views_after_auth_screens_events_create_event_page-library.md)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  deactivate method

<div class="self-name">

deactivate

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_events_create_event_page/CreateEventPageState-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">deactivate</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[protected](https://pub.dev/documentation/meta/1.16.0/meta/protected-constant.html)
2.  @[mustCallSuper](https://pub.dev/documentation/meta/1.16.0/meta/mustCallSuper-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">deactivate</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Called when this object is removed from the tree.

The framework calls this method whenever it removes this `State` object
from the tree. In some cases, the framework will reinsert the `State`
object into another part of the tree (e.g., if the subtree containing
this `State` object is grafted from one location in the tree to another
due to the use of a `GlobalKey`). If that happens, the framework will
call
[activate](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/activate.md)
to give the `State` object a chance to reacquire any resources that it
released in
[deactivate](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/deactivate.md).
It will then also call
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
to give the `State` object a chance to adapt to its new location in the
tree. If the framework does reinsert this subtree, it will do so before
the end of the animation frame in which the subtree was removed from the
tree. For this reason, `State` objects can defer releasing most
resources until the framework calls their
[dispose](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/dispose.md)
method.

Subclasses should override this method to clean up any links between
this object and other elements in the tree (e.g. if you have provided an
ancestor with a pointer to a descendant's `RenderObject`).

Implementations of this method should end with a call to the inherited
method, as in `super.`.

See also:

- [dispose](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/dispose.md),
  which is called after
  [deactivate](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/deactivate.md)
  if the widget is removed from the tree permanently.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@protected
@mustCallSuper
void  
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [create_event_page](../../views_after_auth_screens_events_create_event_page/views_after_auth_screens_events_create_event_page-library.md)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  deactivate method

##### CreateEventPageState class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
