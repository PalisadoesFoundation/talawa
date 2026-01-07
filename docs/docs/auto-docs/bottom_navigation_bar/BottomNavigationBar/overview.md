# Overview for `BottomNavigationBar`

## Description

A material widget that's displayed at the bottom of an app for selecting
 among a small number of views, typically between three and five.

 There is an updated version of this component, [NavigationBar], that's
 preferred for new applications and applications that are configured
 for Material 3 (see [ThemeData.useMaterial3]).

 The bottom navigation bar consists of multiple items in the form of
 text labels, icons, or both, laid out on top of a piece of material. It
 provides quick navigation between the top-level views of an app. For larger
 screens, side navigation may be a better fit.

 A bottom navigation bar is usually used in conjunction with a [Scaffold],
 where it is provided as the [Scaffold.bottomNavigationBar] argument.

 The bottom navigation bar's [type] changes how its [items] are displayed.
 If not specified, then it's automatically set to
 [BottomNavigationBarType.fixed] when there are less than four items, and
 [BottomNavigationBarType.shifting] otherwise.

 The length of [items] must be at least two and each item's icon and
 label must not be null.

  * [BottomNavigationBarType.fixed], the default when there are less than
    four [items]. The selected item is rendered with the
    [selectedItemColor] if it's non-null, otherwise the theme's
    [ColorScheme.primary] color is used for [Brightness.light] themes
    and [ColorScheme.secondary] for [Brightness.dark] themes.
    If [backgroundColor] is null, The
    navigation bar's background color defaults to the [Material] background
    color, [ThemeData.canvasColor] (essentially opaque white).
  * [BottomNavigationBarType.shifting], the default when there are four
    or more [items]. If [selectedItemColor] is null, all items are rendered
    in white. The navigation bar's background color is the same as the
    [BottomNavigationBarItem.backgroundColor] of the selected item. In this
    case it's assumed that each item will have a different background color
    and that background color will contrast well with white.

 ## Updating to [NavigationBar]

 The [NavigationBar] widget's visuals
 are a little bit different, see the Material 3 spec at
 <https://m3.material.io/components/navigation-bar/overview> for
 more details.

 The [NavigationBar] widget's API is also slightly different.
 To update from [BottomNavigationBar] to [NavigationBar], you will
 need to make the following changes.

 1. Instead of using [BottomNavigationBar.items], which
 takes a list of [BottomNavigationBarItem]s, use
 [NavigationBar.destinations], which takes a list of widgets.
 Usually, you use a list of [NavigationDestination] widgets.
 Just like [BottomNavigationBarItem]s, [NavigationDestination]s
 have a label and icon field.

 2. Instead of using [BottomNavigationBar.onTap],
 use [NavigationBar.onDestinationSelected], which is also
 a callback that is called when the user taps on a
 navigation bar item.

 3. Instead of using [BottomNavigationBar.currentIndex],
 use [NavigationBar.selectedIndex], which is also an integer
 that represents the index of the selected destination.

 4. You may also need to make changes to the styling of the
 [NavigationBar], see the properties in the [NavigationBar]
 constructor for more details.

 ## Using [BottomNavigationBar]

 
 This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
 widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
 widgets, which means it defaults to [BottomNavigationBarType.fixed], and
 the [currentIndex] is set to index 0. The selected item is
 amber. The `_onItemTapped` function changes the selected item's index
 and displays a corresponding message in the center of the [Scaffold].

 ** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.0.dart **
 

 
 This example shows how you would migrate the above [BottomNavigationBar]
 to the new [NavigationBar].

 ** See code in examples/api/lib/material/navigation_bar/navigation_bar.0.dart **
 

 
 This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
 widget. The [BottomNavigationBar] has four [BottomNavigationBarItem]
 widgets, which means it defaults to [BottomNavigationBarType.shifting], and
 the [currentIndex] is set to index 0. The selected item is amber in color.
 With each [BottomNavigationBarItem] widget, backgroundColor property is
 also defined, which changes the background color of [BottomNavigationBar],
 when that item is selected. The `_onItemTapped` function changes the
 selected item's index and displays a corresponding message in the center of
 the [Scaffold].

 ** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.1.dart **
 

 
 This example shows [BottomNavigationBar] used in a [Scaffold] Widget with
 different interaction patterns. Tapping twice on the first [BottomNavigationBarItem]
 uses the [ScrollController] to animate the [ListView] to the top. The second
 [BottomNavigationBarItem] shows a Modal Dialog.

 ** See code in examples/api/lib/material/bottom_navigation_bar/bottom_navigation_bar.2.dart **
 
 See also:

  * [BottomNavigationBarItem]
  * [Scaffold]
  * <https://material.io/design/components/bottom-navigation.html>
  * [NavigationBar], this widget's replacement in Material Design 3.

