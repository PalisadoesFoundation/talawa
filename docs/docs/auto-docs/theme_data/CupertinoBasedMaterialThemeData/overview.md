# Overview for `CupertinoBasedMaterialThemeData`

## Description

A class for creating a Material theme with a color scheme based off of the
 colors from a [CupertinoThemeData]. This is intended to be used only in the
 case when a Material widget is unable to find a Material theme in the tree,
 but is able to find a Cupertino theme. Most often this will occur when a
 Material widget is used inside of a [CupertinoApp].

 Besides the colors, this theme will use all the defaults from Material's
 [ThemeData], so if further customization is needed, it is best to manually
 add a Material [Theme] above the [CupertinoApp].

## Members

- **materialTheme**: `ThemeData`
  The Material theme data with colors based on an existing [CupertinoThemeData].

## Constructors

### Unnamed Constructor
Creates a Material theme with a color scheme based off of the colors from
 a [CupertinoThemeData].

