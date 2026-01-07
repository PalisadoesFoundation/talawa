# Overview for `NavigationDrawerThemeData`

## Description

Defines default property values for descendant [NavigationDrawer]
 widgets.

 Descendant widgets obtain the current [NavigationDrawerThemeData] object
 using `NavigationDrawerTheme.of(context)`. Instances of
 [NavigationDrawerThemeData] can be customized with
 [NavigationDrawerThemeData.copyWith].

 Typically a [NavigationDrawerThemeData] is specified as part of the
 overall [Theme] with [ThemeData.navigationDrawerTheme]. Alternatively, a
 [NavigationDrawerTheme] inherited widget can be used to theme [NavigationDrawer]s
 in a subtree of widgets.

 All [NavigationDrawerThemeData] properties are `null` by default.
 When null, the [NavigationDrawer] will provide its own defaults based on the
 overall [Theme]'s textTheme and colorScheme. See the individual
 [NavigationDrawer] properties for details.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **tileHeight**: `double?`
  Overrides the default height of [NavigationDrawerDestination].

- **backgroundColor**: `Color?`
  Overrides the default value of [NavigationDrawer.backgroundColor].

- **elevation**: `double?`
  Overrides the default value of [NavigationDrawer.elevation].

- **shadowColor**: `Color?`
  Overrides the default value of [NavigationDrawer.shadowColor].

- **surfaceTintColor**: `Color?`
  Overrides the default value of [NavigationDrawer.surfaceTintColor].

- **indicatorColor**: `Color?`
  Overrides the default value of [NavigationDrawer]'s selection indicator.

- **indicatorShape**: `ShapeBorder?`
  Overrides the default shape of the [NavigationDrawer]'s selection indicator.

- **indicatorSize**: `Size?`
  Overrides the default size of the [NavigationDrawer]'s selection indicator.

- **labelTextStyle**: `MaterialStateProperty<TextStyle?>?`
  The style to merge with the default text style for
 [NavigationDestination] labels.

 You can use this to specify a different style when the label is selected.

- **iconTheme**: `MaterialStateProperty<IconThemeData?>?`
  The theme to merge with the default icon theme for
 [NavigationDestination] icons.

 You can use this to specify a different icon theme when the icon is
 selected.

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.navigationDrawerTheme] and
 [NavigationDrawerTheme].

