# Overview for `Navigator`

## Description

A widget that manages a set of child widgets with a stack discipline.

 Many apps have a navigator near the top of their widget hierarchy in order
 to display their logical history using an [Overlay] with the most recently
 visited pages visually on top of the older pages. Using this pattern lets
 the navigator visually transition from one page to another by moving the widgets
 around in the overlay. Similarly, the navigator can be used to show a dialog
 by positioning the dialog widget above the current page.

 ## Using the Pages API

 The [Navigator] will convert its [Navigator.pages] into a stack of [Route]s
 if it is provided. A change in [Navigator.pages] will trigger an update to
 the stack of [Route]s. The [Navigator] will update its routes to match the
 new configuration of its [Navigator.pages]. To use this API, one can create
 a [Page] subclass and defines a list of [Page]s for [Navigator.pages]. A
 [Navigator.onPopPage] callback is also required to properly clean up the
 input pages in case of a pop.

 By Default, the [Navigator] will use [DefaultTransitionDelegate] to decide
 how routes transition in or out of the screen. To customize it, define a
 [TransitionDelegate] subclass and provide it to the
 [Navigator.transitionDelegate].

 For more information on using the pages API, see the [Router] widget.

 ## Using the Navigator API

 Mobile apps typically reveal their contents via full-screen elements
 called "screens" or "pages". In Flutter these elements are called
 routes and they're managed by a [Navigator] widget. The navigator
 manages a stack of [Route] objects and provides two ways for managing
 the stack, the declarative API [Navigator.pages] or imperative API
 [Navigator.push] and [Navigator.pop].

 When your user interface fits this paradigm of a stack, where the user
 should be able to _navigate_ back to an earlier element in the stack,
 the use of routes and the Navigator is appropriate. On certain platforms,
 such as Android, the system UI will provide a back button (outside the
 bounds of your application) that will allow the user to navigate back
 to earlier routes in your application's stack. On platforms that don't
 have this build-in navigation mechanism, the use of an [AppBar] (typically
 used in the [Scaffold.appBar] property) can automatically add a back
 button for user navigation.

 ### Displaying a full-screen route

 Although you can create a navigator directly, it's most common to use the
 navigator created by the `Router` which itself is created and configured by
 a [WidgetsApp] or a [MaterialApp] widget. You can refer to that navigator
 with [Navigator.of].

 A [MaterialApp] is the simplest way to set things up. The [MaterialApp]'s
 home becomes the route at the bottom of the [Navigator]'s stack. It is what
 you see when the app is launched.

 ```dart
 void  
 ```

 To push a new route on the stack you can create an instance of
 [MaterialPageRoute] with a builder function that creates whatever you
 want to appear on the screen. For example:

 ```dart
 Navigator.push(context, MaterialPageRoute&lt;void&gt;(
   builder: (BuildContext context) ,
 ));
 ```

 The route defines its widget with a builder function instead of a
 child widget because it will be built and rebuilt in different
 contexts depending on when it's pushed and popped.

 As you can see, the new route can be popped, revealing the app's home
 page, with the Navigator's pop method:

 ```dart
 Navigator.pop(context);
 ```

 It usually isn't necessary to provide a widget that pops the Navigator
 in a route with a [Scaffold] because the Scaffold automatically adds a
 'back' button to its AppBar. Pressing the back button causes
 [Navigator.pop] to be called. On Android, pressing the system back
 button does the same thing.

 ### Using named navigator routes

 Mobile apps often manage a large number of routes and it's often
 easiest to refer to them by name. Route names, by convention,
 use a path-like structure (for example, '/a/b/c').
 The app's home page route is named '/' by default.

 The [MaterialApp] can be created
 with a [Map&lt;String, WidgetBuilder&gt;] which maps from a route's name to
 a builder function that will create it. The [MaterialApp] uses this
 map to create a value for its navigator's [onGenerateRoute] callback.

 ```dart
 void  
 ```

 To show a route by name:

 ```dart
 Navigator.pushNamed(context, '/b');
 ```

 ### Routes can return a value

 When a route is pushed to ask the user for a value, the value can be
 returned via the [pop] method's result parameter.

 Methods that push a route return a [Future]. The Future resolves when the
 route is popped and the [Future]'s value is the [pop] method's `result`
 parameter.

 For example if we wanted to ask the user to press 'OK' to confirm an
 operation we could `await` the result of [Navigator.push]:

 ```dart
 bool? value = await Navigator.push(context, MaterialPageRoute&lt;bool&gt;(
   builder: (BuildContext context) 
 ));
 ```

 If the user presses 'OK' then value will be true. If the user backs
 out of the route, for example by pressing the Scaffold's back button,
 the value will be null.

 When a route is used to return a value, the route's type parameter must
 match the type of [pop]'s result. That's why we've used
 `MaterialPageRoute&lt;bool&gt;` instead of `MaterialPageRoute&lt;void&gt;` or just
 `MaterialPageRoute`. (If you prefer to not specify the types, though, that's
 fine too.)

 ### Popup routes

 Routes don't have to obscure the entire screen. [PopupRoute]s cover the
 screen with a [ModalRoute.barrierColor] that can be only partially opaque to
 allow the current screen to show through. Popup routes are "modal" because
 they block input to the widgets below.

 There are functions which create and show popup routes. For
 example: [showDialog], [showMenu], and [showModalBottomSheet]. These
 functions return their pushed route's Future as described above.
 Callers can await the returned value to take an action when the
 route is popped, or to discover the route's value.

 There are also widgets which create popup routes, like [PopupMenuButton] and
 [DropdownButton]. These widgets create internal subclasses of PopupRoute
 and use the Navigator's push and pop methods to show and dismiss them.

 ### Custom routes

 You can create your own subclass of one of the widget library route classes
 like [PopupRoute], [ModalRoute], or [PageRoute], to control the animated
 transition employed to show the route, the color and behavior of the route's
 modal barrier, and other aspects of the route.

 The [PageRouteBuilder] class makes it possible to define a custom route
 in terms of callbacks. Here's an example that rotates and fades its child
 when the route appears or disappears. This route does not obscure the entire
 screen because it specifies `opaque: false`, just as a popup route does.

 ```dart
 Navigator.push(context, PageRouteBuilder&lt;void&gt;(
   opaque: false,
   pageBuilder: (BuildContext context, _, _) ,
   transitionsBuilder: (_, Animation&lt;double&gt; animation, _, Widget child) 
 ));
 ```

 The page route is built in two parts, the "page" and the
 "transitions". The page becomes a descendant of the child passed to
 the `transitionsBuilder` function. Typically the page is only built once,
 because it doesn't depend on its animation parameters (elided with `_`
 in this example). The transition is built on every frame
 for its duration.

 (In this example, `void` is used as the return type for the route, because
 it does not return a value.)

 ### Nesting Navigators

 An app can use more than one [Navigator]. Nesting one [Navigator] below
 another [Navigator] can be used to create an "inner journey" such as tabbed
 navigation, user registration, store checkout, or other independent journeys
 that represent a subsection of your overall application.

 #### Example

 It is standard practice for iOS apps to use tabbed navigation where each
 tab maintains its own navigation history. Therefore, each tab has its own
 [Navigator], creating a kind of "parallel navigation."

 In addition to the parallel navigation of the tabs, it is still possible to
 launch full-screen pages that completely cover the tabs. For example: an
 on-boarding flow, or an alert dialog. Therefore, there must exist a "root"
 [Navigator] that sits above the tab navigation. As a result, each of the
 tab's [Navigator]s are actually nested [Navigator]s sitting below a single
 root [Navigator].

 In practice, the nested [Navigator]s for tabbed navigation sit in the
 [WidgetsApp] and [CupertinoTabView] widgets and do not need to be explicitly
 created or managed.

 
 The following example demonstrates how a nested [Navigator] can be used to
 present a standalone user registration journey.

 Even though this example uses two [Navigator]s to demonstrate nested
 [Navigator]s, a similar result is possible using only a single [Navigator].

 Run this example with `flutter run --route=/signup` to start it with
 the signup flow instead of on the home page.

 ** See code in examples/api/lib/widgets/navigator/navigator.0.dart **
 

 [Navigator.of] operates on the nearest ancestor [Navigator] from the given
 [BuildContext]. Be sure to provide a [BuildContext] below the intended
 [Navigator], especially in large `build` methods where nested [Navigator]s
 are created. The [Builder] widget can be used to access a [BuildContext] at
 a desired location in the widget subtree.

 ### Finding the enclosing route

 In the common case of a modal route, the enclosing route can be obtained
 from inside a build method using [ModalRoute.of]. To determine if the
 enclosing route is the active route (e.g. so that controls can be dimmed
 when the route is not active), the [Route.isCurrent] property can be checked
 on the returned route.

 ## State Restoration

 If provided with a [restorationScopeId] and when surrounded by a valid
 [RestorationScope] the [Navigator] will restore its state by recreating
 the current history stack of [Route]s during state restoration and by
 restoring the internal state of those [Route]s. However, not all [Route]s
 on the stack can be restored:

  * [Page]-based routes restore their state if [Page.restorationId] is
    provided.
  * [Route]s added with the classic imperative API ([push], [pushNamed], and
    friends) can never restore their state.
  * A [Route] added with the restorable imperative API ([restorablePush],
    [restorablePushNamed], and all other imperative methods with "restorable"
    in their name) restores its state if all routes below it up to and
    including the first [Page]-based route below it are restored. If there
    is no [Page]-based route below it, it only restores its state if all
    routes below it restore theirs.

 If a [Route] is deemed restorable, the [Navigator] will set its
 [Route.restorationScopeId] to a non-null value. Routes can use that ID to
 store and restore their own state. As an example, the [ModalRoute] will
 use this ID to create a [RestorationScope] for its content widgets.

