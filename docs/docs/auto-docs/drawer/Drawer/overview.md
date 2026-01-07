# Overview for `Drawer`

## Description

A Material Design panel that slides in horizontally from the edge of a
 [Scaffold] to show navigation links in an application.

 There is a Material 3 version of this component, [NavigationDrawer],
 that's preferred for applications that are configured for Material 3
 (see [ThemeData.useMaterial3]).

 

 Drawers are typically used with the [Scaffold.drawer] property. The child of
 the drawer is usually a [ListView] whose first child is a [DrawerHeader]
 that displays status information about the current user. The remaining
 drawer children are often constructed with [ListTile]s, often concluding
 with an [AboutListTile].

 The [AppBar] automatically displays an appropriate [IconButton] to show the
 [Drawer] when a [Drawer] is available in the [Scaffold]. The [Scaffold]
 automatically handles the edge-swipe gesture to show the drawer.

 

 ## Updating to [NavigationDrawer]

 There is a Material 3 version of this component, [NavigationDrawer],
 that's preferred for applications that are configured for Material 3
 (see [ThemeData.useMaterial3]). The [NavigationDrawer] widget's visual
 are a little bit different, see the Material 3 spec at
 <https://m3.material.io/components/navigation-drawer/overview> for
 more details. While the [Drawer] widget can have only one child, the
 [NavigationDrawer] widget can have a list of widgets, which typically contains
 [NavigationDrawerDestination] widgets and/or customized widgets like headlines
 and dividers.

 
 This example shows how to create a [Scaffold] that contains an [AppBar] and
 a [Drawer]. A user taps the "menu" icon in the [AppBar] to open the
 [Drawer]. The [Drawer] displays four items: A header and three menu items.
 The [Drawer] displays the four items using a [ListView], which allows the
 user to scroll through the items if need be.

 ** See code in examples/api/lib/material/drawer/drawer.0.dart **
 

 
 This example shows how to migrate the above [Drawer] to a [NavigationDrawer].

 ** See code in examples/api/lib/material/navigation_drawer/navigation_drawer.0.dart **
 

 An open drawer may be closed with a swipe to close gesture, pressing the
 escape key, by tapping the scrim, or by calling pop route function such as
 [Navigator.pop]. For example a drawer item might close the drawer when tapped:

 ```dart
 ListTile(
   leading: const Icon(Icons.change_history),
   title: const Text('Change history'),
   onTap:  ,
 );
 ```

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
  Sets the color of the [Material] that holds all of the [Drawer]'s
 contents.

 If this is null, then [DrawerThemeData.backgroundColor] is used. If that
 is also null, then it falls back to [Material]'s default.

- **elevation**: `double?`
  The z-coordinate at which to place this drawer relative to its parent.

 This controls the size of the shadow below the drawer.

 If this is null, then [DrawerThemeData.elevation] is used. If that
 is also null, then it defaults to 16.0.

- **shadowColor**: `Color?`
  The color used to paint a drop shadow under the drawer's [Material],
 which reflects the drawer's [elevation].

 If null and [ThemeData.useMaterial3] is true then no drop shadow will
 be rendered.

 If null and [ThemeData.useMaterial3] is false then it will default to
 [ThemeData.shadowColor].

 See also:
   * [Material.shadowColor], which describes how the drop shadow is painted.
   * [elevation], which affects how the drop shadow is painted.
   * [surfaceTintColor], which can be used to indicate elevation through
     tinting the background color.

- **surfaceTintColor**: `Color?`
  The color used as a surface tint overlay on the drawer's background color,
 which reflects the drawer's [elevation].

 This is not recommended for use. [Material 3 spec](https://m3.material.io/styles/color/the-color-system/color-roles)
 introduced a set of tone-based surfaces and surface containers in its [ColorScheme],
 which provide more flexibility. The intention is to eventually remove surface tint color from
 the framework.

 To disable this feature, set [surfaceTintColor] to [Colors.transparent].

 Defaults to [Colors.transparent].

 See also:
   * [Material.surfaceTintColor], which describes how the surface tint will
     be applied to the background color of the drawer.
   * [elevation], which affects the opacity of the surface tint.
   * [shadowColor], which can be used to indicate elevation through
     a drop shadow.

- **shape**: `ShapeBorder?`
  The shape of the drawer.

 Defines the drawer's [Material.shape].

 If this is null, then [DrawerThemeData.shape] is used. If that
 is also null, then it falls back to [Material]'s default.

- **width**: `double?`
  The width of the drawer.

 If this is null, then [DrawerThemeData.width] is used. If that is also
 null, then it falls back to the Material spec's default (304.0).

- **child**: `Widget?`
  The widget below this widget in the tree.

 Typically a [SliverList].

 

- **semanticLabel**: `String?`
  The semantic label of the drawer used by accessibility frameworks to
 announce screen transitions when the drawer is opened and closed.

 If this label is not provided, it will default to
 [MaterialLocalizations.drawerLabel].

 See also:

  * [SemanticsConfiguration.namesRoute], for a description of how this
    value is used.

- **clipBehavior**: `Clip?`
  

 The [clipBehavior] argument specifies how to clip the drawer's [shape].

 If the drawer has a [shape], it defaults to [Clip.hardEdge]. Otherwise,
 defaults to [Clip.none].

## Constructors

### Unnamed Constructor
Creates a Material Design drawer.

 Typically used in the [Scaffold.drawer] property.

 The [elevation] must be non-negative.

