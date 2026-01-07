# Overview for `DialogThemeData`

## Description

Defines default property values for descendant [Dialog] widgets.

 Descendant widgets obtain the current [DialogThemeData] object using
 `CardTheme.of(context).data`. Instances of [DialogThemeData] can be
 customized with [DialogThemeData.copyWith].

 Typically a [DialogThemeData] is specified as part of the overall [Theme]
 with [ThemeData.dialogTheme].

 All [DialogThemeData] properties are `null` by default. When null, the [Dialog]
 will use the values from [ThemeData] if they exist, otherwise it will
 provide its own defaults. See the individual [Dialog] properties for details.

 See also:

  * [Dialog], a dialog that can be customized using this [DialogTheme].
  * [AlertDialog], a dialog that can be customized using this [DialogTheme].
  * [SimpleDialog], a dialog that can be customized using this [DialogTheme].
  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  Overrides the default value for [Dialog.backgroundColor].

- **elevation**: `double?`
  Overrides the default value for [Dialog.elevation].

- **shadowColor**: `Color?`
  Overrides the default value for [Dialog.shadowColor].

- **surfaceTintColor**: `Color?`
  Overrides the default value for [Dialog.surfaceTintColor].

- **shape**: `ShapeBorder?`
  Overrides the default value for [Dialog.shape].

- **alignment**: `AlignmentGeometry?`
  Overrides the default value for [Dialog.alignment].

- **titleTextStyle**: `TextStyle?`
  Overrides the default value for [DefaultTextStyle] for [SimpleDialog.title] and
 [AlertDialog.title].

- **contentTextStyle**: `TextStyle?`
  Overrides the default value for [DefaultTextStyle] for [SimpleDialog.children] and
 [AlertDialog.content].

- **actionsPadding**: `EdgeInsetsGeometry?`
  Overrides the default value for [AlertDialog.actionsPadding].

- **iconColor**: `Color?`
  Used to configure the [IconTheme] for the [AlertDialog.icon] widget.

- **barrierColor**: `Color?`
  Overrides the default value for [barrierColor] in [showDialog].

- **insetPadding**: `EdgeInsets?`
  Overrides the default value for [Dialog.insetPadding].

- **clipBehavior**: `Clip?`
  Overrides the default value of [Dialog.clipBehavior].

## Constructors

### Unnamed Constructor
Creates a dialog theme that can be used for [ThemeData.dialogTheme].