## Dependencies

- StatefulWidget

## Members

- **items**: `List&lt;BottomNavigationBarItem&gt;`
  Defines the appearance of the button items that are arrayed within the
 bottom navigation bar.

- **onTap**: `ValueChanged&lt;int&gt;?`
  Called when one of the [items] is tapped.

 The stateful widget that creates the bottom navigation bar needs to keep
 track of the index of the selected [BottomNavigationBarItem] and call
 `setState` to rebuild the bottom navigation bar with the new [currentIndex].

- **currentIndex**: `int`
  The index into [items] for the current active [BottomNavigationBarItem].

- **elevation**: `double?`
  The z-coordinate of this [BottomNavigationBar].

 If null, defaults to `8.0`.

 

- **type**: `BottomNavigationBarType?`
  Defines the layout and behavior of a [BottomNavigationBar].

 See documentation for [BottomNavigationBarType] for information on the
 meaning of different types.

- **backgroundColor**: `Color?`
  The color of the [BottomNavigationBar] itself.

 If [type] is [BottomNavigationBarType.shifting] and the
 [items] have [BottomNavigationBarItem.backgroundColor] set, the [items]'
 backgroundColor will splash and overwrite this color.

- **iconSize**: `double`
  The size of all of the [BottomNavigationBarItem] icons.

 See [BottomNavigationBarItem.icon] for more information.

- **selectedItemColor**: `Color?`
  The color of the selected [BottomNavigationBarItem.icon] and
 [BottomNavigationBarItem.label].

 If null then the [ThemeData.primaryColor] is used.

- **unselectedItemColor**: `Color?`
  The color of the unselected [BottomNavigationBarItem.icon] and
 [BottomNavigationBarItem.label]s.

 If null then the [ThemeData.unselectedWidgetColor]'s color is used.

- **selectedIconTheme**: `IconThemeData?`
  The size, opacity, and color of the icon in the currently selected
 [BottomNavigationBarItem.icon].

 If this is not provided, the size will default to [iconSize], the color
 will default to [selectedItemColor].

 It this field is provided, it must contain non-null [IconThemeData.size]
 and [IconThemeData.color] properties. Also, if this field is supplied,
 [unselectedIconTheme] must be provided.

- **unselectedIconTheme**: `IconThemeData?`
  The size, opacity, and color of the icon in the currently unselected
 [BottomNavigationBarItem.icon]s.

 If this is not provided, the size will default to [iconSize], the color
 will default to [unselectedItemColor].

 It this field is provided, it must contain non-null [IconThemeData.size]
 and [IconThemeData.color] properties. Also, if this field is supplied,
 [selectedIconTheme] must be provided.

- **selectedLabelStyle**: `TextStyle?`
  The [TextStyle] of the [BottomNavigationBarItem] labels when they are
 selected.

- **unselectedLabelStyle**: `TextStyle?`
  The [TextStyle] of the [BottomNavigationBarItem] labels when they are not
 selected.

- **selectedFontSize**: `double`
  The font size of the [BottomNavigationBarItem] labels when they are selected.

 If [TextStyle.fontSize] of [selectedLabelStyle] is non-null, it will be
 used instead of this.

 Defaults to `14.0`.

- **unselectedFontSize**: `double`
  The font size of the [BottomNavigationBarItem] labels when they are not
 selected.

 If [TextStyle.fontSize] of [unselectedLabelStyle] is non-null, it will be
 used instead of this.

 Defaults to `12.0`.

- **showUnselectedLabels**: `bool?`
  Whether the labels are shown for the unselected [BottomNavigationBarItem]s.

- **showSelectedLabels**: `bool?`
  Whether the labels are shown for the selected [BottomNavigationBarItem].

