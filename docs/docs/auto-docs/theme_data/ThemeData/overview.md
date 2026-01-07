# Overview for `ThemeData`

## Description

Defines the configuration of the overall visual [Theme] for a [MaterialApp]
 or a widget subtree within the app.

 The [MaterialApp] theme property can be used to configure the appearance
 of the entire app. Widget subtrees within an app can override the app's
 theme by including a [Theme] widget at the top of the subtree.

 Widgets whose appearance should align with the overall theme can obtain the
 current theme's configuration with [Theme.of]. Material components typically
 depend exclusively on the [colorScheme] and [textTheme]. These properties
 are guaranteed to have non-null values.

 The static [Theme.of] method finds the [ThemeData] value specified for the
 nearest [BuildContext] ancestor. This lookup is inexpensive, essentially
 just a single HashMap access. It can sometimes be a little confusing
 because [Theme.of] can not see a [Theme] widget that is defined in the
 current build method's context. To overcome that, create a new custom widget
 for the subtree that appears below the new [Theme], or insert a widget
 that creates a new BuildContext, like [Builder].

 
 This example demonstrates how a typical [MaterialApp] specifies
 and uses a custom [Theme]. The theme's [ColorScheme] is based on a
 single "seed" color and configures itself to match the platform's
 current light or dark color configuration. The theme overrides the
 default configuration of [FloatingActionButton] to show how to
 customize the appearance a class of components.

 ** See code in examples/api/lib/material/theme_data/theme_data.0.dart **
 

 See <https://material.io/design/color/> for
 more discussion on how to pick the right colors.

## Dependencies

- Diagnosticable

## Members

- **applyElevationOverlayColor**: `bool`
  Apply a semi-transparent overlay color on Material surfaces to indicate
 elevation for dark themes.

 If [useMaterial3] is true, then this flag is ignored as there is a new
 [Material.surfaceTintColor] used to create an overlay for Material 3.
 This flag is meant only for the Material 2 elevation overlay for dark
 themes.

 Material drop shadows can be difficult to see in a dark theme, so the
 elevation of a surface should be portrayed with an "overlay" in addition
 to the shadow. As the elevation of the component increases, the
 overlay increases in opacity. [applyElevationOverlayColor] turns the
 application of this overlay on or off for dark themes.

 If true and [brightness] is [Brightness.dark], a
 semi-transparent version of [ColorScheme.onSurface] will be
 applied on top of [Material] widgets that have a [ColorScheme.surface]
 color. The level of transparency is based on [Material.elevation] as
 per the Material Dark theme specification.

 If false the surface color will be used unmodified.

 Defaults to false in order to maintain backwards compatibility with
 apps that were built before the Material Dark theme specification
 was published. New apps should set this to true for any themes
 where [brightness] is [Brightness.dark].

 See also:

  * [Material.elevation], which effects the level of transparency of the
    overlay color.
  * [ElevationOverlay.applyOverlay], which is used by [Material] to apply
    the overlay color to its surface color.
  * <https://material.io/design/color/dark-theme.html>, which specifies how
    the overlay should be applied.

- **cupertinoOverrideTheme**: `NoDefaultCupertinoThemeData?`
  Components of the [CupertinoThemeData] to override from the Material
 [ThemeData] adaptation.

 By default, [cupertinoOverrideTheme] is null and Cupertino widgets
 descendant to the Material [Theme] will adhere to a [CupertinoTheme]
 derived from the Material [ThemeData]. e.g. [ThemeData]'s [ColorScheme]
 will also inform the [CupertinoThemeData]'s `primaryColor` etc.

 This cascading effect for individual attributes of the [CupertinoThemeData]
 can be overridden using attributes of this [cupertinoOverrideTheme].

- **extensions**: `Map&lt;Object, ThemeExtension&lt;dynamic&gt;&gt;`
  Arbitrary additions to this theme.

 To define extensions, pass an [Iterable] containing one or more [ThemeExtension]
 subclasses to [ThemeData.new] or [copyWith].

 To obtain an extension, use [extension].

 
 This sample shows how to create and use a subclass of [ThemeExtension] that
 defines two colors.

 ** See code in examples/api/lib/material/theme/theme_extension.1.dart **
 

 See also:

 * [extension], a convenience function for obtaining a specific extension.

- **adaptationMap**: `Map&lt;Type, Adaptation&lt;Object&gt;&gt;`
  A map which contains the adaptations for the theme. The entry's key is the
 type of the adaptation; the value is the adaptation itself.

 To obtain an adaptation, use [getAdaptation].

