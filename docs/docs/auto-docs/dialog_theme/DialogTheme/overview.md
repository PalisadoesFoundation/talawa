# Overview for `DialogTheme`

## Description

Defines a theme for [Dialog] widgets.

 Descendant widgets obtain the current [DialogTheme] object using
 `DialogTheme.of(context)`. Instances of [DialogTheme] can be customized with
 [DialogTheme.copyWith].

 [titleTextStyle] and [contentTextStyle] are used in [AlertDialog]s and [SimpleDialog]s.

 See also:

  * [Dialog], a dialog that can be customized using this [DialogTheme].
  * [AlertDialog], a dialog that can be customized using this [DialogTheme].
  * [SimpleDialog], a dialog that can be customized using this [DialogTheme].
  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- InheritedTheme, Diagnosticable

## Members

- **_data**: `DialogThemeData?`
- **_backgroundColor**: `Color?`
- **_elevation**: `double?`
- **_shadowColor**: `Color?`
- **_surfaceTintColor**: `Color?`
- **_shape**: `ShapeBorder?`
- **_alignment**: `AlignmentGeometry?`
- **_titleTextStyle**: `TextStyle?`
- **_contentTextStyle**: `TextStyle?`
- **_actionsPadding**: `EdgeInsetsGeometry?`
- **_iconColor**: `Color?`
- **_barrierColor**: `Color?`
- **_insetPadding**: `EdgeInsets?`
- **_clipBehavior**: `Clip?`
## Constructors

### Unnamed Constructor
Creates a dialog theme that can be used for [ThemeData.dialogTheme].

