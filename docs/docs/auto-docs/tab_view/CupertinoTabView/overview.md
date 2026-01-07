# Overview for `CupertinoTabView`

## Description

A single tab view with its own [Navigator] state and history.

 A typical tab view is used as the content of each tab in a
 [CupertinoTabScaffold] where multiple tabs with parallel navigation states
 and history can co-exist.

 [CupertinoTabView] configures the top-level [Navigator] to search for routes
 in the following order:

  1. For the `/` route, the [builder] property, if non-null, is used.

  2. Otherwise, the [routes] table is used, if it has an entry for the route,
     including `/` if [builder] is not specified.

  3. Otherwise, [onGenerateRoute] is called, if provided. It should return a
     non-null value for any _valid_ route not handled by [builder] and [routes].

  4. Finally if all else fails [onUnknownRoute] is called.

 These navigation properties are not shared with any sibling [CupertinoTabView]
 nor any ancestor or descendant [Navigator] instances.

 To push a route above this [CupertinoTabView] instead of inside it (such
 as when showing a dialog on top of all tabs), use
 `Navigator.of(rootNavigator: true)`.

 See also:

  * [CupertinoTabScaffold], a typical host that supports switching between tabs.
  * [CupertinoPageRoute], a typical modal page route pushed onto the
    [CupertinoTabView]'s [Navigator].

## Dependencies

- StatefulWidget

## Members

- **builder**: `WidgetBuilder?`
  The widget builder for the default route of the tab view
 ([Navigator.defaultRouteName], which is `/`).

 If a [builder] is specified, then [routes] must not include an entry for `/`,
 as [builder] takes its place.

 Rebuilding a [CupertinoTabView] with a different [builder] will not clear
 its current navigation stack or update its descendant. Instead, trigger a
 rebuild from a descendant in its subtree. This can be done via methods such
 as:

  * Calling [State.setState] on a descendant [StatefulWidget]'s [State]
  * Modifying an [InheritedWidget] that a descendant registered itself
    as a dependent to.

- **navigatorKey**: `GlobalKey&lt;NavigatorState&gt;?`
  A key to use when building this widget's [Navigator].

 If a [navigatorKey] is specified, the [Navigator] can be directly
 manipulated without first obtaining it from a [BuildContext] via
 [Navigator.of]: from the [navigatorKey], use the [GlobalKey.currentState]
 getter.

 If this is changed, a new [Navigator] will be created, losing all the
 tab's state in the process; in that case, the [navigatorObservers]
 must also be changed, since the previous observers will be attached to the
 previous navigator.

- **defaultTitle**: `String?`
  The title of the default route.

- **routes**: `Map&lt;String, WidgetBuilder&gt;?`
  This tab view's routing table.

 When a named route is pushed with [Navigator.pushNamed] inside this tab view,
 the route name is looked up in this map. If the name is present,
 the associated [WidgetBuilder] is used to construct a
 [CupertinoPageRoute] that performs an appropriate transition to the new
 route.

 If the tab view only has one page, then you can specify it using [builder] instead.

 If [builder] is specified, then it implies an entry in this table for the
 [Navigator.defaultRouteName] route (`/`), and it is an error to
 redundantly provide such a route in the [routes] table.

 If a route is requested that is not specified in this table (or by
 [builder]), then the [onGenerateRoute] callback is called to build the page
 instead.

 This routing table is not shared with any routing tables of ancestor or
 descendant [Navigator]s.

- **onGenerateRoute**: `RouteFactory?`
  The route generator callback used when the tab view is navigated to a named route.

 This is used if [routes] does not contain the requested route.

- **onUnknownRoute**: `RouteFactory?`
  Called when [onGenerateRoute] also fails to generate a route.

 This callback is typically used for error handling. For example, this
 callback might always generate a "not found" page that describes the route
 that wasn't found.

 The default implementation pushes a route that displays an ugly error
 message.

- **navigatorObservers**: `List&lt;NavigatorObserver&gt;`
  The list of observers for the [Navigator] created in this tab view.

 This list of observers is not shared with ancestor or descendant [Navigator]s.

- **restorationScopeId**: `String?`
  Restoration ID to save and restore the state of the [Navigator] built by
 this [CupertinoTabView].

 

## Constructors

### Unnamed Constructor
Creates the content area for a tab in a [CupertinoTabScaffold].

