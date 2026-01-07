# Overview for `DrawerThemeData`

## Description

Defines default property values for descendant [Drawer] widgets.

 Descendant widgets obtain the current [DrawerThemeData] object
 using `DrawerTheme.of(context)`. Instances of [DrawerThemeData] can be
 customized with [DrawerThemeData.copyWith].

 Typically a [DrawerThemeData] is specified as part of the
 overall [Theme] with [ThemeData.drawerTheme].

 All [DrawerThemeData] properties are `null` by default.

 See also:

  * [DrawerTheme], an [InheritedWidget] that propagates the theme down its
    subtree.
  * [ThemeData], which describes the overall theme information for the
    application and can customize a drawer using [ThemeData.drawerTheme].

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  Overrides the default value of [Drawer.backgroundColor].

- **scrimColor**: `Color?`
  Overrides the default value of [DrawerController.scrimColor].

- **elevation**: `double?`
  Overrides the default value of [Drawer.elevation].

- **shadowColor**: `Color?`
  Overrides the default value for [Drawer.shadowColor].

- **surfaceTintColor**: `Color?`
  Overrides the default value for [Drawer.surfaceTintColor].

- **shape**: `ShapeBorder?`
  Overrides the default value of [Drawer.shape].

- **endShape**: `ShapeBorder?`
  Overrides the default value of [Drawer.shape] for an end drawer.

- **width**: `double?`
  Overrides the default value of [Drawer.width].

- **clipBehavior**: `Clip?`
  Overrides the default value of [Drawer.clipBehavior].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.drawerTheme] and
 [DrawerTheme].