- **mouseCursor**: `MouseCursor?`
  The cursor for a mouse pointer when it enters or is hovering over the
 items.

 If [mouseCursor] is a [WidgetStateMouseCursor], its `resolve` method
 can define the appearance of the cursor depending on whether
 [WidgetState.selected] is active.

 If null, then the value of [BottomNavigationBarThemeData.mouseCursor] is used. If
 that is also null, then [WidgetStateMouseCursor.clickable] is used.

- **enableFeedback**: `bool?`
  Whether detected gestures should provide acoustic and/or haptic feedback.

 For example, on Android a tap will produce a clicking sound and a
 long-press will produce a short vibration, when feedback is enabled.

 See also:

  * [Feedback] for providing platform-specific feedback to certain actions.

- **landscapeLayout**: `BottomNavigationBarLandscapeLayout?`
  The arrangement of the bar's [items] when the enclosing
 [MediaQueryData.orientation] is [Orientation.landscape].

 The following alternatives are supported:

 * [BottomNavigationBarLandscapeLayout.spread] - the items are
   evenly spaced and spread out across the available width. Each
   item's label and icon are arranged in a column.
 * [BottomNavigationBarLandscapeLayout.centered] - the items are
   evenly spaced in a row but only consume as much width as they
   would in portrait orientation. The row of items is centered within
   the available width. Each item's label and icon are arranged
   in a column.
 * [BottomNavigationBarLandscapeLayout.linear] - the items are
   evenly spaced and each item's icon and label are lined up in a
   row instead of a column.

 If this property is null, then the value of the enclosing
 [BottomNavigationBarThemeData.landscapeLayout is used. If that
 property is also null, then
 [BottomNavigationBarLandscapeLayout.spread] is used.

 This property is null by default.

 See also:

  * [ThemeData.bottomNavigationBarTheme] - which can be used to specify
    bottom navigation bar defaults for an entire application.
  * [BottomNavigationBarTheme] - which can be used to specify
    bottom navigation bar defaults for a widget subtree.
  * [MediaQuery.orientationOf] - which can be used to determine the current
    orientation.

- **useLegacyColorScheme**: `bool`
  This flag is controlling how [BottomNavigationBar] is going to use
 the colors provided by the [selectedIconTheme], [unselectedIconTheme],
 [selectedItemColor], [unselectedItemColor].
 The default value is `true` as the new theming logic is a breaking change.
 To opt-in the new theming logic set the flag to `false`

## Constructors

### Unnamed Constructor
Creates a bottom navigation bar which is typically used as a
 [Scaffold]'s [Scaffold.bottomNavigationBar] argument.

 The length of [items] must be at least two and each item's icon and label
 must not be null.

 If [type] is null then [BottomNavigationBarType.fixed] is used when there
 are two or three [items], [BottomNavigationBarType.shifting] otherwise.

 The [iconSize], [selectedFontSize], [unselectedFontSize], and [elevation]
 arguments must be non-negative.

 If [selectedLabelStyle].color and [unselectedLabelStyle].color values
 are non-null, they will be used instead of [selectedItemColor] and
 [unselectedItemColor].

 If custom [IconThemeData]s are used, you must provide both
 [selectedIconTheme] and [unselectedIconTheme], and both
 [IconThemeData.color] and [IconThemeData.size] must be set.

 If [useLegacyColorScheme] is set to `false`
 [selectedIconTheme] values will be used instead of [iconSize] and [selectedItemColor] for selected icons.
 [unselectedIconTheme] values will be used instead of [iconSize] and [unselectedItemColor] for unselected icons.


 If both [selectedLabelStyle].fontSize and [selectedFontSize] are set,
 [selectedLabelStyle].fontSize will be used.

 Only one of [selectedItemColor] and [fixedColor] can be specified. The
 former is preferred, [fixedColor] only exists for the sake of
 backwards compatibility.

 If [showSelectedLabels] is `null`, [BottomNavigationBarThemeData.showSelectedLabels]
 is used. If [BottomNavigationBarThemeData.showSelectedLabels]  is null,
 then [showSelectedLabels] defaults to `true`.

 If [showUnselectedLabels] is `null`, [BottomNavigationBarThemeData.showUnselectedLabels]
 is used. If [BottomNavigationBarThemeData.showSelectedLabels] is null,
 then [showUnselectedLabels] defaults to `true` when [type] is
 [BottomNavigationBarType.fixed] and `false` when [type] is
 [BottomNavigationBarType.shifting].

