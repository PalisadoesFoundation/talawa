# Overview for `ListTileThemeData`

## Description

Used with [ListTileTheme] to define default property values for
 descendant [ListTile] widgets, as well as classes that build
 [ListTile]s, like [CheckboxListTile], [RadioListTile], and
 [SwitchListTile].

 Descendant widgets obtain the current [ListTileThemeData] object
 using `ListTileTheme.of(context)`. Instances of
 [ListTileThemeData] can be customized with
 [ListTileThemeData.copyWith].

 A [ListTileThemeData] is often specified as part of the
 overall [Theme] with [ThemeData.listTileTheme].

 All [ListTileThemeData] properties are `null` by default.
 When a theme property is null, the [ListTile] will provide its own
 default based on the overall [Theme]'s textTheme and
 colorScheme. See the individual [ListTile] properties for details.

 The [Drawer] widget specifies a list tile theme for its children that
 defines [style] to be [ListTileStyle.drawer].

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **dense**: `bool?`
  Overrides the default value of [ListTile.dense].

- **shape**: `ShapeBorder?`
  Overrides the default value of [ListTile.shape].

- **style**: `ListTileStyle?`
  Overrides the default value of [ListTile.style].

- **selectedColor**: `Color?`
  Overrides the default value of [ListTile.selectedColor].

- **iconColor**: `Color?`
  Overrides the default value of [ListTile.iconColor].

- **textColor**: `Color?`
  Overrides the default value of [ListTile.textColor].

- **titleTextStyle**: `TextStyle?`
  Overrides the default value of [ListTile.titleTextStyle].

- **subtitleTextStyle**: `TextStyle?`
  Overrides the default value of [ListTile.subtitleTextStyle].

- **leadingAndTrailingTextStyle**: `TextStyle?`
  Overrides the default value of [ListTile.leadingAndTrailingTextStyle].

- **contentPadding**: `EdgeInsetsGeometry?`
  Overrides the default value of [ListTile.contentPadding].

- **tileColor**: `Color?`
  Overrides the default value of [ListTile.tileColor].

- **selectedTileColor**: `Color?`
  Overrides the default value of [ListTile.selectedTileColor].

- **horizontalTitleGap**: `double?`
  Overrides the default value of [ListTile.horizontalTitleGap].

- **minVerticalPadding**: `double?`
  Overrides the default value of [ListTile.minVerticalPadding].

- **minLeadingWidth**: `double?`
  Overrides the default value of [ListTile.minLeadingWidth].

- **minTileHeight**: `double?`
  Overrides the default value of [ListTile.minTileHeight].

- **enableFeedback**: `bool?`
  Overrides the default value of [ListTile.enableFeedback].

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  If specified, overrides the default value of [ListTile.mouseCursor].

- **visualDensity**: `VisualDensity?`
  If specified, overrides the default value of [ListTile.visualDensity].

- **titleAlignment**: `ListTileTitleAlignment?`
  If specified, overrides the default value of [ListTile.titleAlignment].

- **controlAffinity**: `ListTileControlAffinity?`
  If specified, overrides the default value of [CheckboxListTile.controlAffinity]
 or [ExpansionTile.controlAffinity] or [SwitchListTile.controlAffinity] or [RadioListTile.controlAffinity].

- **isThreeLine**: `bool?`
  If specified, overrides the default value of [ListTile.isThreeLine].

## Constructors

### Unnamed Constructor
Creates a [ListTileThemeData].

