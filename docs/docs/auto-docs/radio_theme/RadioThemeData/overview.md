# Overview for `RadioThemeData`

## Description

Defines default property values for descendant [Radio] widgets.

 Descendant widgets obtain the current [RadioThemeData] object using
 `RadioTheme.of(context)`. Instances of [RadioThemeData] can be customized
 with [RadioThemeData.copyWith].

 Typically a [RadioThemeData] is specified as part of the overall [Theme]
 with [ThemeData.radioTheme].

 All [RadioThemeData] properties are `null` by default. When null, the
 [Radio] will use the values from [ThemeData] if they exist, otherwise it
 will provide its own defaults based on the overall [Theme]'s colorScheme.
 See the individual [Radio] properties for details.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.
  * [RadioTheme], which is used by descendants to obtain the
    [RadioThemeData].

## Dependencies

- Diagnosticable

## Members

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  

 If specified, overrides the default value of [Radio.mouseCursor]. The
 default value is [WidgetStateMouseCursor.clickable].

- **fillColor**: `MaterialStateProperty<Color?>?`
  

 If specified, overrides the default value of [Radio.fillColor].

- **overlayColor**: `MaterialStateProperty<Color?>?`
  

 If specified, overrides the default value of [Radio.overlayColor].

- **splashRadius**: `double?`
  

 If specified, overrides the default value of [Radio.splashRadius]. The
 default value is [kRadialReactionRadius].

- **materialTapTargetSize**: `MaterialTapTargetSize?`
  

 If specified, overrides the default value of
 [Radio.materialTapTargetSize]. The default value is the value of
 [ThemeData.materialTapTargetSize].

- **visualDensity**: `VisualDensity?`
  

 If specified, overrides the default value of [Radio.visualDensity]. The
 default value is the value of [ThemeData.visualDensity].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [ThemeData.radioTheme].

