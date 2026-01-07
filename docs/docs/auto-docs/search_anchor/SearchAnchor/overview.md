# Overview for `SearchAnchor`

## Description

Manages a "search view" route that allows the user to select one of the
 suggested completions for a search query.

 The search view's route can either be shown by creating a [SearchController]
 and then calling [SearchController.openView] or by tapping on an anchor.
 When the anchor is tapped or [SearchController.openView] is called, the search view either
 grows to a specific size, or grows to fill the entire screen. By default,
 the search view only shows full screen on mobile platforms. Use [SearchAnchor.isFullScreen]
 to override the default setting.

 The search view is usually opened by a [SearchBar], an [IconButton] or an [Icon].
 If [builder] returns an Icon, or any un-tappable widgets, we don't have
 to explicitly call [SearchController.openView].

 The search view route will be popped if the window size is changed and the
 search view route is not in full-screen mode. However, if the search view route
 is in full-screen mode, changing the window size, such as rotating a mobile
 device from portrait mode to landscape mode, will not close the search view.

 
 This example shows how to use an IconButton to open a search view in a [SearchAnchor].
 It also shows how to use [SearchController] to open or close the search view route.

 ** See code in examples/api/lib/material/search_anchor/search_anchor.2.dart **
 

 
 This example shows how to set up a floating (or pinned) AppBar with a
 [SearchAnchor] for a title.

 ** See code in examples/api/lib/material/search_anchor/search_anchor.1.dart **
 

 
 This example shows how to fetch the search suggestions from a remote API.

 ** See code in examples/api/lib/material/search_anchor/search_anchor.3.dart **
 

 
 This example demonstrates fetching the search suggestions asynchronously and
 debouncing network calls.

 ** See code in examples/api/lib/material/search_anchor/search_anchor.4.dart **
 

 See also:

 * [SearchBar], a widget that defines a search bar.
 * [SearchBarTheme], a widget that overrides the default configuration of a search bar.
 * [SearchViewTheme], a widget that overrides the default configuration of a search view.

## Dependencies

- StatefulWidget

## Members

- **isFullScreen**: `bool?`
  Whether the search view grows to fill the entire screen when the
 [SearchAnchor] is tapped.

 By default, the search view is full-screen on mobile devices. On other
 platforms, the search view only grows to a specific size that is determined
 by the anchor and the default size.

- **searchController**: `SearchController?`
  An optional controller that allows opening and closing of the search view from
 other widgets.

 If this is null, one internal search controller is created automatically
 and it is used to open the search view when the user taps on the anchor.

- **viewBuilder**: `ViewBuilder?`
  Optional callback to obtain a widget to lay out the suggestion list of the
 search view.

 Default view uses a [ListView] with a vertical scroll direction.

- **viewLeading**: `Widget?`
  An optional widget to display before the text input field when the search
 view is open.

 Typically the [viewLeading] widget is an [Icon] or an [IconButton].

 Defaults to a back button which pops the view.

- **viewTrailing**: `Iterable&lt;Widget&gt;?`
  An optional widget list to display after the text input field when the search
 view is open.

 Typically the [viewTrailing] widget list only has one or two widgets.

 Defaults to an icon button which clears the text in the input field.

- **viewHintText**: `String?`
  Text that is displayed when the search bar's input field is empty.

- **viewBackgroundColor**: `Color?`
  The search view's background fill color.

 If null, the value of [SearchViewThemeData.backgroundColor] will be used.
 If this is also null, then the default value is [ColorScheme.surfaceContainerHigh].

- **viewElevation**: `double?`
  The elevation of the search view's [Material].

 If null, the value of [SearchViewThemeData.elevation] will be used. If this
 is also null, then default value is 6.0.

