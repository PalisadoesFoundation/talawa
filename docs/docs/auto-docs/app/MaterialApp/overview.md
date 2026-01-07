# Overview for `MaterialApp`

## Description

An application that uses Material Design.

 A convenience widget that wraps a number of widgets that are commonly
 required for Material Design applications. It builds upon a [WidgetsApp] by
 adding material-design specific functionality, such as [AnimatedTheme] and
 [GridPaper].

 [MaterialApp] configures its [WidgetsApp.textStyle] with an ugly red/yellow
 text style that's intended to warn the developer that their app hasn't defined
 a default text style. Typically the app's [Scaffold] builds a [Material] widget
 whose default [Material.textStyle] defines the text style for the entire scaffold.

 The [MaterialApp] configures the top-level [Navigator] to search for routes
 in the following order:

  1. For the `/` route, the [home] property, if non-null, is used.

  2. Otherwise, the [routes] table is used, if it has an entry for the route.

  3. Otherwise, [onGenerateRoute] is called, if provided. It should return a
     non-null value for any _valid_ route not handled by [home] and [routes].

  4. Finally if all else fails [onUnknownRoute] is called.

 If a [Navigator] is created, at least one of these options must handle the
 `/` route, since it is used when an invalid [initialRoute] is specified on
 startup (e.g. by another application launching this one with an intent on
 Android; see [dart:ui.PlatformDispatcher.defaultRouteName]).

 This widget also configures the observer of the top-level [Navigator] (if
 any) to perform [Hero] animations.

 
 The [MaterialApp] automatically creates a [DefaultSelectionStyle]. It uses
 the colors in the [ThemeData.textSelectionTheme] if they are not null;
 otherwise, the [MaterialApp] sets [DefaultSelectionStyle.selectionColor] to
 [ColorScheme.primary] with 0.4 opacity and
 [DefaultSelectionStyle.cursorColor] to [ColorScheme.primary].
 

 If [home], [routes], [onGenerateRoute], and [onUnknownRoute] are all null,
 and [builder] is not null, then no [Navigator] is created.

 
 This example shows how to create a [MaterialApp] that disables the "debug"
 banner with a [home] route that will be displayed when the app is launched.

 ![The MaterialApp displays a Scaffold ](https://flutter.github.io/assets-for-api-docs/assets/material/basic_material_app.png)

 ```dart
 MaterialApp(
   home: Scaffold(
     appBar: AppBar(
       title: const Text('Home'),
     ),
   ),
   debugShowCheckedModeBanner: false,
 )
 ```
 

 
 This example shows how to create a [MaterialApp] that uses the [routes]
 `Map` to define the "home" route and an "about" route.

 ```dart
 MaterialApp(
   routes: <String, WidgetBuilder>,
 )
 ```
 

 
 This example shows how to create a [MaterialApp] that defines a [theme] that
 will be used for material widgets in the app.

 ![The MaterialApp displays a Scaffold with a dark background and a blue / grey AppBar at the top](https://flutter.github.io/assets-for-api-docs/assets/material/theme_material_app.png)

 ```dart
 MaterialApp(
   theme: ThemeData(
     brightness: Brightness.dark,
     primaryColor: Colors.blueGrey
   ),
   home: Scaffold(
     appBar: AppBar(
       title: const Text('MaterialApp Theme'),
     ),
   ),
 )
 ```
 

 ## Troubleshooting

 ### Why is my app's text red with yellow underlines?

 [Text] widgets that lack a [Material] ancestor will be rendered with an ugly
 red/yellow text style.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/material_app_unspecified_textstyle.png)

 The typical fix is to give the widget a [Scaffold] ancestor. The [Scaffold] creates
 a [Material] widget that defines its default text style.

 ```dart
 const MaterialApp(
   title: 'Material App',
   home: Scaffold(
     body: Center(
       child: Text('Hello World'),
     ),
   ),
 )
 ```

 See also:

  * [Scaffold], which provides standard app elements like an [AppBar] and a [Drawer].
  * [Navigator], which is used to manage the app's stack of pages.
  * [MaterialPageRoute], which defines an app page that transitions in a material-specific way.
  * [WidgetsApp], which defines the basic app elements but does not depend on the material library.
  * The Flutter Internationalization Tutorial,
    <https://flutter.dev/to/internationalization/>.

## Dependencies

- StatefulWidget

## Members

- **navigatorKey**: `GlobalKey&lt;NavigatorState&gt;?`
  

- **scaffoldMessengerKey**: `GlobalKey&lt;ScaffoldMessengerState&gt;?`
  A key to use when building the [ScaffoldMessenger].

 If a [scaffoldMessengerKey] is specified, the [ScaffoldMessenger] can be
 directly manipulated without first obtaining it from a [BuildContext] via
 [ScaffoldMessenger.of]: from the [scaffoldMessengerKey], use the
 [GlobalKey.currentState] getter.

- **home**: `Widget?`
  

- **routes**: `Map&lt;String, WidgetBuilder&gt;?`
  The application's top-level routing table.

 When a named route is pushed with [Navigator.pushNamed], the route name is
 looked up in this map. If the name is present, the associated
 [WidgetBuilder] is used to construct a [MaterialPageRoute] that
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
  

 Material specific features such as [showDialog] and [showMenu], and widgets
 such as [Tooltip], [PopupMenuButton], also require a [Navigator] to properly
 function.

- **title**: `String?`
  

 This value is passed unmodified to [WidgetsApp.title].

- **onGenerateTitle**: `GenerateAppTitle?`
  

 This value is passed unmodified to [WidgetsApp.onGenerateTitle].

- **theme**: `ThemeData?`
  Default visual properties, like colors fonts and shapes, for this app's
 material widgets.

 A second [darkTheme] [ThemeData] value, which is used to provide a dark
 version of the user interface can also be specified. [themeMode] will
 control which theme will be used if a [darkTheme] is provided.

 The default value of this property is the value of [ThemeData.].

 See also:

  * [themeMode], which controls which theme to use.
  * [MediaQueryData.platformBrightness], which indicates the platform's
    desired brightness and is used to automatically toggle between [theme]
    and [darkTheme] in [MaterialApp].
  * [ThemeData.brightness], which indicates the [Brightness] of a theme's
    colors.

- **darkTheme**: `ThemeData?`
  The [ThemeData] to use when a 'dark mode' is requested by the system.

 Some host platforms allow the users to select a system-wide 'dark mode',
 or the application may want to offer the user the ability to choose a
 dark theme just for this application. This is theme that will be used for
 such cases. [themeMode] will control which theme will be used.

 This theme should have a [ThemeData.brightness] set to [Brightness.dark].

 Uses [theme] instead when null. Defaults to the value of
 [ThemeData.] when both [darkTheme] and [theme] are null.

 See also:

  * [themeMode], which controls which theme to use.
  * [MediaQueryData.platformBrightness], which indicates the platform's
    desired brightness and is used to automatically toggle between [theme]
    and [darkTheme] in [MaterialApp].
  * [ThemeData.brightness], which is typically set to the value of
    [MediaQueryData.platformBrightness].

- **highContrastTheme**: `ThemeData?`
  The [ThemeData] to use when 'high contrast' is requested by the system.

 Some host platforms (for example, iOS) allow the users to increase
 contrast through an accessibility setting.

 Uses [theme] instead when null.

 See also:

  * [MediaQueryData.highContrast], which indicates the platform's
    desire to increase contrast.

- **highContrastDarkTheme**: `ThemeData?`
  The [ThemeData] to use when a 'dark mode' and 'high contrast' is requested
 by the system.

 Some host platforms (for example, iOS) allow the users to increase
 contrast through an accessibility setting.

 This theme should have a [ThemeData.brightness] set to [Brightness.dark].

 Uses [darkTheme] instead when null.

 See also:

  * [MediaQueryData.highContrast], which indicates the platform's
    desire to increase contrast.

- **themeMode**: `ThemeMode?`
  Determines which theme will be used by the application if both [theme]
 and [darkTheme] are provided.

 If set to [ThemeMode.system], the choice of which theme to use will
 be based on the user's system preferences. If the [MediaQuery.platformBrightnessOf]
 is [Brightness.light], [theme] will be used. If it is [Brightness.dark],
 [darkTheme] will be used (unless it is null, in which case [theme]
 will be used.

 If set to [ThemeMode.light] the [theme] will always be used,
 regardless of the user's system preference.

 If set to [ThemeMode.dark] the [darkTheme] will be used
 regardless of the user's system preference. If [darkTheme] is null
 then it will fallback to using [theme].

 The default value is [ThemeMode.system].

 See also:

  * [theme], which is used when a light mode is selected.
  * [darkTheme], which is used when a dark mode is selected.
  * [ThemeData.brightness], which indicates to various parts of the
    system what kind of theme is being used.

- **themeAnimationDuration**: `Duration`
  The duration of animated theme changes.

 When the theme changes (either by the [theme], [darkTheme] or [themeMode]
 parameters changing) it is animated to the new theme over time.
 The [themeAnimationDuration] determines how long this animation takes.

 To have the theme change immediately, you can set this to [Duration.zero].

 The default is [kThemeAnimationDuration].

 See also:
   [themeAnimationCurve], which defines the curve used for the animation.

- **themeAnimationCurve**: `Curve`
  The curve to apply when animating theme changes.

 The default is [Curves.linear].

 This is ignored if [themeAnimationDuration] is [Duration.zero].

 See also:
   [themeAnimationDuration], which defines how long the animation is.

- **color**: `Color?`
  

- **locale**: `Locale?`
  

- **localizationsDelegates**: `Iterable&lt;LocalizationsDelegate&lt;dynamic&gt;&gt;?`
  

 Internationalized apps that require translations for one of the locales
 listed in [GlobalMaterialLocalizations] should specify this parameter
 and list the [supportedLocales] that the application can handle.

 ```dart
 // The GlobalMaterialLocalizations and GlobalWidgetsLocalizations
 // classes require the following import:
 // import 'package:flutter_localizations/flutter_localizations.dart';

 const MaterialApp(
   localizationsDelegates: <LocalizationsDelegate&lt;Object>&gt;[
     // ... app-specific localization delegate(s) here
     GlobalMaterialLocalizations.delegate,
     GlobalWidgetsLocalizations.delegate,
   ],
   supportedLocales: <Locale>[
     Locale('en', 'US'), // English
     Locale('he', 'IL'), // Hebrew
     // ... other locales the app supports
   ],
   // ...
 )
 ```

 ## Adding localizations for a new locale

 The information that follows applies to the unusual case of an app
 adding translations for a language not already supported by
 [GlobalMaterialLocalizations].

 Delegates that produce [WidgetsLocalizations] and [MaterialLocalizations]
 are included automatically. Apps can provide their own versions of these
 localizations by creating implementations of
 [LocalizationsDelegate&lt;WidgetsLocalizations&gt;] or
 [LocalizationsDelegate&lt;MaterialLocalizations&gt;] whose load methods return
 custom versions of [WidgetsLocalizations] or [MaterialLocalizations].

 For example: to add support to [MaterialLocalizations] for a locale it
 doesn't already support, say `const Locale('foo', 'BR')`, one first
 creates a subclass of [MaterialLocalizations] that provides the
 translations:

 ```dart
 class FooLocalizations extends MaterialLocalizations 
 ```

 One must then create a [LocalizationsDelegate] subclass that can provide
 an instance of the [MaterialLocalizations] subclass. In this case, this is
 essentially just a method that constructs a `FooLocalizations` object. A
 [SynchronousFuture] is used here because no asynchronous work takes place
 upon "loading" the localizations object.

 ```dart
 // continuing from previous example...
 class FooLocalizationsDelegate extends LocalizationsDelegate&lt;MaterialLocalizations&gt; 
 ```

 Constructing a [MaterialApp] with a `FooLocalizationsDelegate` overrides
 the automatically included delegate for [MaterialLocalizations] because
 only the first delegate of each [LocalizationsDelegate.type] is used and
 the automatically included delegates are added to the end of the app's
 [localizationsDelegates] list.

 ```dart
 // continuing from previous example...
 const MaterialApp(
   localizationsDelegates: <LocalizationsDelegate&lt;Object>&gt;[
     ,
   ],
   // ...
 )
 ```
 See also:

  * [supportedLocales], which must be specified along with
    [localizationsDelegates].
  * [GlobalMaterialLocalizations], a [localizationsDelegates] value
    which provides material localizations for many languages.
  * The Flutter Internationalization Tutorial,
    <https://flutter.dev/to/internationalization/>.

- **localeListResolutionCallback**: `LocaleListResolutionCallback?`
  

 This callback is passed along to the [WidgetsApp] built by this widget.

- **localeResolutionCallback**: `LocaleResolutionCallback?`
  

 This callback is passed along to the [WidgetsApp] built by this widget.

- **supportedLocales**: `Iterable&lt;Locale&gt;`
  

 It is passed along unmodified to the [WidgetsApp] built by this widget.

 See also:

  * [localizationsDelegates], which must be specified for localized
    applications.
  * [GlobalMaterialLocalizations], a [localizationsDelegates] value
    which provides material localizations for many languages.
  * The Flutter Internationalization Tutorial,
    <https://flutter.dev/to/internationalization/>.

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
  
 The default [ScrollBehavior] for the application.

 [ScrollBehavior]s describe how [Scrollable] widgets behave. Providing
 a [ScrollBehavior] can set the default [ScrollPhysics] across
 an application, and manage [Scrollable] decorations like [Scrollbar]s and
 [GlowingOverscrollIndicator]s.
 

 When null, defaults to [MaterialScrollBehavior].

 See also:

  * [ScrollConfiguration], which controls how [Scrollable] widgets behave
    in a subtree.

- **debugShowMaterialGrid**: `bool`
  Turns on a [GridPaper] overlay that paints a baseline grid
 Material apps.

 Only available in debug mode.

 See also:

  * <https://material.io/design/layout/spacing-methods.html>

- **useInheritedMediaQuery**: `bool`
  

- **themeAnimationStyle**: `AnimationStyle?`
  Used to override the theme animation curve and duration.

 If [AnimationStyle.duration] is provided, it will be used to override
 the theme animation duration in the underlying [AnimatedTheme] widget.
 If it is null, then [themeAnimationDuration] will be used. Otherwise,
 defaults to 200ms.

 If [AnimationStyle.curve] is provided, it will be used to override
 the theme animation curve in the underlying [AnimatedTheme] widget.
 If it is null, then [themeAnimationCurve] will be used. Otherwise,
 defaults to [Curves.linear].

 To disable the theme animation, use [AnimationStyle.noAnimation].

 
 This sample showcases how to override the theme animation curve and
 duration in the [MaterialApp] widget using [AnimationStyle].

 ** See code in examples/api/lib/material/app/app.0.dart **
 

## Constructors

### Unnamed Constructor
Creates a MaterialApp.

 At least one of [home], [routes], [onGenerateRoute], or [builder] must be
 non-null. If only [routes] is given, it must include an entry for the
 [Navigator.defaultRouteName] (`/`), since that is the route used when the
 application is launched with an intent that specifies an otherwise
 unsupported route.

 This class creates an instance of [WidgetsApp].

### router
Creates a [MaterialApp] that uses the [Router] instead of a [Navigator].

 

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
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
