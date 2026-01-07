# Overview for `ListTileTheme`

## Description

An inherited widget that defines color and style parameters for [ListTile]s
 in this widget's subtree.

 Values specified here are used for [ListTile] properties that are not given
 an explicit non-null value.

 The [Drawer] widget specifies a tile theme for its children which sets
 [style] to [ListTileStyle.drawer].

## Dependencies

- InheritedTheme

## Members

- **_data**: `ListTileThemeData?`
- **_dense**: `bool?`
- **_shape**: `ShapeBorder?`
- **_style**: `ListTileStyle?`
- **_selectedColor**: `Color?`
- **_iconColor**: `Color?`
- **_textColor**: `Color?`
- **_contentPadding**: `EdgeInsetsGeometry?`
- **_tileColor**: `Color?`
- **_selectedTileColor**: `Color?`
- **_horizontalTitleGap**: `double?`
- **_minVerticalPadding**: `double?`
- **_minLeadingWidth**: `double?`
- **_enableFeedback**: `bool?`
- **_mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
- **_controlAffinity**: `ListTileControlAffinity?`
## Constructors

### Unnamed Constructor
Creates a list tile theme that defines the color and style parameters for
 descendant [ListTile]s.

 Only the [data] parameter should be used. The other parameters are
 redundant (are now obsolete) and will be deprecated in a future update.