- **inputDecorationTheme**: `InputDecorationTheme`
  The default [InputDecoration] values for [InputDecorator], [TextField],
 and [TextFormField] are based on this theme.

 See [InputDecoration.applyDefaults].

- **materialTapTargetSize**: `MaterialTapTargetSize`
  Configures the hit test size of certain Material widgets.

 Defaults to a [platform]-appropriate size: [MaterialTapTargetSize.padded]
 on mobile platforms, [MaterialTapTargetSize.shrinkWrap] on desktop
 platforms.

- **pageTransitionsTheme**: `PageTransitionsTheme`
  Default [MaterialPageRoute] transitions per [TargetPlatform].

 [MaterialPageRoute.buildTransitions] delegates to a [platform] specific
 [PageTransitionsBuilder]. If a matching builder is not found, a builder
 whose platform is null is used.

- **platform**: `TargetPlatform`
  The platform the material widgets should adapt to target.

 Defaults to the current platform, as exposed by [defaultTargetPlatform].
 This should be used in order to style UI elements according to platform
 conventions.

 Widgets from the material library should use this getter (via [Theme.of])
 to determine the current platform for the purpose of emulating the
 platform behavior (e.g. scrolling or haptic effects). Widgets and render
 objects at lower layers that try to emulate the underlying platform
 can depend on [defaultTargetPlatform] directly, or may require
 that the target platform be provided as an argument. The
 [dart:io.Platform] object should only be used directly when it's critical
 to actually know the current platform, without any overrides possible (for
 example, when a system API is about to be called).

 In a test environment, the platform returned is [TargetPlatform.android]
 regardless of the host platform. (Android was chosen because the tests
 were originally written assuming Android-like behavior, and we added
 platform adaptations for other platforms later). Tests can check behavior
 for other platforms by setting the [platform] of the [Theme] explicitly to
 another [TargetPlatform] value, or by setting
 [debugDefaultTargetPlatformOverride].

 Determines the defaults for [typography] and [materialTapTargetSize].

- **scrollbarTheme**: `ScrollbarThemeData`
  A theme for customizing the colors, thickness, and shape of [Scrollbar]s.

- **splashFactory**: `InteractiveInkFeatureFactory`
  Defines the appearance of ink splashes produces by [InkWell]
 and [InkResponse].

 See also:

  * [InkSplash.splashFactory], which defines the default splash.
  * [InkRipple.splashFactory], which defines a splash that spreads out
    more aggressively than the default.
  * [InkSparkle.splashFactory], which defines a more aggressive and organic
    splash with sparkle effects.

