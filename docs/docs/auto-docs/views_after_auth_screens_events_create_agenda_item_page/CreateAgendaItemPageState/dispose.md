<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/events/create_agenda_item_page.dart](../../views_after_auth_screens_events_create_agenda_item_page/views_after_auth_screens_events_create_agenda_item_page-library.md)
3.  [CreateAgendaItemPageState](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState-class.md)
4.  dispose method

<div class="self-name">

dispose

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">dispose</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[protected](https://pub.dev/documentation/meta/1.16.0/meta/protected-constant.html)
2.  @[mustCallSuper](https://pub.dev/documentation/meta/1.16.0/meta/mustCallSuper-constant.html)

</div>

<span class="returntype">void</span> <span class="name">dispose</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Called when this object is removed from the tree permanently.

The framework calls this method when this `State` object will never
build again. After the framework calls
[dispose](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/dispose.md),
the `State` object is considered unmounted and the
[mounted](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/mounted.md)
property is false. It is an error to call
[setState](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/setState.md)
at this point. This stage of the lifecycle is terminal: there is no way
to remount a `State` object that has been disposed.

Subclasses should override this method to release any resources retained
by this object (e.g., stop any active animations).

If a `State`'s
[build](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/build.md)
method depends on an object that can itself change state, for example a
`ChangeNotifier` or
[Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html),
or some other object to which one can subscribe to receive
notifications, then be sure to subscribe and unsubscribe properly in
[initState](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/initState.md),
[didUpdateWidget](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/didUpdateWidget.md),
and
[dispose](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/dispose.md):

- In
  [initState](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/initState.md),
  subscribe to the object.
- In
  [didUpdateWidget](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/didUpdateWidget.md)
  unsubscribe from the old object and subscribe to the new one if the
  updated widget configuration requires replacing the object.
- In
  [dispose](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/dispose.md),
  unsubscribe from the object.

Implementations of this method should end with a call to the inherited
method, as in `super.`.

## Caveats

This method is *not* invoked at times where a developer might otherwise
expect it, such as application shutdown or dismissal via platform native
methods.

### Application shutdown

There is no way to predict when application shutdown will happen. For
example, a user's battery could catch fire, or the user could drop the
device into a swimming pool, or the operating system could unilaterally
terminate the application process due to memory pressure.

Applications are responsible for ensuring that they are well-behaved
even in the face of a rapid unscheduled termination.

To artificially cause the entire widget tree to be disposed, consider
calling `runApp` with a widget such as `SizedBox.shrink`.

To listen for platform shutdown messages (and other lifecycle changes),
consider the `AppLifecycleListener` API.

## Dismissing Flutter UI via platform native methods

An application may have both Flutter and non-Flutter UI in it. If the
application calls non-Flutter methods to remove Flutter based UI such as
platform native API to manipulate the platform native navigation stack,
the framework does not know if the developer intends to eagerly free
resources or not. The widget tree remains mounted and ready to render as
soon as it is displayed again.

See the method used to bootstrap the app (e.g. `runApp` or `runWidget`)
for suggestions on how to release resources more eagerly.

See also:

- [deactivate](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/deactivate.md),
  which is called prior to
  [dispose](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/dispose.md).

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
2.  [create_agenda_item_page](../../views_after_auth_screens_events_create_agenda_item_page/views_after_auth_screens_events_create_agenda_item_page-library.md)
3.  [CreateAgendaItemPageState](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState-class.md)
4.  dispose method

##### CreateAgendaItemPageState class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