- **viewSurfaceTintColor**: `Color?`
  The surface tint color of the search view's [Material].

 This is not recommended for use. [Material 3 spec](https://m3.material.io/styles/color/the-color-system/color-roles)
 introduced a set of tone-based surfaces and surface containers in its [ColorScheme],
 which provide more flexibility. The intention is to eventually remove surface tint color from
 the framework.

 If null, the value of [SearchViewThemeData.surfaceTintColor] will be used.
 If this is also null, then the default value is [ColorScheme.surfaceTint].

- **viewSide**: `BorderSide?`
  The color and weight of the search view's outline.

 This value is combined with [viewShape] to create a shape decorated
 with an outline. This will be ignored if the view is full-screen.

 If null, the value of [SearchViewThemeData.side] will be used. If this is
 also null, the search view doesn't have a side by default.

- **viewShape**: `OutlinedBorder?`
  The shape of the search view's underlying [Material].

 This shape is combined with [viewSide] to create a shape decorated
 with an outline.

 If null, the value of [SearchViewThemeData.shape] will be used.
 If this is also null, then the default value is a rectangle shape for full-screen
 mode and a [RoundedRectangleBorder] shape with a 28.0 radius otherwise.

- **viewBarPadding**: `EdgeInsetsGeometry?`
  The padding to use for the search view's search bar.

 If null, then the default value is 8.0 horizontally.

- **headerHeight**: `double?`
  The height of the search field on the search view.

 If null, the value of [SearchViewThemeData.headerHeight] will be used. If
 this is also null, the default value is 56.0.

- **headerTextStyle**: `TextStyle?`
  The style to use for the text being edited on the search view.

 If null, defaults to the `bodyLarge` text style from the current [Theme].
 The default text color is [ColorScheme.onSurface].

- **headerHintStyle**: `TextStyle?`
  The style to use for the [viewHintText] on the search view.

 If null, the value of [SearchViewThemeData.headerHintStyle] will be used.
 If this is also null, the value of [headerTextStyle] will be used. If this is also null,
 defaults to the `bodyLarge` text style from the current [Theme]. The default
 text color is [ColorScheme.onSurfaceVariant].

- **dividerColor**: `Color?`
  The color of the divider on the search view.

 If this property is null, then [SearchViewThemeData.dividerColor] is used.
 If that is also null, the default value is [ColorScheme.outline].

- **viewConstraints**: `BoxConstraints?`
  Optional size constraints for the search view.

 By default, the search view has the same width as the anchor and is 2/3
 the height of the screen. If the width and height of the view are within
 the [viewConstraints], the view will show its default size. Otherwise,
 the size of the view will be constrained by this property.

 If null, the value of [SearchViewThemeData.constraints] will be used. If
 this is also null, then the constraints defaults to:
 ```dart
 const BoxConstraints(minWidth: 360.0, minHeight: 240.0)
 ```

- **viewPadding**: `EdgeInsetsGeometry?`
  The padding to use for the search view.

 Has no effect if the search view is full-screen.

 If null, the value of [SearchViewThemeData.padding] will be used.

- **shrinkWrap**: `bool?`
  Whether the search view should shrink-wrap its contents.

 Has no effect if the search view is full-screen.

 If null, the value of [SearchViewThemeData.shrinkWrap] will be used. If
 this is also null, then the default value is `false`.

- **textCapitalization**: `TextCapitalization?`
  

- **viewOnChanged**: `ValueChanged&lt;String&gt;?`
  Called each time the user modifies the search view's text field.

 See also:

  * [viewOnSubmitted], which is called when the user indicates that they
  are done editing the search view's text field.

- **viewOnSubmitted**: `ValueChanged&lt;String&gt;?`
  Called when the user indicates that they are done editing the text in the
 text field of a search view. Typically this is called when the user presses
 the enter key.

 See also:

 * [viewOnChanged], which is called when the user modifies the text field
 of the search view.

- **viewOnClose**: `VoidCallback?`
  Called when the search view is closed.

- **viewOnOpen**: `VoidCallback?`
  Called when the search view is opened.

- **builder**: `SearchAnchorChildBuilder`
  Called to create a widget which can open a search view route when it is tapped.

 The widget returned by this builder is faded out when it is tapped.
 At the same time a search view route is faded in.

- **suggestionsBuilder**: `SuggestionsBuilder`
  Called to get the suggestion list for the search view.

 By default, the list returned by this builder is laid out in a [ListView].
 To get a different layout, use [viewBuilder] to override.

- **textInputAction**: `TextInputAction?`
  

- **keyboardType**: `TextInputType?`
  The type of action button to use for the keyboard.

 Defaults to the default value specified in [TextField].

- **enabled**: `bool`
  Whether or not this widget is currently interactive.

 When false, the widget will ignore taps and appear dimmed.

 Defaults to true.

## Constructors

### Unnamed Constructor
Creates a const [SearchAnchor].

 The [builder] and [suggestionsBuilder] arguments are required.

### bar
Create a [SearchAnchor] that has a [SearchBar] which opens a search view.

 All the barX parameters are used to customize the anchor. Similarly, all the
 viewX parameters are used to override the view's defaults.

 
 This example shows how to use a [SearchAnchor.bar] which uses a default search
 bar to open a search view route.

 ** See code in examples/api/lib/material/search_anchor/search_anchor.0.dart **
 

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
