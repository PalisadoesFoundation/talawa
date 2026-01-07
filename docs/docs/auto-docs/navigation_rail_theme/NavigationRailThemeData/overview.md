# Overview for `NavigationRailThemeData`

## Description

Defines default property values for descendant [NavigationRail]
 widgets.

 Descendant widgets obtain the current [NavigationRailThemeData] object
 using `NavigationRailTheme.of(context)`. Instances of
 [NavigationRailThemeData] can be customized with
 [NavigationRailThemeData.copyWith].

 Typically a [NavigationRailThemeData] is specified as part of the
 overall [Theme] with [ThemeData.navigationRailTheme].

 All [NavigationRailThemeData] properties are `null` by default.
 When null, the [NavigationRail] will use the values from [ThemeData]
 if they exist, otherwise it will provide its own defaults based on the
 overall [Theme]'s textTheme and colorScheme. See the individual
 [NavigationRail] properties for details.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  Color to be used for the [NavigationRail]'s background.

- **elevation**: `double?`
  The z-coordinate to be used for the [NavigationRail]'s elevation.

- **unselectedLabelTextStyle**: `TextStyle?`
  The style to merge with the default text style for
 [NavigationRailDestination] labels, when the destination is not selected.

- **selectedLabelTextStyle**: `TextStyle?`
  The style to merge with the default text style for
 [NavigationRailDestination] labels, when the destination is selected.

- **unselectedIconTheme**: `IconThemeData?`
  The theme to merge with the default icon theme for
 [NavigationRailDestination] icons, when the destination is not selected.

- **selectedIconTheme**: `IconThemeData?`
  The theme to merge with the default icon theme for
 [NavigationRailDestination] icons, when the destination is selected.

- **groupAlignment**: `double?`
  The alignment for the [NavigationRailDestination]s as they are positioned
 within the [NavigationRail].

- **labelType**: `NavigationRailLabelType?`
  The type that defines the layout and behavior of the labels in the
 [NavigationRail].

- **useIndicator**: `bool?`
  Whether or not the selected [NavigationRailDestination] should include a
 [NavigationIndicator].

- **indicatorColor**: `Color?`
  Overrides the default value of [NavigationRail]'s selection indicator color,
 when [useIndicator] is true.

- **indicatorShape**: `ShapeBorder?`
  Overrides the default shape of the [NavigationRail]'s selection indicator.

- **minWidth**: `double?`
  Overrides the default value of [NavigationRail]'s minimum width when it
 is not extended.

- **minExtendedWidth**: `double?`
  Overrides the default value of [NavigationRail]'s minimum width when it
 is extended.

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.navigationRailTheme].

