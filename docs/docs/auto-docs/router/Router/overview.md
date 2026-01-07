# Overview for `Router`

## Description

The dispatcher for opening and closing pages of an application.

 This widget listens for routing information from the operating system (e.g.
 an initial route provided on app startup, a new route obtained when an
 intent is received, or a notification that the user hit the system back
 button), parses route information into data of type `T`, and then converts
 that data into [Page] objects that it passes to a [Navigator].

 Each part of this process can be overridden and configured as desired.

 The [routeInformationProvider] can be overridden to change how the name of
 the route is obtained. The [RouteInformationProvider.value] is used as the
 initial route when the [Router] is first created. Subsequent notifications
 from the [RouteInformationProvider] to its listeners are treated as
 notifications that the route information has changed.

 The [backButtonDispatcher] can be overridden to change how back button
 notifications are received. This must be a [BackButtonDispatcher], which is
 an object where callbacks can be registered, and which can be chained so
 that back button presses are delegated to subsidiary routers. The callbacks
 are invoked to indicate that the user is trying to close the current route
 (by pressing the system back button); the [Router] ensures that when this
 callback is invoked, the message is passed to the [routerDelegate] and its
 result is provided back to the [backButtonDispatcher]. Some platforms don't
 have back buttons (e.g. iOS and desktop platforms); on those platforms this
 notification is never sent. Typically, the [backButtonDispatcher] for the
 root router is an instance of [RootBackButtonDispatcher], which uses a
 [WidgetsBindingObserver] to listen to the `popRoute` notifications from
 [SystemChannels.navigation]. Nested [Router]s typically use a
 [ChildBackButtonDispatcher], which must be provided the
 [BackButtonDispatcher] of its ancestor [Router] (available via [Router.of]).

 The [routeInformationParser] can be overridden to change how names obtained
 from the [routeInformationProvider] are interpreted. It must implement the
 [RouteInformationParser] interface, specialized with the same type as the
 [Router] itself. This type, `T`, represents the data type that the
 [routeInformationParser] will generate.

 The [routerDelegate] can be overridden to change how the output of the
 [routeInformationParser] is interpreted. It must implement the
 [RouterDelegate] interface, also specialized with `T`; it takes as input
 the data (of type `T`) from the [routeInformationParser], and is responsible
 for providing a navigating widget to insert into the widget tree. The
 [RouterDelegate] interface is also [Listenable]; notifications are taken
 to mean that the [Router] needs to rebuild.

 ## Concerns regarding asynchrony

 Some of the APIs (notably those involving [RouteInformationParser] and
 [RouterDelegate]) are asynchronous.

 When developing objects implementing these APIs, if the work can be done
 entirely synchronously, then consider using [SynchronousFuture] for the
 future returned from the relevant methods. This will allow the [Router] to
 proceed in a completely synchronous way, which removes a number of
 complications.

 Using asynchronous computation is entirely reasonable, however, and the API
 is designed to support it. For example, maybe a set of images need to be
 loaded before a route can be shown; waiting for those images to be loaded
 before [RouterDelegate.setNewRoutePath] returns is a reasonable approach to
 handle this case.

 If an asynchronous operation is ongoing when a new one is to be started, the
 precise behavior will depend on the exact circumstances, as follows:

 If the active operation is a [routeInformationParser] parsing a new route information:
 that operation's result, if it ever completes, will be discarded.

 If the active operation is a [routerDelegate] handling a pop request:
 the previous pop is immediately completed with "false", claiming that the
 previous pop was not handled (this may cause the application to close).

 If the active operation is a [routerDelegate] handling an initial route
 or a pushed route, the result depends on the new operation. If the new
 operation is a pop request, then the original operation's result, if it ever
 completes, will be discarded. If the new operation is a push request,
 however, the [routeInformationParser] will be requested to start the parsing, and
 only if that finishes before the original [routerDelegate] request
 completes will that original request's result be discarded.

 If the identity of the [Router] widget's delegates change while an
 asynchronous operation is in progress, to keep matters simple, all active
 asynchronous operations will have their results discarded. It is generally
 considered unusual for these delegates to change during the lifetime of the
 [Router].

 If the [Router] itself is disposed while an asynchronous operation is in
 progress, all active asynchronous operations will have their results
 discarded also.

 No explicit signals are provided to the [routeInformationParser] or
 [routerDelegate] to indicate when any of the above happens, so it is
 strongly recommended that [RouteInformationParser] and [RouterDelegate]
 implementations not perform extensive computation.

 ## Application architectural design

 An application can have zero, one, or many [Router] widgets, depending on
 its needs.

 An application might have no [Router] widgets if it has only one "screen",
 or if the facilities provided by [Navigator] are sufficient. This is common
 for desktop applications, where subsidiary "screens" are represented using
 different windows rather than changing the active interface.

 A particularly elaborate application might have multiple [Router] widgets,
 in a tree configuration, with the first handling the entire route parsing
 and making the result available for routers in the subtree. The routers in
 the subtree do not participate in route information parsing but merely take the
 result from the first router to build their sub routes.

 Most applications only need a single [Router].

 ## URL updates for web applications

 In the web platform, keeping the URL in the browser's location bar up to
 date with the application state ensures that the browser constructs its
 history entry correctly, allowing its back and forward buttons to function
 as the user expects.

 If an app state change leads to the [Router] rebuilding, the [Router] will
 retrieve the new route information from the [routerDelegate]'s
 [RouterDelegate.currentConfiguration] method and the
 [routeInformationParser]'s [RouteInformationParser.restoreRouteInformation]
 method.

 If the location in the new route information is different from the
 current location, this is considered to be a navigation event, the
 [PlatformRouteInformationProvider.routerReportsNewRouteInformation] method
 calls [SystemNavigator.routeInformationUpdated] with `replace = false` to
 notify the engine, and through that the browser, to create a history entry
 with the new url. Otherwise,
 [PlatformRouteInformationProvider.routerReportsNewRouteInformation] calls
 [SystemNavigator.routeInformationUpdated] with `replace = true` to update
 the current history entry with the latest [RouteInformation].

 One can force the [Router] to report new route information as navigation
 event to the [routeInformationProvider] (and thus the browser) even if the
 [RouteInformation.uri] has not changed by calling the [Router.navigate]
 method with a callback that performs the state change. This causes [Router]
 to call the [RouteInformationProvider.routerReportsNewRouteInformation] with
 [RouteInformationReportingType.navigate], and thus causes
 [PlatformRouteInformationProvider] to push a new history entry regardlessly.
 This allows one to support the browser's back and forward buttons without
 changing the URL. For example, the scroll position of a scroll view may be
 saved in the [RouteInformation.state]. Using [Router.navigate] to update the
 scroll position causes the browser to create a new history entry with the
 [RouteInformation.state] that stores this new scroll position. When the user
 clicks the back button, the app will go back to the previous scroll position
 without changing the URL in the location bar.

 One can also force the [Router] to ignore a navigation event by making
 those changes during a callback passed to [Router.neglect]. The [Router]
 calls the [RouteInformationProvider.routerReportsNewRouteInformation] with
 [RouteInformationReportingType.neglect], and thus causes
 [PlatformRouteInformationProvider] to replace the current history entry
 regardlessly even if it detects location change.

 To opt out of URL updates entirely, pass null for [routeInformationProvider]
 and [routeInformationParser]. This is not recommended in general, but may be
 appropriate in the following cases:

 * The application does not target the web platform.

 * There are multiple router widgets in the application. Only one [Router]
   widget should update the URL (typically the top-most one created by the
   [WidgetsApp.router], [MaterialApp.router], or [CupertinoApp.router]).

 * The application does not need to implement in-app navigation using the
   browser's back and forward buttons.

 In other cases, it is strongly recommended to implement the
 [RouterDelegate.currentConfiguration] and
 [RouteInformationParser.restoreRouteInformation] APIs to provide an optimal
 user experience when running on the web platform.

 ## State Restoration

 The [Router] will restore the current configuration of the [routerDelegate]
 during state restoration if it is configured with a [restorationScopeId] and
 state restoration is enabled for the subtree. For that, the value of
 [RouterDelegate.currentConfiguration] is serialized and persisted before the
 app is killed by the operating system. After the app is restarted, the value
 is deserialized and passed back to the [RouterDelegate] via a call to
 [RouterDelegate.setRestoredRoutePath] (which by default just calls
 [RouterDelegate.setNewRoutePath]). It is the responsibility of the
 [RouterDelegate] to use the configuration information provided to restore
 its internal state.

 To serialize [RouterDelegate.currentConfiguration] and to deserialize it
 again, the [Router] calls [RouteInformationParser.restoreRouteInformation]
 and [RouteInformationParser.parseRouteInformation], respectively. Therefore,
 if a [restorationScopeId] is provided, a [routeInformationParser] must be
 configured as well.

