# Overview for `CupertinoApp`

## Description

An application that uses Cupertino design.

 A convenience widget that wraps a number of widgets that are commonly
 required for an iOS-design targeting application. It builds upon a
 [WidgetsApp] by iOS specific defaulting such as fonts and scrolling
 physics.

 The [CupertinoApp] configures the top-level [Navigator] to search for routes
 in the following order:

  1. For the `/` route, the [home] property, if non-null, is used.

  2. Otherwise, the [routes] table is used, if it has an entry for the route.

  3. Otherwise, [onGenerateRoute] is called, if provided. It should return a
     non-null value for any _valid_ route not handled by [home] and [routes].

  4. Finally if all else fails [onUnknownRoute] is called.

 If [home], [routes], [onGenerateRoute], and [onUnknownRoute] are all null,
 and [builder] is not null, then no [Navigator] is created.

 This widget also configures the observer of the top-level [Navigator] (if
 any) to perform [Hero] animations.

 The [CupertinoApp] widget isn't a required ancestor for other Cupertino
 widgets, but many Cupertino widgets could depend on the [CupertinoTheme]
 widget, which the [CupertinoApp] composes. If you use Material widgets, a
 [MaterialApp] also creates the needed dependencies for Cupertino widgets.

 
 The [CupertinoApp] automatically creates a [DefaultSelectionStyle] with
 selectionColor sets to [CupertinoThemeData.primaryColor] with 0.2 opacity
 and cursorColor sets to [CupertinoThemeData.primaryColor].
 

 Use this widget with caution on Android since it may produce behaviors
 Android users are not expecting such as:

  * Pages will be dismissible via a back swipe.
  * Scrolling past extremities will trigger iOS-style spring overscrolls.
  * The San Francisco font family is unavailable on Android and can result
    in undefined font behavior.

 
 This example shows how to create a [CupertinoApp] that disables the "debug"
 banner with a [home] route that will be displayed when the app is launched.

 ![The CupertinoApp displays a CupertinoPageScaffold](https://flutter.github.io/assets-for-api-docs/assets/cupertino/basic_cupertino_app.png)

 ```dart
 const CupertinoApp(
   home: CupertinoPageScaffold(
     navigationBar: CupertinoNavigationBar(
       middle: Text('Home'),
     ),
     child: Center(child: Icon(CupertinoIcons.share)),
   ),
   debugShowCheckedModeBanner: false,
 )
 ```
 

 
 This example shows how to create a [CupertinoApp] that uses the [routes]
 `Map` to define the "home" route and an "about" route.

 ```dart
 CupertinoApp(
   routes: <String, WidgetBuilder>,
 )
 ```
 

 
 This example shows how to create a [CupertinoApp] that defines a [theme] that
 will be used for Cupertino widgets in the app.

 ![The CupertinoApp displays a CupertinoPageScaffold with orange-colored icons](https://flutter.github.io/assets-for-api-docs/assets/cupertino/theme_cupertino_app.png)

 ```dart
 const CupertinoApp(
   theme: CupertinoThemeData(
     brightness: Brightness.dark,
     primaryColor: CupertinoColors.systemOrange,
   ),
   home: CupertinoPageScaffold(
     navigationBar: CupertinoNavigationBar(
       middle: Text('CupertinoApp Theme'),
     ),
     child: Center(child: Icon(CupertinoIcons.share)),
   ),
 )
 ```
 

 See also:

  * [CupertinoPageScaffold], which provides a standard page layout default
    with nav bars.
  * [Navigator], which is used to manage the app's stack of pages.
  * [CupertinoPageRoute], which defines an app page that transitions in an
    iOS-specific way.
  * [WidgetsApp], which defines the basic app elements but does not depend
    on the Cupertino library.

## Dependencies

- StatefulWidget

## Members

- **navigatorKey**: `GlobalKey&lt;NavigatorState&gt;?`
  

- **home**: `Widget?`
  

- **theme**: `CupertinoThemeData?`
  The top-level [CupertinoTheme] styling.

 A null [theme] or unspecified [theme] attributes will default to iOS
 system values.

- **routes**: `Map&lt;String, WidgetBuilder&gt;?`
  The application's top-level routing table.

 When a named route is pushed with [Navigator.pushNamed], the route name is
 looked up in this map. If the name is present, the associated
 [WidgetBuilder] is used to construct a [CupertinoPageRoute] that
 performs an appropriate transition, including [Hero] animations, to the
 new route.

 

- **initialRoute**: `String?`
  

- **onGenerateRoute**: `RouteFactory?`
  

- **onGenerateInitialRoutes**: `InitialRouteListFactory?`
  

- **onUnknownRoute**: `RouteFactory?`
  

- **onNavigationNotification**: `NotificationListenerCallback&lt;NavigationNotification&gt;?`
  

- **navigatorObservers**: `List&lt;NavigatorObserver&gt;?`
  

- **routeInformationProvider**: `RouteInformationProvider?`
  

- **routeInformationParser**: `RouteInformationParser&lt;Object&gt;?`
  

- **routerDelegate**: `RouterDelegate&lt;Object&gt;?`
  

- **backButtonDispatcher**: `BackButtonDispatcher?`
  

- **routerConfig**: `RouterConfig&lt;Object&gt;?`
  

- **builder**: `TransitionBuilder?`
  

- **title**: `String?`
  

 This value is passed unmodified to [WidgetsApp.title].

- **onGenerateTitle**: `GenerateAppTitle?`
  

 This value is passed unmodified to [WidgetsApp.onGenerateTitle].

- **color**: `Color?`
  

- **locale**: `Locale?`
  

- **localizationsDelegates**: `Iterable&lt;LocalizationsDelegate&lt;dynamic&gt;&gt;?`
  

- **localeListResolutionCallback**: `LocaleListResolutionCallback?`
  

 This callback is passed along to the [WidgetsApp] built by this widget.

- **localeResolutionCallback**: `LocaleResolutionCallback?`
  

 This callback is passed along to the [WidgetsApp] built by this widget.

- **supportedLocales**: `Iterable&lt;Locale&gt;`
  

 It is passed along unmodified to the [WidgetsApp] built by this widget.

- **showPerformanceOverlay**: `bool`
  Turns on a performance overlay.

 See also:

  * <https://flutter.dev/to/performance-overlay>

- **checkerboardRasterCacheImages**: `bool`
  Turns on checkerboarding of raster cache images.

- **checkerboardOffscreenLayers**: `bool`
  Turns on checkerboarding of layers rendered to offscreen bitmaps.

- **showSemanticsDebugger**: `bool`
  Turns on an overlay that shows the accessibility information
 reported by the framework.

- **debugShowCheckedModeBanner**: `bool`
  

- **shortcuts**: `Map&lt;ShortcutActivator, Intent&gt;?`
  
 
 This example shows how to add a single shortcut for
 [LogicalKeyboardKey.select] to the default shortcuts without needing to
 add your own [Shortcuts] widget.

 Alternatively, you could insert a [Shortcuts] widget with just the mapping
 you want to add between the [WidgetsApp] and its child and get the same
 effect.

 ```dart
 Widget build(BuildContext context) 
 ```
 
 

- **actions**: `Map&lt;Type, Action&lt;Intent&gt;&gt;?`
  
 
 This example shows how to add a single action handling an
 [ActivateAction] to the default actions without needing to
 add your own [Actions] widget.

 Alternatively, you could insert a [Actions] widget with just the mapping
 you want to add between the [WidgetsApp] and its child and get the same
 effect.

 ```dart
 Widget build(BuildContext context) 
 ```
 
 

- **restorationScopeId**: `String?`
  

- **scrollBehavior**: `ScrollBehavior?`
  

 When null, defaults to [CupertinoScrollBehavior].

 See also:

  * [ScrollConfiguration], which controls how [Scrollable] widgets behave
    in a subtree.

- **useInheritedMediaQuery**: `bool`
  

## Constructors

### Unnamed Constructor
Creates a CupertinoApp.

 At least one of [home], [routes], [onGenerateRoute], or [builder] must be
 non-null. If only [routes] is given, it must include an entry for the
 [Navigator.defaultRouteName] (`/`), since that is the route used when the
 application is launched with an intent that specifies an otherwise
 unsupported route.

 This class creates an instance of [WidgetsApp].

### router
Creates a [CupertinoApp] that uses the [Router] instead of a [Navigator].

 

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
