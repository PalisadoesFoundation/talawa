# Overview for `SearchBar`

## Description

A Material Design search bar.

 A [SearchBar] looks like a [TextField]. Tapping a SearchBar typically shows a
 "search view" route: a route with the search bar at the top and a list of
 suggested completions for the search bar's text below. [SearchBar]s are
 usually created by a [SearchAnchor.builder]. The builder provides a
 [SearchController] that's used by the search bar's [SearchBar.onTap] or
 [SearchBar.onChanged] callbacks to show the search view and to hide it
 when the user selects a suggestion.

 For [TextDirection.ltr], the [leading] widget is on the left side of the bar.
 It should contain either a navigational action (such as a menu or up-arrow)
 or a non-functional search icon.

 The [trailing] is an optional list that appears at the other end of
 the search bar. Typically only one or two action icons are included.
 These actions can represent additional modes of searching (like voice search),
 a separate high-level action (such as current location) or an overflow menu.

 
 This example demonstrates how to use a [SearchBar] as the return value of the
 [SearchAnchor.builder] property. The [SearchBar] also includes a leading search
 icon and a trailing action to toggle the brightness.

 ** See code in examples/api/lib/material/search_anchor/search_bar.0.dart **
 

 See also:

 * [SearchAnchor], a widget that typically uses an [IconButton] or a [SearchBar]
 to manage a "search view" route.
 * [SearchBarTheme], a widget that overrides the default configuration of a search bar.
 * [SearchViewTheme], a widget that overrides the default configuration of a search view.

## Dependencies

- StatefulWidget

## Members

- **controller**: `TextEditingController?`
  Controls the text being edited in the search bar's text field.

 If null, this widget will create its own [TextEditingController].

- **focusNode**: `FocusNode?`
  

- **hintText**: `String?`
  Text that suggests what sort of input the field accepts.

 Displayed at the same location on the screen where text may be entered
 when the input is empty.

 Defaults to null.

- **leading**: `Widget?`
  A widget to display before the text input field.

 Typically the [leading] widget is an [Icon] or an [IconButton].

- **trailing**: `Iterable&lt;Widget&gt;?`
  A list of Widgets to display in a row after the text field.

 Typically these actions can represent additional modes of searching
 (like voice search), an avatar, a separate high-level action (such as
 current location) or an overflow menu. There should not be more than
 two trailing actions.

- **onTap**: `GestureTapCallback?`
  Called when the user taps this search bar.

- **onTapOutside**: `TapRegionCallback?`
  Called when the user taps outside the search bar.

- **onChanged**: `ValueChanged&lt;String&gt;?`
  Invoked upon user input.

- **onSubmitted**: `ValueChanged&lt;String&gt;?`
  Called when the user indicates that they are done editing the text in the
 field.

- **constraints**: `BoxConstraints?`
  Optional size constraints for the search bar.

 If null, the value of [SearchBarThemeData.constraints] will be used. If
 this is also null, then the constraints defaults to:
 ```dart
 const BoxConstraints(minWidth: 360.0, maxWidth: 800.0, minHeight: 56.0)
 ```

- **elevation**: `MaterialStateProperty<double?>?`
  The elevation of the search bar's [Material].

 If null, the value of [SearchBarThemeData.elevation] will be used. If this
 is also null, then default value is 6.0.

- **backgroundColor**: `MaterialStateProperty<Color?>?`
  The search bar's background fill color.

 If null, the value of [SearchBarThemeData.backgroundColor] will be used.
 If this is also null, then the default value is [ColorScheme.surfaceContainerHigh].

- **shadowColor**: `MaterialStateProperty<Color?>?`
  The shadow color of the search bar's [Material].

 If null, the value of [SearchBarThemeData.shadowColor] will be used.
 If this is also null, then the default value is [ColorScheme.shadow].

- **surfaceTintColor**: `MaterialStateProperty<Color?>?`
  The surface tint color of the search bar's [Material].

 This is not recommended for use. [Material 3 spec](https://m3.material.io/styles/color/the-color-system/color-roles)
 introduced a set of tone-based surfaces and surface containers in its [ColorScheme],
 which provide more flexibility. The intention is to eventually remove surface tint color from
 the framework.

 If null, the value of [SearchBarThemeData.surfaceTintColor] will be used.
 If this is also null, then the default value is [Colors.transparent].

- **overlayColor**: `MaterialStateProperty<Color?>?`
  The highlight color that's typically used to indicate that
 the search bar is focused, hovered, or pressed.

- **side**: `MaterialStateProperty<BorderSide?>?`
  The color and weight of the search bar's outline.

 This value is combined with [shape] to create a shape decorated
 with an outline.

 If null, the value of [SearchBarThemeData.side] will be used. If this is
 also null, the search bar doesn't have a side by default.

- **shape**: `MaterialStateProperty<OutlinedBorder?>?`
  The shape of the search bar's underlying [Material].

 This shape is combined with [side] to create a shape decorated
 with an outline.

 If null, the value of [SearchBarThemeData.shape] will be used.
 If this is also null, defaults to [StadiumBorder].

- **padding**: `MaterialStateProperty<EdgeInsetsGeometry?>?`
  The padding between the search bar's boundary and its contents.

 If null, the value of [SearchBarThemeData.padding] will be used.
 If this is also null, then the default value is 16.0 horizontally.

- **textStyle**: `MaterialStateProperty<TextStyle?>?`
  The style to use for the text being edited.

 If null, defaults to the `bodyLarge` text style from the current [Theme].
 The default text color is [ColorScheme.onSurface].

- **hintStyle**: `MaterialStateProperty<TextStyle?>?`
  The style to use for the [hintText].

 If null, the value of [SearchBarThemeData.hintStyle] will be used. If this
 is also null, the value of [textStyle] will be used. If this is also null,
 defaults to the `bodyLarge` text style from the current [Theme].
 The default text color is [ColorScheme.onSurfaceVariant].

- **textCapitalization**: `TextCapitalization?`
  

- **enabled**: `bool`
  Whether or not this widget is currently interactive.

 When false, the widget will ignore taps and appear dimmed.

 Defaults to true.

- **autoFocus**: `bool`
  

- **textInputAction**: `TextInputAction?`
  

- **keyboardType**: `TextInputType?`
  The type of action button to use for the keyboard.

 Defaults to the default value specified in [TextField].

- **scrollPadding**: `EdgeInsets`
  

- **contextMenuBuilder**: `EditableTextContextMenuBuilder?`
  

 If not provided, will build a default menu based on the platform.

 See also:

  * [AdaptiveTextSelectionToolbar], which is built by default.
  * [BrowserContextMenu], which allows the browser's context menu on web to
    be disabled and Flutter-rendered context menus to appear.

## Constructors

### Unnamed Constructor
Creates a Material Design search bar.

