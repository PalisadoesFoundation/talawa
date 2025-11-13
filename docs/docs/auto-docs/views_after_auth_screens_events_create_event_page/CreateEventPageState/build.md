<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/events/create_event_page.dart](../../views_after_auth_screens_events_create_event_page/)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  build method

<div class="self-name">

build

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_events_create_event_page/CreateEventPageState-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">build</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span>
<span class="name">build</span>(

1.  <span id="build-param-context"
    class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span>
    <span class="parameter-name">context</span></span>

)

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div class="section desc markdown">

Describes the part of the user interface represented by this widget.

The framework calls this method in a number of different situations. For
example:

- After calling
  [initState](https://api.flutter.dev/flutter/widgets/State/initState.html).
- After calling
  [didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html).
- After receiving a call to
  [setState](https://api.flutter.dev/flutter/widgets/State/setState.html).
- After a dependency of this
  [State](https://api.flutter.dev/flutter/widgets/State-class.html)
  object changes (e.g., an
  [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.md)
  referenced by the previous
  [build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
  changes).
- After calling
  [deactivate](https://api.flutter.dev/flutter/widgets/State/deactivate.html)
  and then reinserting the
  [State](https://api.flutter.dev/flutter/widgets/State-class.html)
  object into the tree at another location.

This method can potentially be called in every frame and should not have
any side effects beyond building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether
the widget returned by this method can update the root of the existing
subtree, as determined by calling
[Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of
widgets that are configured with information from this widget's
constructor, the given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html),
and the internal state of this
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object.

The given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
contains information about the location in the tree at which this widget
is being built. For example, the context provides the set of inherited
widgets for this location in the tree. The
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
argument is always the same as the `context` property of this
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
and will remain the same for the lifetime of this object. The
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
argument is provided redundantly here so that this method matches the
signature for a
[WidgetBuilder](https://api.flutter.dev/flutter/widgets/WidgetBuilder.html).

## Design discussion

### Why is the [build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md) method on [State](https://api.flutter.dev/flutter/widgets/State-class.html), and not [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)?

Putting a `Widget build(BuildContext context)` method on
[State](https://api.flutter.dev/flutter/widgets/State-class.html) rather
than putting a `Widget build(BuildContext context, State state)` method
on
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
gives developers more flexibility when subclassing
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html).

For example,
[AnimatedWidget](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html)
is a subclass of
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
that introduces an abstract `Widget build(BuildContext context)` method
for its subclasses to implement. If
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
already had a
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
method that took a
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
argument,
[AnimatedWidget](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html)
would be forced to provide its
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
to subclasses even though its
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
is an internal implementation detail of
[AnimatedWidget](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html).

Conceptually,
[StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
could also be implemented as a subclass of
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
in a similar manner. If the
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
method were on
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
rather than
[State](https://api.flutter.dev/flutter/widgets/State-class.html), that
would not be possible anymore.

Putting the
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
function on
[State](https://api.flutter.dev/flutter/widgets/State-class.html) rather
than
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
also helps avoid a category of bugs related to closures implicitly
capturing `this`. If you defined a closure in a
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
function on a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html),
that closure would implicitly capture `this`, which is the current
widget instance, and would have the (immutable) fields of that instance
in scope:

``` language-dart
// (this is not valid Flutter code)
class MyButton extends StatefulWidgetX 
```

For example, suppose the parent builds `MyButton` with `color` being
blue, the `$color` in the print function refers to blue, as expected.
Now, suppose the parent rebuilds `MyButton` with green. The closure
created by the first build still implicitly refers to the original
widget and the `$color` still prints blue even through the widget has
been updated to green; should that closure outlive its widget, it would
print outdated information.

In contrast, with the
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
function on the
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object, closures created during
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
implicitly capture the
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
instance instead of the widget instance:

``` language-dart
class MyButton extends StatefulWidget 

class MyButtonState extends State<MyButton> 
```

Now when the parent rebuilds `MyButton` with green, the closure created
by the first build still refers to
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object, which is preserved across rebuilds, but the framework has
updated that
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object's
[widget](https://api.flutter.dev/flutter/widgets/State/widget.html)
property to refer to the new `MyButton` instance and `$`
prints green, as expected.

See also:

- [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html),
  which contains the discussion on performance considerations.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
Widget build(BuildContext context) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [create_event_page](../../views_after_auth_screens_events_create_event_page/)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  build method

##### CreateEventPageState class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
