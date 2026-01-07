# Overview for `NavigationRail`

## Description

A Material Design widget that is meant to be displayed at the left or right of an
 app to navigate between a small number of views, typically between three and
 five.

 

 The navigation rail is meant for layouts with wide viewports, such as a
 desktop web or tablet landscape layout. For smaller layouts, like mobile
 portrait, a [BottomNavigationBar] should be used instead.

 A navigation rail is usually used as the first or last element of a [Row]
 which defines the app's [Scaffold] body.

 The appearance of all of the [NavigationRail]s within an app can be
 specified with [NavigationRailTheme]. The default values for null theme
 properties are based on the [Theme]'s [ThemeData.textTheme],
 [ThemeData.iconTheme], and [ThemeData.colorScheme].

 Adaptive layouts can build different instances of the [Scaffold] in order to
 have a navigation rail for more horizontal layouts and a bottom navigation
 bar for more vertical layouts. See
 [the adaptive_scaffold.dart sample](https://github.com/flutter/samples/blob/main/experimental/web_dashboard/lib/src/widgets/third_party/adaptive_scaffold.dart)
 for an example.

 
 This sample shows the creation of [NavigationRail] widget used within a Scaffold with 3
 [NavigationRailDestination]s, as described in: https://m3.material.io/components/navigation-rail/overview

 ** See code in examples/api/lib/material/navigation_rail/navigation_rail.0.dart **
 

 See also:

  * [Scaffold], which can display the navigation rail within a [Row] of the
    [Scaffold.body] slot.
  * [NavigationRailDestination], which is used as a model to create tappable
    destinations in the navigation rail.
  * [BottomNavigationBar], which is a similar navigation widget that's laid
     out horizontally.
  * <https://material.io/components/navigation-rail/>
  * <https://m3.material.io/components/navigation-rail>

## Dependencies

- StatefulWidget

## Members

- **backgroundColor**: `Color?`
  Sets the color of the Container that holds all of the [NavigationRail]'s
 contents.

 The default value is [NavigationRailThemeData.backgroundColor]. If
 [NavigationRailThemeData.backgroundColor] is null, then the default value
 is based on [ColorScheme.surface] of [ThemeData.colorScheme].

- **extended**: `bool`
  Indicates that the [NavigationRail] should be in the extended state.

 The extended state has a wider rail container, and the labels are
 positioned next to the icons. [minExtendedWidth] can be used to set the
 minimum width of the rail when it is in this state.

 The rail will implicitly animate between the extended and normal state.

 If the rail is going to be in the extended state, then the [labelType]
 must be set to [NavigationRailLabelType.none].

 The default value is false.

- **leading**: `Widget?`
  The leading widget in the rail that is placed above the destinations.

 It is placed at the top of the rail, above the [destinations]. Its
 location is not affected by [groupAlignment].

 This is commonly a [FloatingActionButton], but may also be a non-button,
 such as a logo.

 The default value is null.

- **trailing**: `Widget?`
  The trailing widget in the rail that is placed below the destinations.

 The trailing widget is placed below the last [NavigationRailDestination].
 It's location is affected by [groupAlignment].

 This is commonly a list of additional options or destinations that is
 usually only rendered when [extended] is true.

 The default value is null.

- **destinations**: `List&lt;NavigationRailDestination&gt;`
  Defines the appearance of the button items that are arrayed within the
 navigation rail.

 The value must be a list of zero or more [NavigationRailDestination]
 values.

- **selectedIndex**: `int?`
  The index into [destinations] for the current selected
 [NavigationRailDestination] or null if no destination is selected.

- **onDestinationSelected**: `ValueChanged&lt;int&gt;?`
  Called when one of the [destinations] is selected.

 The stateful widget that creates the navigation rail needs to keep
 track of the index of the selected [NavigationRailDestination] and call
 `setState` to rebuild the navigation rail with the new [selectedIndex].

- **elevation**: `double?`
  The rail's elevation or z-coordinate.

 If [Directionality] is [TextDirection.ltr], the inner side is the
 right side, and if [Directionality] is [TextDirection.rtl], it is
 the left side.

 The default value is 0.

- **groupAlignment**: `double?`
  The vertical alignment for the group of [destinations] within the rail.

 The [NavigationRailDestination]s are grouped together with the [trailing]
 widget, between the [leading] widget and the bottom of the rail.

 The value must be between -1.0 and 1.0.

 If [groupAlignment] is -1.0, then the items are aligned to the top. If
 [groupAlignment] is 0.0, then the items are aligned to the center. If
 [groupAlignment] is 1.0, then the items are aligned to the bottom.

 The default is -1.0.

 See also:
   * [Alignment.y]

- **labelType**: `NavigationRailLabelType?`
  Defines the layout and behavior of the labels for the default, unextended
 [NavigationRail].

 When a navigation rail is [extended], the labels are always shown.

 The default value is [NavigationRailThemeData.labelType]. If
 [NavigationRailThemeData.labelType] is null, then the default value is
 [NavigationRailLabelType.none].

 See also:

   * [NavigationRailLabelType] for information on the meaning of different
   types.

- **unselectedLabelTextStyle**: `TextStyle?`
  The [TextStyle] of a destination's label when it is unselected.

 When one of the [destinations] is selected the [selectedLabelTextStyle]
 will be used instead.

 The default value is based on the [Theme]'s [TextTheme.bodyLarge]. The
 default color is based on the [Theme]'s [ColorScheme.onSurface].

 Properties from this text style, or
 [NavigationRailThemeData.unselectedLabelTextStyle] if this is null, are
 merged into the defaults.

- **selectedLabelTextStyle**: `TextStyle?`
  The [TextStyle] of a destination's label when it is selected.

 When a [NavigationRailDestination] is not selected,
 [unselectedLabelTextStyle] will be used.

 The default value is based on the [TextTheme.bodyLarge] of
 [ThemeData.textTheme]. The default color is based on the [Theme]'s
 [ColorScheme.primary].

 Properties from this text style,
 or [NavigationRailThemeData.selectedLabelTextStyle] if this is null, are
 merged into the defaults.

- **unselectedIconTheme**: `IconThemeData?`
  The visual properties of the icon in the unselected destination.

 If this field is not provided, or provided with any null properties, then
 a copy of the [IconThemeData.fallback] with a custom [NavigationRail]
 specific color will be used.

 The default value is the [Theme]'s [ThemeData.iconTheme] with a color
 of the [Theme]'s [ColorScheme.onSurface] with an opacity of 0.64.
 Properties from this icon theme, or
 [NavigationRailThemeData.unselectedIconTheme] if this is null, are
 merged into the defaults.

- **selectedIconTheme**: `IconThemeData?`
  The visual properties of the icon in the selected destination.

 When a [NavigationRailDestination] is not selected,
 [unselectedIconTheme] will be used.

 The default value is the [Theme]'s [ThemeData.iconTheme] with a color
 of the [Theme]'s [ColorScheme.primary]. Properties from this icon theme,
 or [NavigationRailThemeData.selectedIconTheme] if this is null, are
 merged into the defaults.

- **minWidth**: `double?`
  The smallest possible width for the rail regardless of the destination's
 icon or label size.

 The default is 72.

 This value also defines the min width and min height of the destinations.

 To make a compact rail, set this to 56 and use
 [NavigationRailLabelType.none].

- **minExtendedWidth**: `double?`
  The final width when the animation is complete for setting [extended] to
 true.

 This is only used when [extended] is set to true.

 The default value is 256.

- **useIndicator**: `bool?`
  If `true`, adds a rounded [NavigationIndicator] behind the selected
 destination's icon.

 The indicator's shape will be circular if [labelType] is
 [NavigationRailLabelType.none], or a [StadiumBorder] if [labelType] is
 [NavigationRailLabelType.all] or [NavigationRailLabelType.selected].

 If `null`, defaults to [NavigationRailThemeData.useIndicator]. If that is
 `null`, defaults to [ThemeData.useMaterial3].

- **indicatorColor**: `Color?`
  Overrides the default value of [NavigationRail]'s selection indicator color,
 when [useIndicator] is true.

 If this is null, [NavigationRailThemeData.indicatorColor] is used. If
 that is null, defaults to [ColorScheme.secondaryContainer].

- **indicatorShape**: `ShapeBorder?`
  Overrides the default value of [NavigationRail]'s selection indicator shape,
 when [useIndicator] is true.

 If this is null, [NavigationRailThemeData.indicatorShape] is used. If
 that is null, defaults to [StadiumBorder].

## Constructors

### Unnamed Constructor
Creates a Material Design navigation rail.

 The value of [destinations] must be a list of zero or more
 [NavigationRailDestination] values.

 If [elevation] is specified, it must be non-negative.

 If [minWidth] is specified, it must be non-negative, and if
 [minExtendedWidth] is specified, it must be non-negative and greater than
 [minWidth].

 The [extended] argument can only be set to true when the [labelType] is
 null or [NavigationRailLabelType.none].

 If [backgroundColor], [elevation], [groupAlignment], [labelType],
 [unselectedLabelTextStyle], [selectedLabelTextStyle],
 [unselectedIconTheme], or [selectedIconTheme] are null, then their
 [NavigationRailThemeData] values will be used. If the corresponding
 [NavigationRailThemeData] property is null, then the navigation rail
 defaults are used. See the individual properties for more information.

 Typically used within a [Row] that defines the [Scaffold.body] property.

