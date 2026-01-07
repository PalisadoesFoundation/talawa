# Overview for `AppBar`

## Description

A Material Design app bar.

 An app bar consists of a toolbar and potentially other widgets, such as a
 [TabBar] and a [FlexibleSpaceBar]. App bars typically expose one or more
 common [actions] with [IconButton]s which are optionally followed by a
 [PopupMenuButton] for less common operations (sometimes called the "overflow
 menu").

 App bars are typically used in the [Scaffold.appBar] property, which places
 the app bar as a fixed-height widget at the top of the screen. For a scrollable
 app bar, see [SliverAppBar], which embeds an [AppBar] in a sliver for use in
 a [CustomScrollView].

 The AppBar displays the toolbar widgets, [leading], [title], and [actions],
 above the [bottom] (if any). The [bottom] is usually used for a [TabBar]. If
 a [flexibleSpace] widget is specified then it is stacked behind the toolbar
 and the bottom widget. The following diagram shows where each of these slots
 appears in the toolbar when the writing language is left-to-right (e.g.
 English):

 ![The leading widget is in the top left, the actions are in the top right,
 the title is between them. The bottom is, naturally, at the bottom, and the
 flexibleSpace is behind all of them.](https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.png)

 If the [leading] widget is omitted, but the [AppBar] is in a [Scaffold] with
 a [Drawer], then a button will be inserted to open the drawer. Otherwise, if
 the nearest [Navigator] has any previous routes, a [BackButton] is inserted
 instead. This behavior can be turned off by setting the [automaticallyImplyLeading]
 to false. In that case a null leading widget will result in the middle/title widget
 stretching to start.

 The [AppBar] insets its content based on the ambient [MediaQuery]'s padding,
 to avoid system UI intrusions. It's taken care of by [Scaffold] when used in
 the [Scaffold.appBar] property. When animating an [AppBar], unexpected
 [MediaQuery] changes (as is common in [Hero] animations) may cause the content
 to suddenly jump. Wrap the [AppBar] in a [MediaQuery] widget, and adjust its
 padding such that the animation is smooth.

 
 This sample shows an [AppBar] with two simple actions. The first action
 opens a [SnackBar], while the second action navigates to a new page.

 ** See code in examples/api/lib/material/app_bar/app_bar.0.dart **
 

 Material Design 3 introduced new types of app bar.
 
 This sample shows the creation of an [AppBar] widget with the [shadowColor] and
 [scrolledUnderElevation] properties set, as described in:
 https://m3.material.io/components/top-app-bar/overview

 ** See code in examples/api/lib/material/app_bar/app_bar.1.dart **
 

 ## Troubleshooting

 ### Why don't my TextButton actions appear?

 If the app bar's [actions] contains [TextButton]s, they will not
 be visible if their foreground (text) color is the same as the
 app bar's background color.

 In Material v2 (i.e., when [ThemeData.useMaterial3] is false),
 the default app bar [backgroundColor] is the overall theme's
 [ColorScheme.primary] if the overall theme's brightness is
 [Brightness.light]. Unfortunately this is the same as the default
 [ButtonStyle.foregroundColor] for [TextButton] for light themes.
 In this case a preferable text button foreground color is
 [ColorScheme.onPrimary], a color that contrasts nicely with
 [ColorScheme.primary]. To remedy the problem, override
 [TextButton.style]:

 
 This sample shows an [AppBar] with two action buttons with their primary
 color set to [ColorScheme.onPrimary].

 ** See code in examples/api/lib/material/app_bar/app_bar.2.dart **
 

 
 This example shows how to listen to a nested Scrollable's scroll notification
 in a nested scroll view using the [notificationPredicate] property and use it
 to make [scrolledUnderElevation] take effect.

 ** See code in examples/api/lib/material/app_bar/app_bar.3.dart **
 

 See also:

  * [Scaffold], which displays the [AppBar] in its [Scaffold.appBar] slot.
  * [SliverAppBar], which uses [AppBar] to provide a flexible app bar that
    can be used in a [CustomScrollView].
  * [TabBar], which is typically placed in the [bottom] slot of the [AppBar]
    if the screen has multiple pages arranged in tabs.
  * [IconButton], which is used with [actions] to show buttons on the app bar.
  * [PopupMenuButton], to show a popup menu on the app bar, via [actions].
  * [FlexibleSpaceBar], which is used with [flexibleSpace] when the app bar
    can expand and collapse.
  * <https://material.io/design/components/app-bars-top.html>
  * <https://m3.material.io/components/top-app-bar>
  * Cookbook: [Place a floating app bar above a list](https://docs.flutter.dev/cookbook/lists/floating-app-bar)

## Dependencies

- StatefulWidget, PreferredSizeWidget

## Members

- **leading**: `Widget?`
  
 A widget to display before the toolbar's [title].

 Typically the [leading] widget is an [Icon] or an [IconButton].

 Becomes the leading component of the [NavigationToolbar] built
 by this widget. The [leading] widget's width and height are constrained to
 be no bigger than [leadingWidth] and [toolbarHeight] respectively.

 If this is null and [automaticallyImplyLeading] is set to true, the
 [AppBar] will imply an appropriate widget. For example, if the [AppBar] is
 in a [Scaffold] that also has a [Drawer], the [Scaffold] will fill this
 widget with an [IconButton] that opens the drawer (using [Icons.menu]). If
 there's no [Drawer] and the parent [Navigator] can go back, the [AppBar]
 will use a [BackButton] that calls [Navigator.maybePop].
 

 

 The following code shows how the drawer button could be manually specified
 instead of relying on [automaticallyImplyLeading]:

 ```dart
 AppBar(
   leading: Builder(
     builder: (BuildContext context) ,
   ),
 )
 ```
 

 The [Builder] is used in this example to ensure that the `context` refers
 to that part of the subtree. That way this code snippet can be used even
 inside the very code that is creating the [Scaffold] (in which case,
 without the [Builder], the `context` wouldn't be able to see the
 [Scaffold], since it would refer to an ancestor of that widget).

 See also:

  * [Scaffold.appBar], in which an [AppBar] is usually placed.
  * [Scaffold.drawer], in which the [Drawer] is usually placed.

- **automaticallyImplyLeading**: `bool`
  
 Controls whether we should try to imply the leading widget if null.

 If true and [AppBar.leading] is null, automatically try to deduce what the leading
 widget should be. If false and [AppBar.leading] is null, leading space is given to [AppBar.title].
 If leading widget is not null, this parameter has no effect.
 

- **title**: `Widget?`
  
 The primary widget displayed in the app bar.

 Becomes the middle component of the [NavigationToolbar] built by this widget.

 Typically a [Text] widget that contains a description of the current
 contents of the app.
 

 The [title]'s width is constrained to fit within the remaining space
 between the toolbar's [leading] and [actions] widgets. Its height is
 _not_ constrained. The [title] is vertically centered and clipped to fit
 within the toolbar, whose height is [toolbarHeight]. Typically this
 isn't noticeable because a simple [Text] [title] will fit within the
 toolbar by default. On the other hand, it is noticeable when a
 widget with an intrinsic height that is greater than [toolbarHeight]
 is used as the [title]. For example, when the height of an Image used
 as the [title] exceeds [toolbarHeight], it will be centered and
 clipped (top and bottom), which may be undesirable. In cases like this
 the height of the [title] widget can be constrained. For example:

 ```dart
 MaterialApp(
   home: Scaffold(
     appBar: AppBar(
       title: SizedBox(
         height: _myToolbarHeight,
         child: Image.asset(_logoAsset),
       ),
       toolbarHeight: _myToolbarHeight,
     ),
   ),
 )
 ```

- **actions**: `List&lt;Widget&gt;?`
  
 A list of Widgets to display in a row after the [title] widget.

 Typically these widgets are [IconButton]s representing common operations.
 For less common operations, consider using a [PopupMenuButton] as the
 last action.

 The [actions] become the trailing component of the [NavigationToolbar] built
 by this widget. The height of each action is constrained to be no bigger
 than the [toolbarHeight].

 To avoid having the last action covered by the debug banner, you may want
 to set the [MaterialApp.debugShowCheckedModeBanner] to false.
 

 

 ```dart
 Scaffold(
   body: CustomScrollView(
     primary: true,
     slivers: <Widget>[
       SliverAppBar(
         title: const Text('Hello World'),
         actions: <Widget>[
           IconButton(
             icon: const Icon(Icons.shopping_cart),
             tooltip: 'Open shopping cart',
             onPressed:  ,
           ),
         ],
       ),
       // ...rest of body...
     ],
   ),
 )
 ```
 

- **flexibleSpace**: `Widget?`
  
 This widget is stacked behind the toolbar and the tab bar. Its height will
 be the same as the app bar's overall height.

 A flexible space isn't actually flexible unless the [AppBar]'s container
 changes the [AppBar]'s size. A [SliverAppBar] in a [CustomScrollView]
 changes the [AppBar]'s height when scrolled.

 Typically a [FlexibleSpaceBar]. See [FlexibleSpaceBar] for details.
 

- **bottom**: `PreferredSizeWidget?`
  
 This widget appears across the bottom of the app bar.

 Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
 be used at the bottom of an app bar.
 

 See also:

  * [PreferredSize], which can be used to give an arbitrary widget a preferred size.

- **elevation**: `double?`
  
 The z-coordinate at which to place this app bar relative to its parent.

 This property controls the size of the shadow below the app bar if
 [shadowColor] is not null.

 If [surfaceTintColor] is not null then it will apply a surface tint overlay
 to the background color (see [Material.surfaceTintColor] for more
 detail).

 The value must be non-negative.

 If this property is null, then [AppBarTheme.elevation] of
 [ThemeData.appBarTheme] is used. If that is also null, the
 default value is 4.
 

 See also:

  * [scrolledUnderElevation], which will be used when the app bar has
    something scrolled underneath it.
  * [shadowColor], which is the color of the shadow below the app bar.
  * [surfaceTintColor], which determines the elevation overlay that will
    be applied to the background of the app bar.
  * [shape], which defines the shape of the app bar's [Material] and its
    shadow.

- **scrolledUnderElevation**: `double?`
  
 The elevation that will be used if this app bar has something
 scrolled underneath it.

 If non-null then it [AppBarTheme.scrolledUnderElevation] of
 [ThemeData.appBarTheme] will be used. If that is also null then [elevation]
 will be used.

 The value must be non-negative.

 

 See also:
  * [elevation], which will be used if there is no content scrolled under
    the app bar.
  * [shadowColor], which is the color of the shadow below the app bar.
  * [surfaceTintColor], which determines the elevation overlay that will
    be applied to the background of the app bar.
  * [shape], which defines the shape of the app bar's [Material] and its
    shadow.

- **notificationPredicate**: `ScrollNotificationPredicate`
  A check that specifies which child's [ScrollNotification]s should be
 listened to.

 By default, checks whether `notification.depth == 0`. Set it to something
 else for more complicated layouts.

- **shadowColor**: `Color?`
  
 The color of the shadow below the app bar.

 If this property is null, then [AppBarTheme.shadowColor] of
 [ThemeData.appBarTheme] is used. If that is also null, the default value
 is fully opaque black.
 

 See also:

  * [elevation], which defines the size of the shadow below the app bar.
  * [shape], which defines the shape of the app bar and its shadow.

- **surfaceTintColor**: `Color?`
  
 The color of the surface tint overlay applied to the app bar's
 background color to indicate elevation.

 If null no overlay will be applied.
 

 See also:
   * [Material.surfaceTintColor], which described this feature in more detail.

- **shape**: `ShapeBorder?`
  
 The shape of the app bar's [Material] as well as its shadow.

 If this property is null, then [AppBarTheme.shape] of
 [ThemeData.appBarTheme] is used. Both properties default to null.
 If both properties are null then the shape of the app bar's [Material]
 is just a simple rectangle.

 A shadow is only displayed if the [elevation] is greater than
 zero.
 

 
 This sample demonstrates how to implement a custom app bar shape for the
 [shape] property.

 ** See code in examples/api/lib/material/app_bar/app_bar.4.dart **
 
 See also:

  * [elevation], which defines the size of the shadow below the app bar.
  * [shadowColor], which is the color of the shadow below the app bar.

- **backgroundColor**: `Color?`
  
 The fill color to use for an app bar's [Material].

 If null, then the [AppBarTheme.backgroundColor] is used. If that value is also
 null:
 In Material v2 (i.e., when [ThemeData.useMaterial3] is false),
 then [AppBar] uses the overall theme's [ColorScheme.primary] if the
 overall theme's brightness is [Brightness.light], and [ColorScheme.surface]
 if the overall theme's brightness is [Brightness.dark].
 In Material v3 (i.e., when [ThemeData.useMaterial3] is true),
 then [AppBar] uses the overall theme's [ColorScheme.surface]

 If this color is a [WidgetStateColor] it will be resolved against
 [WidgetState.scrolledUnder] when the content of the app's
 primary scrollable overlaps the app bar.
 

 See also:

  * [foregroundColor], which specifies the color for icons and text within
    the app bar.
  * [Theme.of], which returns the current overall Material theme as
    a [ThemeData].
  * [ThemeData.colorScheme], the thirteen colors that most Material widget
    default colors are based on.
  * [ColorScheme.brightness], which indicates if the overall [Theme]
    is light or dark.

- **foregroundColor**: `Color?`
  
 The default color for [Text] and [Icon]s within the app bar.

 If null, then [AppBarTheme.foregroundColor] is used. If that
 value is also null:
 In Material v2 (i.e., when [ThemeData.useMaterial3] is false),
 then [AppBar] uses the overall theme's [ColorScheme.onPrimary] if the
 overall theme's brightness is [Brightness.light], and [ColorScheme.onSurface]
 if the overall theme's brightness is [Brightness.dark].
 In Material v3 (i.e., when [ThemeData.useMaterial3] is true),
 then [AppBar] uses the overall theme's [ColorScheme.onSurface].

 This color is used to configure [DefaultTextStyle] that contains
 the toolbar's children, and the default [IconTheme] widgets that
 are created if [iconTheme] and [actionsIconTheme] are null.
 

 See also:

  * [backgroundColor], which specifies the app bar's background color.
  * [Theme.of], which returns the current overall Material theme as
    a [ThemeData].
  * [ThemeData.colorScheme], the thirteen colors that most Material widget
    default colors are based on.
  * [ColorScheme.brightness], which indicates if the overall [Theme]
    is light or dark.

- **iconTheme**: `IconThemeData?`
  
 The color, opacity, and size to use for toolbar icons.

 If this property is null, then a copy of [ThemeData.iconTheme]
 is used, with the [IconThemeData.color] set to the
 app bar's [foregroundColor].
 

 See also:

  * [actionsIconTheme], which defines the appearance of icons in
    the [actions] list.

- **actionsIconTheme**: `IconThemeData?`
  
 The color, opacity, and size to use for the icons that appear in the app
 bar's [actions].

 This property should only be used when the [actions] should be
 themed differently than the icon that appears in the app bar's [leading]
 widget.

 If this property is null, then [AppBarTheme.actionsIconTheme] of
 [ThemeData.appBarTheme] is used. If that is also null, then the value of
 [iconTheme] is used.
 

 See also:

  * [iconTheme], which defines the appearance of all of the toolbar icons.

- **primary**: `bool`
  
 Whether this app bar is being displayed at the top of the screen.

 If true, the app bar's toolbar elements and [bottom] widget will be
 padded on top by the height of the system status bar. The layout
 of the [flexibleSpace] is not affected by the [primary] property.
 

- **centerTitle**: `bool?`
  
 Whether the title should be centered.

 If this property is null, then [AppBarTheme.centerTitle] of
 [ThemeData.appBarTheme] is used. If that is also null, then value is
 adapted to the current [TargetPlatform].
 

- **excludeHeaderSemantics**: `bool`
  
 Whether the title should be wrapped with header [Semantics].

 Defaults to false.
 

- **titleSpacing**: `double?`
  
 The spacing around [title] content on the horizontal axis. This spacing is
 applied even if there is no [leading] content or [actions]. If you want
 [title] to take all the space available, set this value to 0.0.

 If this property is null, then [AppBarTheme.titleSpacing] of
 [ThemeData.appBarTheme] is used. If that is also null, then the
 default value is [NavigationToolbar.kMiddleSpacing].
 

- **toolbarOpacity**: `double`
  
 How opaque the toolbar part of the app bar is.

 A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.

 Typically, this value is not changed from its default value (1.0). It is
 used by [SliverAppBar] to animate the opacity of the toolbar when the app
 bar is scrolled.
 

- **bottomOpacity**: `double`
  
 How opaque the bottom part of the app bar is.

 A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.

 Typically, this value is not changed from its default value (1.0). It is
 used by [SliverAppBar] to animate the opacity of the toolbar when the app
 bar is scrolled.
 

- **preferredSize**: `Size`
  
 A size whose height is the sum of [toolbarHeight] and the [bottom] widget's
 preferred height.

 [Scaffold] uses this size to set its app bar's height.
 

- **toolbarHeight**: `double?`
  
 Defines the height of the toolbar component of an [AppBar].

 By default, the value of [toolbarHeight] is [kToolbarHeight].
 

- **leadingWidth**: `double?`
  
 Defines the width of [AppBar.leading] widget.

 By default, the value of [AppBar.leadingWidth] is 56.0.
 

- **toolbarTextStyle**: `TextStyle?`
  
 The default text style for the AppBar's [leading], and
 [actions] widgets, but not its [title].

 If this property is null, then [AppBarTheme.toolbarTextStyle] of
 [ThemeData.appBarTheme] is used. If that is also null, the default
 value is a copy of the overall theme's [TextTheme.bodyMedium]
 [TextStyle], with color set to the app bar's [foregroundColor].
 

 See also:

  * [titleTextStyle], which overrides the default text style for the [title].
  * [DefaultTextStyle], which overrides the default text style for all of the
    widgets in a subtree.

- **titleTextStyle**: `TextStyle?`
  
 The default text style for the AppBar's [title] widget.

 If this property is null, then [AppBarTheme.titleTextStyle] of
 [ThemeData.appBarTheme] is used. If that is also null, the default
 value is a copy of the overall theme's [TextTheme.titleLarge]
 [TextStyle], with color set to the app bar's [foregroundColor].
 

 See also:

  * [toolbarTextStyle], which is the default text style for the AppBar's
    [title], [leading], and [actions] widgets, also known as the
    AppBar's "toolbar".
  * [DefaultTextStyle], which overrides the default text style for all of the
    widgets in a subtree.

- **systemOverlayStyle**: `SystemUiOverlayStyle?`
  
 Specifies the style to use for the system overlays (e.g. the status bar on
 Android or iOS, the system navigation bar on Android).

 If this property is null, then [AppBarTheme.systemOverlayStyle] of
 [ThemeData.appBarTheme] is used. If that is also null, an appropriate
 [SystemUiOverlayStyle] is calculated based on the [backgroundColor].

 The AppBar's descendants are built within a
 `AnnotatedRegion&lt;SystemUiOverlayStyle&gt;` widget, which causes
 [SystemChrome.setSystemUIOverlayStyle] to be called
 automatically. Apps should not enclose an AppBar with their
 own [AnnotatedRegion].
 
 See also:

  * [AnnotatedRegion], for placing [SystemUiOverlayStyle] in the layer tree.
  * [SystemChrome.setSystemUIOverlayStyle], the imperative API for setting
    system overlays style.

- **forceMaterialTransparency**: `bool`
  
 Forces the AppBar's Material widget type to be [MaterialType.transparency]
 (instead of Material's default type).

 This will remove the visual display of [backgroundColor] and [elevation],
 and affect other characteristics of the AppBar's Material widget.

 Provided for cases where the app bar is to be transparent, and gestures
 must pass through the app bar to widgets beneath the app bar (i.e. with
 [Scaffold.extendBodyBehindAppBar] set to true).

 Defaults to false.
 

- **useDefaultSemanticsOrder**: `bool`
  
 Whether to use the default semantic ordering for the app bar's children for
 accessibility traversal order.

 If this is set to true, the app bar will use the default semantic ordering,
 which places the flexible space after the main content in the semantics tree.
 This affects how screen readers and other assistive technologies navigate the app bar's content.

 Set this to false if you want to customize semantics traversal order in the app bar.
 You can then assign [SemanticsSortKey]s to app bar's children to control the order.

 Defaults to true.

 See also:
  * [SemanticsSortKey], which are keys used to define the accessibility traversal order.
 

- **clipBehavior**: `Clip?`
  

- **actionsPadding**: `EdgeInsetsGeometry?`
  
 The padding between the [actions] and the end of the AppBar.

 Defaults to zero.
 

## Constructors

### Unnamed Constructor
Creates a Material Design app bar.

 If [elevation] is specified, it must be non-negative.

 Typically used in the [Scaffold.appBar] property.

