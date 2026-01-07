# Overview for `MaterialBanner`

## Description

A Material Design banner.

 A banner displays an important, succinct message, and provides actions for
 users to address (or dismiss the banner). A user action is required for it
 to be dismissed.

 Banners should be displayed at the top of the screen, below a top app bar.
 They are persistent and non-modal, allowing the user to either ignore them or
 interact with them at any time.

 
 Banners placed directly into the widget tree are static.

 ** See code in examples/api/lib/material/banner/material_banner.0.dart **
 

 
 MaterialBanner's can also be presented through a [ScaffoldMessenger].
 Here is an example where ScaffoldMessengerState. is used to show the MaterialBanner.

 ** See code in examples/api/lib/material/banner/material_banner.1.dart **
 

 The [actions] will be placed beside the [content] if there is only one.
 Otherwise, the [actions] will be placed below the [content]. Use
 [forceActionsBelow] to override this behavior.

 If the [actions] placed below the [content], they will be laid out in a row.
 If there isn't sufficient room to display everything, they are laid out
 in a column instead.

 The [actions] and [content] must be provided. An optional leading widget
 (typically an [Image]) can also be provided. The [contentTextStyle] and
 [backgroundColor] can be provided to customize the banner.

 This widget is unrelated to the widgets library [Banner] widget.

## Dependencies

- StatefulWidget

## Members

- **content**: `Widget`
  The content of the [MaterialBanner].

 Typically a [Text] widget.

- **contentTextStyle**: `TextStyle?`
  Style for the text in the [content] of the [MaterialBanner].

 If `null`, [MaterialBannerThemeData.contentTextStyle] is used. If that is
 also `null`, [TextTheme.bodyMedium] of [ThemeData.textTheme] is used.

- **actions**: `List&lt;Widget&gt;`
  The set of actions that are displayed at the bottom or trailing side of
 the [MaterialBanner].

 Typically this is a list of [TextButton] widgets.

- **elevation**: `double?`
  The z-coordinate at which to place the material banner.

 This controls the size of the shadow below the material banner.

 Defines the banner's [Material.elevation].

 If this property is null, then [MaterialBannerThemeData.elevation] of
 [ThemeData.bannerTheme] is used, if that is also null, the default value is 0.
 If the elevation is 0, the [Scaffold]'s body will be pushed down by the
 MaterialBanner when used with [ScaffoldMessenger].

- **leading**: `Widget?`
  The (optional) leading widget of the [MaterialBanner].

 Typically an [Icon] widget.

- **minActionBarHeight**: `double`
  The optional minimum action bar height.

 Default to 52.0.

- **backgroundColor**: `Color?`
  The color of the surface of this [MaterialBanner].

 If `null`, [MaterialBannerThemeData.backgroundColor] is used. If that is
 also `null`, [ColorScheme.surfaceContainerLow] of [ThemeData.colorScheme] is used.

- **surfaceTintColor**: `Color?`
  The color used as an overlay on [backgroundColor] to indicate elevation.

 If null, [MaterialBannerThemeData.surfaceTintColor] is used. If that
 is also null, the default value is [Colors.transparent].

 This is not recommended for use. [Material 3 spec](https://m3.material.io/styles/color/the-color-system/color-roles)
 introduced a set of tone-based surfaces and surface containers in its [ColorScheme],
 which provide more flexibility. The intention is to eventually remove surface tint color from
 the framework.

- **shadowColor**: `Color?`
  The color of the shadow below the [MaterialBanner].

 If this property is null, then [MaterialBannerThemeData.shadowColor] of
 [ThemeData.bannerTheme] is used. If that is also null, the default value
 is null.

- **dividerColor**: `Color?`
  The color of the divider.

 If this property is null, then [MaterialBannerThemeData.dividerColor] of
 [ThemeData.bannerTheme] is used. If that is also null, the default value
 is [ColorScheme.surfaceVariant].

- **padding**: `EdgeInsetsGeometry?`
  The amount of space by which to inset the [content].

 If the [actions] are below the [content], this defaults to
 `EdgeInsetsDirectional.only(start: 16.0, top: 24.0, end: 16.0, bottom: 4.0)`.

 If the [actions] are trailing the [content], this defaults to
 `EdgeInsetsDirectional.only(start: 16.0, top: 2.0)`.

- **margin**: `EdgeInsetsGeometry?`
  Empty space to surround the [MaterialBanner].

 If the [margin] is null then this defaults to
 0 if the banner's [elevation] is 0, 10 otherwise.

- **leadingPadding**: `EdgeInsetsGeometry?`
  The amount of space by which to inset the [leading] widget.

 This defaults to `EdgeInsetsDirectional.only(end: 16.0)`.

- **forceActionsBelow**: `bool`
  An override to force the [actions] to be below the [content] regardless of
 how many there are.

 If this is true, the [actions] will be placed below the [content]. If
 this is false, the [actions] will be placed on the trailing side of the
 [content] if [actions]'s length is 1 and below the [content] if greater
 than 1.

 Defaults to false.

- **overflowAlignment**: `OverflowBarAlignment`
  The horizontal alignment of the [actions] when the [actions] laid out in a column.

 Defaults to [OverflowBarAlignment.end].

- **animation**: `Animation&lt;double&gt;?`
  The animation driving the entrance and exit of the material banner when presented by the [ScaffoldMessenger].

- **onVisible**: `VoidCallback?`
  Called the first time that the material banner is visible within a [Scaffold] when presented by the [ScaffoldMessenger].

## Constructors

### Unnamed Constructor
Creates a [MaterialBanner].

 The length of the [actions] list must not be empty. The [elevation] must
 be null or non-negative.

