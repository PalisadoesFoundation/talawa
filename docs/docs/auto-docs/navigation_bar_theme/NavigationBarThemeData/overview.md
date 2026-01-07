# Overview for `NavigationBarThemeData`

## Description

Defines default property values for descendant [NavigationBar]
 widgets.

 Descendant widgets obtain the current [NavigationBarThemeData] object
 using `NavigationBarTheme.of(context)`. Instances of
 [NavigationBarThemeData] can be customized with
 [NavigationBarThemeData.copyWith].

 Typically a [NavigationBarThemeData] is specified as part of the
 overall [Theme] with [ThemeData.navigationBarTheme]. Alternatively, a
 [NavigationBarTheme] inherited widget can be used to theme [NavigationBar]s
 in a subtree of widgets.

 All [NavigationBarThemeData] properties are `null` by default.
 When null, the [NavigationBar] will provide its own defaults based on the
 overall [Theme]'s textTheme and colorScheme. See the individual
 [NavigationBar] properties for details.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **height**: `double?`
  Overrides the default value of [NavigationBar.height].

- **backgroundColor**: `Color?`
  Overrides the default value of [NavigationBar.backgroundColor].

- **elevation**: `double?`
  Overrides the default value of [NavigationBar.elevation].

- **shadowColor**: `Color?`
  Overrides the default value of [NavigationBar.shadowColor].

- **surfaceTintColor**: `Color?`
  Overrides the default value of [NavigationBar.surfaceTintColor].

- **indicatorColor**: `Color?`
  Overrides the default value of [NavigationBar]'s selection indicator.

- **indicatorShape**: `ShapeBorder?`
  Overrides the default shape of the [NavigationBar]'s selection indicator.

- **labelTextStyle**: `MaterialStateProperty<TextStyle?>?`
  The style to merge with the default text style for
 [NavigationDestination] labels.

 You can use this to specify a different style when the label is selected.

- **iconTheme**: `MaterialStateProperty<IconThemeData?>?`
  The theme to merge with the default icon theme for
 [NavigationDestination] icons.

 You can use this to specify a different icon theme when the icon is
 selected.

- **labelBehavior**: `NavigationDestinationLabelBehavior?`
  Overrides the default value of [NavigationBar.labelBehavior].

- **overlayColor**: `MaterialStateProperty<Color?>?`
  Overrides the default value of [NavigationBar.overlayColor].

- **labelPadding**: `EdgeInsetsGeometry?`
  Overrides the default value of [NavigationBar.labelPadding].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.navigationBarTheme] and
 [NavigationBarTheme].

