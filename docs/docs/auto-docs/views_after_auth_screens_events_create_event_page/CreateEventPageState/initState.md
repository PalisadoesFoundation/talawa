<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/events/create_event_page.dart](../../views_after_auth_screens_events_create_event_page/views_after_auth_screens_events_create_event_page-library.md)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  initState method

<div class="self-name">

initState

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

# <span class="kind-method">initState</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[protected](https://pub.dev/documentation/meta/1.16.0/meta/protected-constant.html)
2.  @[mustCallSuper](https://pub.dev/documentation/meta/1.16.0/meta/mustCallSuper-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">initState</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Called when this object is inserted into the tree.

The framework will call this method exactly once for each `State` object
it creates.

Override this method to perform initialization that depends on the
location at which this object was inserted into the tree (i.e.,
[context](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/context.md))
or on the widget used to configure this object (i.e.,
[widget](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/widget.md)).

If a `State`'s
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
method depends on an object that can itself change state, for example a
`ChangeNotifier` or
[Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html),
or some other object to which one can subscribe to receive
notifications, then be sure to subscribe and unsubscribe properly in
[initState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/initState.md),
[didUpdateWidget](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/didUpdateWidget.md),
and
[dispose](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/dispose.md):

- In
  [initState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/initState.md),
  subscribe to the object.
- In
  [didUpdateWidget](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/didUpdateWidget.md)
  unsubscribe from the old object and subscribe to the new one if the
  updated widget configuration requires replacing the object.
- In
  [dispose](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/dispose.md),
  unsubscribe from the object.

You should not use `BuildContext.dependOnInheritedWidgetOfExactType`
from this method. However,
[didChangeDependencies](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/didChangeDependencies.md)
will be called immediately following this method, and
`BuildContext.dependOnInheritedWidgetOfExactType` can be used there.

Implementations of this method should start with a call to the inherited
method, as in `super.`.

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
4.  initState method

##### CreateEventPageState class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