## Dependencies

- StatefulWidget

## Members

- **routeInformationProvider**: `RouteInformationProvider?`
  The route information provider for the router.

 The value at the time of first build will be used as the initial route.
 The [Router] listens to this provider and rebuilds with new names when
 it notifies.

 This can be null if this router does not rely on the route information
 to build its content. In such case, the [routeInformationParser] must also
 be null.

- **routeInformationParser**: `RouteInformationParser&lt;T&gt;?`
  The route information parser for the router.

 When the [Router] gets a new route information from the [routeInformationProvider],
 the [Router] uses this delegate to parse the route information and produce a
 configuration. The configuration will be used by [routerDelegate] and
 eventually rebuilds the [Router] widget.

 Since this delegate is the primary consumer of the [routeInformationProvider],
 it must not be null if [routeInformationProvider] is not null.

- **routerDelegate**: `RouterDelegate&lt;T&gt;`
  The router delegate for the router.

 This delegate consumes the configuration from [routeInformationParser] and
 builds a navigating widget for the [Router].

 It is also the primary respondent for the [backButtonDispatcher]. The
 [Router] relies on [RouterDelegate.popRoute] to handle the back
 button.

 If the [RouterDelegate.currentConfiguration] returns a non-null object,
 this [Router] will opt for URL updates.