## Dependencies

- StatefulWidget

## Members

- **pages**: `List&lt;Page&lt;dynamic&gt;&gt;`
  The list of pages with which to populate the history.

 Pages are turned into routes using [Page.createRoute] in a manner
 analogous to how [Widget]s are turned into [Element]s (and [State]s or
 [RenderObject]s) using [Widget.createElement] (and
 [StatefulWidget.createState] or [RenderObjectWidget.createRenderObject]).

 When this list is updated, the new list is compared to the previous
 list and the set of routes is updated accordingly.

 Some [Route]s do not correspond to [Page] objects, namely, those that are
 added to the history using the [Navigator] API ([push] and friends). A
 [Route] that does not correspond to a [Page] object is called a pageless
 route and is tied to the [Route] that _does_ correspond to a [Page] object
 that is below it in the history.

 Pages that are added or removed may be animated as controlled by the
 [transitionDelegate]. If a page is removed that had other pageless routes
 pushed on top of it using [push] and friends, those pageless routes are
 also removed with or without animation as determined by the
 [transitionDelegate].

 To use this API, an [onPopPage] callback must also be provided to properly
 clean up this list if a page has been popped.

 If [initialRoute] is non-null when the widget is first created, then
 [onGenerateInitialRoutes] is used to generate routes that are above those
 corresponding to [pages] in the initial history.

