# Overview for `NavigationDrawerDestination`

## Description

A Material Design [NavigationDrawer] destination.

 Displays an icon with a label, for use in [NavigationDrawer.children].

## Dependencies

- StatelessWidget

## Members

- **backgroundColor**: `Color?`
  The background color of the destination.

 If this is null, no background is set and [NavigationDrawer.backgroundColor] will be visible.

 This is the background color of the whole rectangular area behind the drawer destination.
 To customize only the indicator color consider using [NavigationDrawer.indicatorColor].

- **icon**: `Widget`
  The [Widget] (usually an [Icon]) that's displayed for this
 [NavigationDestination].

 The icon will use [NavigationDrawerThemeData.iconTheme]. If this is
 null, the default [IconThemeData] would use a size of 24.0 and
 [ColorScheme.onSurfaceVariant].

- **selectedIcon**: `Widget?`
  The optional [Widget] (usually an [Icon]) that's displayed when this
 [NavigationDestination] is selected.

 If [selectedIcon] is non-null, the destination will fade from
 [icon] to [selectedIcon] when this destination goes from unselected to
 selected.

 The icon will use [NavigationDrawerThemeData.iconTheme] with
 [WidgetState.selected]. If this is null, the default [IconThemeData]
 would use a size of 24.0 and [ColorScheme.onSecondaryContainer].

- **label**: `Widget`
  The text label that appears on the right of the icon

 The accompanying [Text] widget will use
 [NavigationDrawerThemeData.labelTextStyle]. If this are null, the default
 text style would use [TextTheme.labelLarge] with [ColorScheme.onSurfaceVariant].

- **enabled**: `bool`
  Indicates that this destination is selectable.

 Defaults to true.

## Constructors

### Unnamed Constructor
Creates a navigation drawer destination.

