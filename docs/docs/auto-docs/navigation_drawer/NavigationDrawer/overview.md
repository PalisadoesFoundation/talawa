# Overview for `NavigationDrawer`

## Description

Material Design Navigation Drawer component.

 On top of [Drawer]s, Navigation drawers offer a persistent and convenient way to switch
 between primary destinations in an app.

 The style for the icons and text are not affected by parent
 [DefaultTextStyle]s or [IconTheme]s but rather controlled by parameters or
 the [NavigationDrawerThemeData].

 The [children] are a list of widgets to be displayed in the drawer. These can be a
 mixture of any widgets, but there is special handling for [NavigationDrawerDestination]s.
 They are treated as a group and when one is selected, the [onDestinationSelected]
 is called with the index into the group that corresponds to the selected destination.

 
 This example shows a [NavigationDrawer] used within a [Scaffold]
 widget. The [NavigationDrawer] has headline widget, divider widget and three
 [NavigationDrawerDestination] widgets. The initial [selectedIndex] is 0.
 The [onDestinationSelected] callback changes the selected item's index and displays
 a corresponding widget in the body of the [Scaffold].

 ** See code in examples/api/lib/material/navigation_drawer/navigation_drawer.0.dart **
 

 See also:

  * [Scaffold.drawer], where one specifies a [Drawer] so that it can be
    shown.
  * [Scaffold.of], to obtain the current [ScaffoldState], which manages the
    display and animation of the drawer.
  * [ScaffoldState.openDrawer], which displays its [Drawer], if any.
  * <https://material.io/design/components/navigation-drawer.html>

## Dependencies

- StatelessWidget

## Members

- **backgroundColor**: `Color?`
  The background color of the [Material] that holds the [NavigationDrawer]'s
 contents.

 If this is null, then [NavigationDrawerThemeData.backgroundColor] is used.
 If that is also null, then it falls back to [ColorScheme.surfaceContainerLow].

- **shadowColor**: `Color?`
  The color used for the drop shadow to indicate elevation.

 If null, [NavigationDrawerThemeData.shadowColor] is used. If that
 is also null, the default value is [Colors.transparent] which
 indicates that no drop shadow will be displayed.

 See [Material.shadowColor] for more details on drop shadows.

- **surfaceTintColor**: `Color?`
  The surface tint of the [Material] that holds the [NavigationDrawer]'s
 contents.

 This is not recommended for use. [Material 3 spec](https://m3.material.io/styles/color/the-color-system/color-roles)
 introduced a set of tone-based surfaces and surface containers in its [ColorScheme],
 which provide more flexibility. The intention is to eventually remove surface tint color from
 the framework.

 If this is null, then [NavigationDrawerThemeData.surfaceTintColor] is used.
 If that is also null, the default value is [Colors.transparent].

- **elevation**: `double?`
  The elevation of the [NavigationDrawer] itself.

 If null, [NavigationDrawerThemeData.elevation] is used. If that
 is also null, it will be 1.0.

- **indicatorColor**: `Color?`
  The color of the [indicatorShape] when this destination is selected.

 If this is null, [NavigationDrawerThemeData.indicatorColor] is used.
 If that is also null, defaults to [ColorScheme.secondaryContainer].

- **indicatorShape**: `ShapeBorder?`
  The shape of the selected indicator.

 If this is null, [NavigationDrawerThemeData.indicatorShape] is used.
 If that is also null, defaults to [StadiumBorder].

- **children**: `List&lt;Widget&gt;`
  Defines the appearance of the items within the navigation drawer.

 The list contains [NavigationDrawerDestination] widgets and/or customized
 widgets like headlines and dividers.

- **selectedIndex**: `int?`
  The index into destinations for the current selected
 [NavigationDrawerDestination] or null if no destination is selected.

 A valid [selectedIndex] satisfies 0 <= [selectedIndex] < number of [NavigationDrawerDestination].
 For an invalid [selectedIndex] like `-1`, all destinations will appear unselected.

- **onDestinationSelected**: `ValueChanged&lt;int&gt;?`
  Called when one of the [NavigationDrawerDestination] children is selected.

 This callback usually updates the int passed to [selectedIndex].

 Upon updating [selectedIndex], the [NavigationDrawer] will be rebuilt.

- **tilePadding**: `EdgeInsetsGeometry`
  Defines the padding for [NavigationDrawerDestination] widgets (Drawer items).

 Defaults to `EdgeInsets.symmetric(horizontal: 12.0)`.

## Constructors

### Unnamed Constructor
Creates a Material Design Navigation Drawer component.