- **onPopPage**: `PopPageCallback?`
  This is deprecated and replaced by [onDidRemovePage].

 Called when [pop] is invoked but the current [Route] corresponds to a
 [Page] found in the [pages] list.

 The `result` argument is the value with which the route is to complete
 (e.g. the value returned from a dialog).

 This callback is responsible for calling [Route.didPop] and returning
 whether this pop is successful.

 The [Navigator] widget should be rebuilt with a [pages] list that does not
 contain the [Page] for the given [Route]. The next time the [pages] list
 is updated, if the [Page] corresponding to this [Route] is still present,
 it will be interpreted as a new route to display.

- **onDidRemovePage**: `DidRemovePageCallback?`
  Called when the [Route] associated with the given [Page] has been removed
 from the Navigator.

 This can happen when the route is removed or completed through
 [Navigator.pop], [Navigator.pushReplacement], or its friends.

 This callback is responsible for removing the given page from the list of
 [pages].

 The [Navigator] widget should be rebuilt with a [pages] list that does not
 contain the given page [Page]. The next time the [pages] list
 is updated, if the given [Page] is still present, it will be interpreted
 as a new page to display.

- **transitionDelegate**: `TransitionDelegate&lt;dynamic&gt;`
  The delegate used for deciding how routes transition in or off the screen
 during the [pages] updates.

 Defaults to [DefaultTransitionDelegate].

- **initialRoute**: `String?`
  The name of the first route to show.

 Defaults to [Navigator.defaultRouteName].

 The value is interpreted according to [onGenerateInitialRoutes], which
 defaults to [defaultGenerateInitialRoutes].

 Changing the [initialRoute] will have no effect, as it only controls the
 _initial_ route. To change the route while the application is running, use
 the static functions on this class, such as [push] or [replace].

- **onGenerateRoute**: `RouteFactory?`
  Called to generate a route for a given [RouteSettings].

- **onUnknownRoute**: `RouteFactory?`
  Called when [onGenerateRoute] fails to generate a route.

 This callback is typically used for error handling. For example, this
 callback might always generate a "not found" page that describes the route
 that wasn't found.

 Unknown routes can arise either from errors in the app or from external
 requests to push routes, such as from Android intents.

