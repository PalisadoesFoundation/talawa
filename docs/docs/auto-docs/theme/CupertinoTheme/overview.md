# Overview for `CupertinoTheme`

## Description

Applies a visual styling theme to descendant Cupertino widgets.

 Affects the color and text styles of Cupertino widgets whose styling
 are not overridden when constructing the respective widgets instances.

 Descendant widgets can retrieve the current [CupertinoThemeData] by calling
 [CupertinoTheme.of]. An [InheritedWidget] dependency is created when
 an ancestor [CupertinoThemeData] is retrieved via [CupertinoTheme.of].

 The [CupertinoTheme] widget implies an [IconTheme] widget, whose
 [IconTheme.data] has the same color as [CupertinoThemeData.primaryColor]

 See also:

  * [CupertinoThemeData], specifies the theme's visual styling.
  * [CupertinoApp], which will automatically add a [CupertinoTheme] based on the
    value of [CupertinoApp.theme].
  * [Theme], a Material theme which will automatically add a [CupertinoTheme]
    with a [CupertinoThemeData] derived from the Material [ThemeData].

## Dependencies

- StatelessWidget

## Members

- **data**: `CupertinoThemeData`
  The [CupertinoThemeData] styling for this theme.

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a [CupertinoTheme] to change descendant Cupertino widgets' styling.

