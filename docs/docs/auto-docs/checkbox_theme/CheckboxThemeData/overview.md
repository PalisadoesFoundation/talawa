# Overview for `CheckboxThemeData`

## Description

Defines default property values for descendant [Checkbox] widgets.

 Descendant widgets obtain the current [CheckboxThemeData] object using
 `CheckboxTheme.of(context)`. Instances of [CheckboxThemeData] can be
 customized with [CheckboxThemeData.copyWith].

 Typically a [CheckboxThemeData] is specified as part of the overall [Theme]
 with [ThemeData.checkboxTheme].

 All [CheckboxThemeData] properties are `null` by default. When null, the
 [Checkbox] will use the values from [ThemeData] if they exist, otherwise it
 will provide its own defaults based on the overall [Theme]'s colorScheme.
 See the individual [Checkbox] properties for details.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  

 If specified, overrides the default value of [Checkbox.mouseCursor].

- **fillColor**: `MaterialStateProperty<Color?>?`
  

 If specified, overrides the default value of [Checkbox.fillColor].

- **checkColor**: `MaterialStateProperty<Color?>?`
  

 Resolves in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 If specified, overrides the default value of [Checkbox.checkColor].

- **overlayColor**: `MaterialStateProperty<Color?>?`
  

 If specified, overrides the default value of [Checkbox.overlayColor].

- **splashRadius**: `double?`
  

 If specified, overrides the default value of [Checkbox.splashRadius].

- **materialTapTargetSize**: `MaterialTapTargetSize?`
  

 If specified, overrides the default value of
 [Checkbox.materialTapTargetSize].

- **visualDensity**: `VisualDensity?`
  

 If specified, overrides the default value of [Checkbox.visualDensity].

- **shape**: `OutlinedBorder?`
  

 If specified, overrides the default value of [Checkbox.shape].

- **side**: `BorderSide?`
  

 If specified, overrides the default value of [Checkbox.side].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.checkboxTheme].