- **observers**: `List&lt;NavigatorObserver&gt;`
  A list of observers for this navigator.

- **restorationScopeId**: `String?`
  Restoration ID to save and restore the state of the navigator, including
 its history.

 
 If a restoration ID is provided, the navigator will persist its internal
 state (including the route history as well as the restorable state of the
 routes) and restore it during state restoration.

 If no restoration ID is provided, the route history stack will not be
 restored and state restoration is disabled for the individual routes as
 well.

 The state is persisted in a [RestorationBucket] claimed from
 the surrounding [RestorationScope] using the provided restoration ID.
 Within that bucket, the [Navigator] also creates a new [RestorationScope]
 for its children (the [Route]s).

 See also:

  * [RestorationManager], which explains how state restoration works in
    Flutter.
  * [RestorationMixin], which contains a runnable code sample showcasing
    state restoration in Flutter.
  * [Navigator], which explains under the heading "state restoration"
    how and under what conditions the navigator restores its state.
  * [Navigator.restorablePush], which includes an example showcasing how
    to push a restorable route onto the navigator.
 

- **routeTraversalEdgeBehavior**: `TraversalEdgeBehavior`
  Controls the transfer of focus beyond the first and the last items of a
 focus scope that defines focus traversal of widgets within a route.

 
 The focus inside routes installed in the top of the app affects how
 the app behaves with respect to the platform content surrounding it.
 For example, on the web, an app is at a minimum surrounded by browser UI,
 such as the address bar, browser tabs, and more. The user should be able
 to reach browser UI using normal focus shortcuts. Similarly, if the app
 is embedded within an `<iframe>` or inside a custom element, it should
 be able to participate in the overall focus traversal, including elements
 not rendered by Flutter.
 

- **routeDirectionalTraversalEdgeBehavior**: `TraversalEdgeBehavior`
  Controls the directional transfer of focus beyond the first and the last
 items of a focus scope that defines focus traversal of widgets within a route.

 

- **defaultRouteName**: `String`
  The name for the default route of the application.

 See also:

  * [dart:ui.PlatformDispatcher.defaultRouteName], which reflects the route that the
    application was started with.

- **onGenerateInitialRoutes**: `RouteListFactory`
  Called when the widget is created to generate the initial list of [Route]
 objects if [initialRoute] is not null.

 Defaults to [defaultGenerateInitialRoutes].

 The [NavigatorState] and [initialRoute] will be passed to the callback.
 The callback must return a list of [Route] objects with which the history
 will be primed.

 When parsing the initialRoute, if there's any chance that it may
 contain complex characters, it's best to use the
 [characters](https://pub.dev/packages/characters) API. This will ensure
 that extended grapheme clusters and surrogate pairs are treated as single
 characters by the code, the same way that they appear to the user. For
 example, the string "👨‍👩‍👦" appears to the user as a single
 character and `string.characters.length` intuitively returns 1. On the
 other hand, `string.length` returns 8, and `string.runes.length` returns
 5!

- **reportsRouteUpdateToEngine**: `bool`
  Whether this navigator should report route update message back to the
 engine when the top-most route changes.

 If the property is set to true, this navigator automatically sends the
 route update message to the engine when it detects top-most route changes.
 The messages are used by the web engine to update the browser URL bar.

 If the property is set to true when the [Navigator] is first created,
 single-entry history mode is requested using
 [SystemNavigator.selectSingleEntryHistory]. This means this property
 should not be used at the same time as [PlatformRouteInformationProvider]
 is used with a [Router] (including when used with [MaterialApp.router],
 for example).

 If there are multiple navigators in the widget tree, at most one of them
 can set this property to true (typically, the top-most one created from
 the [WidgetsApp]). Otherwise, the web engine may receive multiple route
 update messages from different navigators and fail to update the URL
 bar.

 Defaults to false.

- **clipBehavior**: `Clip`
  

 In cases where clipping is not desired, consider setting this property to
 [Clip.none].

 Defaults to [Clip.hardEdge].

- **requestFocus**: `bool`
  Whether or not the navigator and it's new topmost route should request focus
 when the new route is pushed onto the navigator.

 If [Route.requestFocus] is set on the topmost route, that will take precedence
 over this value.

 Defaults to true.

## Constructors

### Unnamed Constructor
Creates a widget that maintains a stack-based history of child widgets.

 If the [pages] is not empty, the [onPopPage] must not be null.