- **useMaterial3**: `bool`
  A temporary flag that can be used to opt-out of Material 3 features.

 This flag is _true_ by default. If false, then components will
 continue to use the colors, typography and other features of
 Material 2.

 In the long run this flag will be deprecated and eventually
 only Material 3 will be supported. We recommend that applications
 migrate to Material 3 as soon as that's practical. Until that migration
 is complete, this flag can be set to false.

 ## Defaults

 If a [ThemeData] is _constructed_ with [useMaterial3] set to true, then
 some properties will get updated defaults. However, the
 [ThemeData.copyWith] method with [useMaterial3] set to true will _not_
 change any of these properties in the resulting [ThemeData].

 <style>table,td,th  td </style>

 | Property        | Material 3 default             | Material 2 default             |
 | :-------------- | :----------------------------- | :----------------------------- |
 | [colorScheme]   | M3 baseline light color scheme | M2 baseline light color scheme |
 | [typography]    | [Typography.material2021]      | [Typography.material2014]      |
 | [splashFactory] | [InkSparkle]* or [InkRipple]   | [InkSplash]                    |

 \* if the target platform is Android and the app is not
 running on the web, otherwise it will fallback to [InkRipple].

 If [brightness] is [Brightness.dark] then the default color scheme will
 be either the M3 baseline dark color scheme or the M2 baseline dark color
 scheme depending on [useMaterial3].

 ## Affected widgets

 This flag affects styles and components.

 ### Styles
   * Color: [ColorScheme], [Material] (see table above)
   * Shape: (see components below)
   * Typography: [Typography] (see table above)

 ### Components
   * Badges: [Badge]
   * Bottom app bar: [BottomAppBar]
   * Bottom sheets: [BottomSheet]
   * Buttons
     - Common buttons: [ElevatedButton], [FilledButton], [FilledButton.tonal], [OutlinedButton], [TextButton]
     - FAB: [FloatingActionButton], [FloatingActionButton.extended]
     - Icon buttons: [IconButton], [IconButton.filled] (*new*), [IconButton.filledTonal], [IconButton.outlined]
     - Segmented buttons: [SegmentedButton] (replacing [ToggleButtons])
   * Cards: [Card]
   * Checkbox: [Checkbox], [CheckboxListTile]
   * Chips:
     - [ActionChip] (used for Assist and Suggestion chips),
     - [FilterChip], [ChoiceChip] (used for single selection filter chips),
     - [InputChip]
   * Date pickers: [showDatePicker], [showDateRangePicker], [DatePickerDialog], [DateRangePickerDialog], [InputDatePickerFormField]
   * Dialogs: [AlertDialog], [Dialog.fullscreen]
   * Divider: [Divider], [VerticalDivider]
   * Lists: [ListTile]
   * Menus: [MenuAnchor], [DropdownMenu], [MenuBar]
   * Navigation bar: [NavigationBar] (replacing [BottomNavigationBar])
   * Navigation drawer: [NavigationDrawer] (replacing [Drawer])
   * Navigation rail: [NavigationRail]
   * Progress indicators: [CircularProgressIndicator], [LinearProgressIndicator]
   * Radio button: [Radio], [RadioListTile]
   * Search: [SearchBar], [SearchAnchor],
   * Snack bar: [SnackBar]
   * Slider: [Slider], [RangeSlider]
   * Switch: [Switch], [SwitchListTile]
   * Tabs: [TabBar], [TabBar.secondary]
   * TextFields: [TextField] together with its [InputDecoration]
   * Time pickers: [showTimePicker], [TimePickerDialog]
   * Top app bar: [AppBar], [SliverAppBar], [SliverAppBar.medium], [SliverAppBar.large]

 In addition, this flag enables features introduced in Android 12.
   * Stretch overscroll: [MaterialScrollBehavior]
   * Ripple: `splashFactory` (see table above)

 See also:

   * [Material 3 specification](https://m3.material.io/).

- **visualDensity**: `VisualDensity`
  The density value for specifying the compactness of various UI components.

 
 Density, in the context of a UI, is the vertical and horizontal
 "compactness" of the elements in the UI. It is unitless, since it means
 different things to different UI elements. For buttons, it affects the
 spacing around the centered label of the button. For lists, it affects the
 distance between baselines of entries in the list.

 Typically, density values are integral, but any value in range may be
 used. The range includes values from [VisualDensity.minimumDensity] (which
 is -4), to [VisualDensity.maximumDensity] (which is 4), inclusive, where
 negative values indicate a denser, more compact, UI, and positive values
 indicate a less dense, more expanded, UI. If a component doesn't support
 the value given, it will clamp to the nearest supported value.

 The default for visual densities is zero for both vertical and horizontal
 densities, which corresponds to the default visual density of components
 in the Material Design specification.

 As a rule of thumb, a change of 1 or -1 in density corresponds to 4
 logical pixels. However, this is not a strict relationship since
 components interpret the density values appropriately for their needs.

 A larger value translates to a spacing increase (less dense), and a
 smaller value translates to a spacing decrease (more dense).

 In Material Design 3, the [visualDensity] does not override the default
 visual for the following components which are set to [VisualDensity.standard]
 for all platforms:

  * [IconButton] - To override the default value of [IconButton.visualDensity],
    use [ThemeData.iconButtonTheme] instead.
  * [Checkbox] - To override the default value of [Checkbox.visualDensity],
    use [ThemeData.checkboxTheme] instead.
 

- **canvasColor**: `Color`
  The default color of [MaterialType.canvas] [Material].

- **cardColor**: `Color`
  The color of [Material] when it is used as a [Card].

- **colorScheme**: `ColorScheme`
  

 This property was added much later than the theme's set of highly specific
 colors, like [cardColor], [canvasColor] etc. New components can be defined
 exclusively in terms of [colorScheme]. Existing components will gradually
 migrate to it, to the extent that is possible without significant
 backwards compatibility breaks.

- **disabledColor**: `Color`
  The color used for widgets that are inoperative, regardless of
 their state. For example, a disabled checkbox (which may be
 checked or unchecked).

- **dividerColor**: `Color`
  The color of [Divider]s and [PopupMenuDivider]s, also used
 between [ListTile]s, between rows in [DataTable]s, and so forth.

 To create an appropriate [BorderSide] that uses this color, consider
 [Divider.createBorderSide].

- **focusColor**: `Color`
  The focus color used indicate that a component has the input focus.

- **highlightColor**: `Color`
  The highlight color used during ink splash animations or to
 indicate an item in a menu is selected.

- **hintColor**: `Color`
  The color to use for hint text or placeholder text, e.g. in
 [TextField] fields.

- **hoverColor**: `Color`
  The hover color used to indicate when a pointer is hovering over a
 component.

- **primaryColor**: `Color`
  The background color for major parts of the app (toolbars, tab bars, etc)

 The theme's [colorScheme] property contains [ColorScheme.primary], as
 well as a color that contrasts well with the primary color called
 [ColorScheme.onPrimary]. It might be simpler to just configure an app's
 visuals in terms of the theme's [colorScheme].

- **primaryColorDark**: `Color`
  A darker version of the [primaryColor].

- **primaryColorLight**: `Color`
  A lighter version of the [primaryColor].

- **scaffoldBackgroundColor**: `Color`
  The default color of the [Material] that underlies the [Scaffold]. The
 background color for a typical material app or a page within the app.

- **secondaryHeaderColor**: `Color`
  The color of the header of a [PaginatedDataTable] when there are selected rows.

- **shadowColor**: `Color`
  The color that the [Material] widget uses to draw elevation shadows.

 Defaults to fully opaque black.

 Shadows can be difficult to see in a dark theme, so the elevation of a
 surface should be rendered with an "overlay" in addition to the shadow.
 As the elevation of the component increases, the overlay increases in
 opacity. The [applyElevationOverlayColor] property turns the elevation
 overlay on or off for dark themes.

- **splashColor**: `Color`
  The color of ink splashes.

 See also:
  * [splashFactory], which defines the appearance of the splash.

- **unselectedWidgetColor**: `Color`
  The color used for widgets in their inactive (but enabled)
 state. For example, an unchecked checkbox. See also [disabledColor].

- **iconTheme**: `IconThemeData`
  An icon theme that contrasts with the card and canvas colors.

- **primaryIconTheme**: `IconThemeData`
  An icon theme that contrasts with the primary color.

- **primaryTextTheme**: `TextTheme`
  A text theme that contrasts with the primary color.

- **textTheme**: `TextTheme`
  Text with a color that contrasts with the card and canvas colors.

- **typography**: `Typography`
  The color and geometry [TextTheme] values used to configure [textTheme].

 Defaults to a [platform]-appropriate typography.

- **actionIconTheme**: `ActionIconThemeData?`
  A theme for customizing icons of [BackButtonIcon], [CloseButtonIcon],
 [DrawerButtonIcon], or [EndDrawerButtonIcon].

- **appBarTheme**: `AppBarTheme`
  A theme for customizing the color, elevation, brightness, iconTheme and
 textTheme of [AppBar]s.

- **badgeTheme**: `BadgeThemeData`
  A theme for customizing the color of [Badge]s.

- **bannerTheme**: `MaterialBannerThemeData`
  A theme for customizing the color and text style of a [MaterialBanner].

- **bottomAppBarTheme**: `BottomAppBarTheme`
  A theme for customizing the shape, elevation, and color of a [BottomAppBar].

- **bottomNavigationBarTheme**: `BottomNavigationBarThemeData`
  A theme for customizing the appearance and layout of [BottomNavigationBar]
 widgets.

- **bottomSheetTheme**: `BottomSheetThemeData`
  A theme for customizing the color, elevation, and shape of a bottom sheet.

- **buttonTheme**: `ButtonThemeData`
  Defines the default configuration of button widgets, like [DropdownButton]
 and [ButtonBar].

- **cardTheme**: `CardThemeData`
  The colors and styles used to render [Card].

 This is the value returned from [CardTheme.of].

- **checkboxTheme**: `CheckboxThemeData`
  A theme for customizing the appearance and layout of [Checkbox] widgets.

- **chipTheme**: `ChipThemeData`
  The colors and styles used to render [Chip]s.

 This is the value returned from [ChipTheme.of].

- **dataTableTheme**: `DataTableThemeData`
  A theme for customizing the appearance and layout of [DataTable]
 widgets.

- **datePickerTheme**: `DatePickerThemeData`
  A theme for customizing the appearance and layout of [DatePickerDialog]
 widgets.

- **dialogTheme**: `DialogThemeData`
  A theme for customizing the shape of a dialog.

- **dividerTheme**: `DividerThemeData`
  A theme for customizing the color, thickness, and indents of [Divider]s,
 [VerticalDivider]s, etc.

- **drawerTheme**: `DrawerThemeData`
  A theme for customizing the appearance and layout of [Drawer] widgets.

- **dropdownMenuTheme**: `DropdownMenuThemeData`
  A theme for customizing the appearance and layout of [DropdownMenu] widgets.

- **elevatedButtonTheme**: `ElevatedButtonThemeData`
  A theme for customizing the appearance and internal layout of
 [ElevatedButton]s.

- **expansionTileTheme**: `ExpansionTileThemeData`
  A theme for customizing the visual properties of [ExpansionTile]s.

- **filledButtonTheme**: `FilledButtonThemeData`
  A theme for customizing the appearance and internal layout of
 [FilledButton]s.

- **floatingActionButtonTheme**: `FloatingActionButtonThemeData`
  A theme for customizing the shape, elevation, and color of a
 [FloatingActionButton].

- **iconButtonTheme**: `IconButtonThemeData`
  A theme for customizing the appearance and internal layout of
 [IconButton]s.

- **listTileTheme**: `ListTileThemeData`
  A theme for customizing the appearance of [ListTile] widgets.

- **menuBarTheme**: `MenuBarThemeData`
  A theme for customizing the color, shape, elevation, and other [MenuStyle]
 aspects of the menu bar created by the [MenuBar] widget.

- **menuButtonTheme**: `MenuButtonThemeData`
  A theme for customizing the color, shape, elevation, and text style of
 cascading menu buttons created by [SubmenuButton] or [MenuItemButton].

- **menuTheme**: `MenuThemeData`
  A theme for customizing the color, shape, elevation, and other [MenuStyle]
 attributes of menus created by the [SubmenuButton] widget.

- **navigationBarTheme**: `NavigationBarThemeData`
  A theme for customizing the background color, text style, and icon themes
 of a [NavigationBar].

- **navigationDrawerTheme**: `NavigationDrawerThemeData`
  A theme for customizing the background color, text style, and icon themes
 of a [NavigationDrawer].

- **navigationRailTheme**: `NavigationRailThemeData`
  A theme for customizing the background color, elevation, text style, and
 icon themes of a [NavigationRail].

- **outlinedButtonTheme**: `OutlinedButtonThemeData`
  A theme for customizing the appearance and internal layout of
 [OutlinedButton]s.

- **popupMenuTheme**: `PopupMenuThemeData`
  A theme for customizing the color, shape, elevation, and text style of
 popup menus.

- **progressIndicatorTheme**: `ProgressIndicatorThemeData`
  A theme for customizing the appearance and layout of [ProgressIndicator] widgets.

- **radioTheme**: `RadioThemeData`
  A theme for customizing the appearance and layout of [Radio] widgets.

- **searchBarTheme**: `SearchBarThemeData`
  A theme for customizing the appearance and layout of [SearchBar] widgets.

- **searchViewTheme**: `SearchViewThemeData`
  A theme for customizing the appearance and layout of search views created by [SearchAnchor] widgets.

- **segmentedButtonTheme**: `SegmentedButtonThemeData`
  A theme for customizing the appearance and layout of [SegmentedButton] widgets.

- **sliderTheme**: `SliderThemeData`
  The colors and shapes used to render [Slider].

 This is the value returned from [SliderTheme.of].

- **snackBarTheme**: `SnackBarThemeData`
  A theme for customizing colors, shape, elevation, and behavior of a [SnackBar].

- **switchTheme**: `SwitchThemeData`
  A theme for customizing the appearance and layout of [Switch] widgets.

- **tabBarTheme**: `TabBarThemeData`
  A theme for customizing the size, shape, and color of the tab bar indicator.

- **textButtonTheme**: `TextButtonThemeData`
  A theme for customizing the appearance and internal layout of
 [TextButton]s.

- **textSelectionTheme**: `TextSelectionThemeData`
  A theme for customizing the appearance and layout of [TextField] widgets.

- **timePickerTheme**: `TimePickerThemeData`
  A theme for customizing the appearance and layout of time picker widgets.

- **toggleButtonsTheme**: `ToggleButtonsThemeData`
  Defines the default configuration of [ToggleButtons] widgets.

- **tooltipTheme**: `TooltipThemeData`
  A theme for customizing the visual properties of [Tooltip]s.

 This is the value returned from [TooltipTheme.of].

- **_buttonBarTheme**: `ButtonBarThemeData?`
- **dialogBackgroundColor**: `Color`
  The background color of [Dialog] elements.

- **indicatorColor**: `Color`
  The color of the selected tab indicator in a tab bar.

- **_localizedThemeDataCacheSize**: `int`
- **_localizedThemeDataCache**: `_FifoCache&lt;_IdentityThemeDataCacheKey, ThemeData&gt;`
  Caches localized themes to speed up the [localize] method.

## Constructors

### Unnamed Constructor
Create a [ThemeData] that's used to configure a [Theme].

 The [colorScheme] and [textTheme] are used by the Material components to
 compute default values for visual properties. The API documentation for
 each component widget explains exactly how the defaults are computed.

 When providing a [ColorScheme], apps can either provide one directly
 with the [colorScheme] parameter, or have one generated for them by
 using the [colorSchemeSeed] and [brightness] parameters. A generated
 color scheme will be based on the tones of [colorSchemeSeed] and all of
 its contrasting color will meet accessibility guidelines for readability.
 (See [ColorScheme.fromSeed] for more details.)

 If the app wants to customize a generated color scheme, it can use
 [ColorScheme.fromSeed] directly and then [ColorScheme.copyWith] on the
 result to override any colors that need to be replaced. The result of
 this can be used as the [colorScheme] directly.

 For historical reasons, instead of using a [colorSchemeSeed] or
 [colorScheme], you can provide either a [primaryColor] or [primarySwatch]
 to construct the [colorScheme], but the results will not be as complete
 as when using generation from a seed color.

 If [colorSchemeSeed] is non-null then [colorScheme], [primaryColor] and
 [primarySwatch] must all be null.

 The [textTheme] [TextStyle] colors are black if the color scheme's
 brightness is [Brightness.light], and white for [Brightness.dark].

 To override the appearance of specific components, provide
 a component theme parameter like [sliderTheme], [toggleButtonsTheme],
 or [bottomNavigationBarTheme].

 When [useSystemColors] is true and the platform supports system colors, then the system colors
 will be used to override certain theme colors. The [colorScheme], [textTheme],
 [elevatedButtonTheme], [outlinedButtonTheme], [textButtonTheme], [filledButtonTheme], and
 [floatingActionButtonTheme] are overriden by the system colors.

 See also:

  * [ThemeData.from], which creates a ThemeData from a [ColorScheme].
  * [ThemeData.light], which creates the default light theme.
  * [ThemeData.dark], which creates the default dark theme.
  * [ColorScheme.fromSeed], which is used to create a [ColorScheme] from a seed color.

### raw
Create a [ThemeData] given a set of exact values. Most values must be
 specified. They all must also be non-null except for
 [cupertinoOverrideTheme], and deprecated members.

 This will rarely be used directly. It is used by [lerp] to
 create intermediate themes based on two themes created with the
 [ThemeData] constructor.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### from
Create a [ThemeData] based on the colors in the given [colorScheme] and
 text styles of the optional [textTheme].

 If [colorScheme].brightness is [Brightness.dark] then
 [ThemeData.applyElevationOverlayColor] will be set to true to support
 the Material dark theme method for indicating elevation by applying
 a semi-transparent onSurface color on top of the surface color.

 This is the recommended method to theme your application. As we move
 forward we will be converting all the widget implementations to only use
 colors or colors derived from those in [ColorScheme].

 
 This example will set up an application to use the baseline Material
 Design light and dark themes.

 ```dart
 MaterialApp(
   theme: ThemeData.from(colorScheme: const ColorScheme.),
   darkTheme: ThemeData.from(colorScheme: const ColorScheme.),
 )
 ```
 

 See <https://material.io/design/color/> for
 more discussion on how to pick the right colors.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### light
A default light theme.

 This theme does not contain text geometry. Instead, it is expected that
 this theme is localized using text geometry using [ThemeData.localize].

#### Parameters

- ``: `dynamic`
### dark
A default dark theme.

 This theme does not contain text geometry. Instead, it is expected that
 this theme is localized using text geometry using [ThemeData.localize].

#### Parameters

- ``: `dynamic`
### fallback
The default color theme. Same as [ThemeData.light].

 This is used by [Theme.of] when no theme has been specified.

 This theme does not contain text geometry. Instead, it is expected that
 this theme is localized using text geometry using [ThemeData.localize].

 Most applications would use [Theme.of], which provides correct localized
 text geometry.

#### Parameters

- ``: `dynamic`