- **backButtonDispatcher**: `BackButtonDispatcher?`
  The back button dispatcher for the router.

 The two common alternatives are the [RootBackButtonDispatcher] for root
 router, or the [ChildBackButtonDispatcher] for other routers.

- **restorationScopeId**: `String?`
  Restoration ID to save and restore the state of the [Router].

 If non-null, the [Router] will persist the [RouterDelegate]'s current
 configuration (i.e. [RouterDelegate.currentConfiguration]). During state
 restoration, the [Router] informs the [RouterDelegate] of the previous
 configuration by calling [RouterDelegate.setRestoredRoutePath] (which by
 default just calls [RouterDelegate.setNewRoutePath]). It is the
 responsibility of the [RouterDelegate] to restore its internal state based
 on the provided configuration.

 The router uses the [RouteInformationParser] to serialize and deserialize
 [RouterDelegate.currentConfiguration]. Therefore, a
 [routeInformationParser] must be provided when [restorationScopeId] is
 non-null.

 See also:

  * [RestorationManager], which explains how state restoration works in
    Flutter.

## Constructors

### Unnamed Constructor
Creates a router.

 The [routeInformationProvider] and [routeInformationParser] can be null if this
 router does not depend on route information. A common example is a sub router
 that builds its content completely based on the app state.

 The [routeInformationProvider] and [routeInformationParser] must
 both be provided or not provided.

### withConfig
Creates a router with a [RouterConfig].

 The [RouterConfig.routeInformationProvider] and
 [RouterConfig.routeInformationParser] can be null if this router does not
 depend on route information. A common example is a sub router that builds
 its content completely based on the app state.

 If the [RouterConfig.routeInformationProvider] is not null, then
 [RouterConfig.routeInformationParser] must also not be
 null.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
