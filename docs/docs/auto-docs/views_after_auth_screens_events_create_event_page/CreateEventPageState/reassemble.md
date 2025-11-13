<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/events/create_event_page.dart](../../views_after_auth_screens_events_create_event_page/views_after_auth_screens_events_create_event_page-library.md)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  reassemble method

<div class="self-name">

reassemble

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

# <span class="kind-method">reassemble</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[protected](https://pub.dev/documentation/meta/1.16.0/meta/protected-constant.html)
2.  @[mustCallSuper](https://pub.dev/documentation/meta/1.16.0/meta/mustCallSuper-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">reassemble</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Called whenever the application is reassembled during debugging, for
example during hot reload.

This method should rerun any initialization logic that depends on global
state, for example, image loading from asset bundles (since the asset
bundle may have changed).

This function will only be called during development. In release builds,
the `ext.flutter.reassemble` hook is not available, and so this code
will never execute.

Implementers should not rely on any ordering for hot reload source
update, reassemble, and build methods after a hot reload has been
initiated. It is possible that a
[Timer](https://api.flutter.dev/flutter/dart-async/Timer-class.html)
(e.g. an `Animation`) or a debugging session attached to the isolate
could trigger a build with reloaded code *before* reassemble is called.
Code that expects preconditions to be set by reassemble after a hot
reload must be resilient to being called out of order, e.g. by fizzling
instead of throwing. That said, once reassemble is called, build will be
called after it at least once.

In addition to this method being invoked, it is guaranteed that the
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
method will be invoked when a reassemble is signaled. Most widgets
therefore do not need to do anything in the
[reassemble](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/reassemble.md)
method.

See also:

- `Element.reassemble`
- `BindingBase.reassembleApplication`
- `Image`, which uses this to reload images.

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
4.  reassemble method

##### CreateEventPageState class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
