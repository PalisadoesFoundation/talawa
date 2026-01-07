# Overview for `MaterialBannerThemeData`

## Description

Defines the visual properties of [MaterialBanner] widgets.

 Descendant widgets obtain the current [MaterialBannerThemeData] object using
 `MaterialBannerTheme.of(context)`. Instances of [MaterialBannerThemeData]
 can be customized with [MaterialBannerThemeData.copyWith].

 Typically a [MaterialBannerThemeData] is specified as part of the overall
 [Theme] with [ThemeData.bannerTheme].

 All [MaterialBannerThemeData] properties are `null` by default. When null,
 the [MaterialBanner] will provide its own defaults.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  The background color of a [MaterialBanner].

- **surfaceTintColor**: `Color?`
  Overrides the default value of [MaterialBanner.surfaceTintColor].

- **shadowColor**: `Color?`
  Overrides the default value of [MaterialBanner.shadowColor].

- **dividerColor**: `Color?`
  Overrides the default value of [MaterialBanner.dividerColor].

- **contentTextStyle**: `TextStyle?`
  Used to configure the [DefaultTextStyle] for the [MaterialBanner.content]
 widget.

- **elevation**: `double?`
  Default value for [MaterialBanner.elevation].

- **padding**: `EdgeInsetsGeometry?`
  The amount of space by which to inset [MaterialBanner.content].

- **leadingPadding**: `EdgeInsetsGeometry?`
  The amount of space by which to inset [MaterialBanner.leading].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for [MaterialBannerTheme] or
 [ThemeData.bannerTheme].

