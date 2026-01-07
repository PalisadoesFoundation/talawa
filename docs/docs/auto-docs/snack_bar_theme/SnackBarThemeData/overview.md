# Overview for `SnackBarThemeData`

## Description

Customizes default property values for [SnackBar] widgets.

 Descendant widgets obtain the current [SnackBarThemeData] object using
 `Theme.of(context).snackBarTheme`. Instances of [SnackBarThemeData] can be
 customized with [SnackBarThemeData.copyWith].

 Typically a [SnackBarThemeData] is specified as part of the overall [Theme]
 with [ThemeData.snackBarTheme]. The default for [ThemeData.snackBarTheme]
 provides all `null` properties.

 All [SnackBarThemeData] properties are `null` by default. When null, the
 [SnackBar] will provide its own defaults.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  Overrides the default value for [SnackBar.backgroundColor].

 If null, [SnackBar] defaults to dark grey: `Color(0xFF323232)`.

- **actionTextColor**: `Color?`
  Overrides the default value for [SnackBarAction.textColor].

 If null, [SnackBarAction] defaults to [ColorScheme.secondary] of
 [ThemeData.colorScheme].

- **disabledActionTextColor**: `Color?`
  Overrides the default value for [SnackBarAction.disabledTextColor].

 If null, [SnackBarAction] defaults to [ColorScheme.onSurface] with its
 opacity set to 0.30 if the [Theme]'s brightness is [Brightness.dark], 0.38
 otherwise.

- **contentTextStyle**: `TextStyle?`
  Used to configure the [DefaultTextStyle] for the [SnackBar.content] widget.

 If null, [SnackBar] defines its default.

- **elevation**: `double?`
  Overrides the default value for [SnackBar.elevation].

 If null, [SnackBar] uses a default of 6.0.

- **shape**: `ShapeBorder?`
  Overrides the default value for [SnackBar.shape].

 If null, [SnackBar] provides different defaults depending on the
 [SnackBarBehavior]. For [SnackBarBehavior.fixed], no overriding shape is
 specified, so the [SnackBar] is rectangular. For
 [SnackBarBehavior.floating], it uses a [RoundedRectangleBorder] with a
 circular corner radius of 4.0.

- **behavior**: `SnackBarBehavior?`
  Overrides the default value for [SnackBar.behavior].

 If null, [SnackBar] will default to [SnackBarBehavior.fixed].

- **width**: `double?`
  Overrides the default value for [SnackBar.width].

 If this property is null, then the snack bar will take up the full device
 width less the margin. This value is only used when [behavior] is
 [SnackBarBehavior.floating].

- **insetPadding**: `EdgeInsets?`
  Overrides the default value for [SnackBar.margin].

 This value is only used when [behavior] is [SnackBarBehavior.floating].

- **showCloseIcon**: `bool?`
  Overrides the default value for [SnackBar.showCloseIcon].

 Whether to show an optional "Close" icon.

- **closeIconColor**: `Color?`
  Overrides the default value for [SnackBar.closeIconColor].

 This value is only used if [showCloseIcon] is true.

- **actionOverflowThreshold**: `double?`
  Overrides the default value for [SnackBar.actionOverflowThreshold].

 Must be a value between 0 and 1, if present.

- **actionBackgroundColor**: `Color?`
  Overrides default value for [SnackBarAction.backgroundColor].

 If null, [SnackBarAction] falls back to [Colors.transparent].

- **disabledActionBackgroundColor**: `Color?`
  Overrides default value for [SnackBarAction.disabledBackgroundColor].

 If null, [SnackBarAction] falls back to [Colors.transparent].

- **dismissDirection**: `DismissDirection?`
  Overrides the default value for [SnackBar.dismissDirection].

 If null, [SnackBar] will default to [DismissDirection.down].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.snackBarTheme].

 The [elevation] must be null or non-negative.

