# Overview for `ListTile`

## Description

A single fixed-height row that typically contains some text as well as
 a leading or trailing icon.

 

 A list tile contains one to three lines of text optionally flanked by icons or
 other widgets, such as check boxes. The icons (or other widgets) for the
 tile are defined with the [leading] and [trailing] parameters. The first
 line of text is not optional and is specified with [title]. The value of
 [subtitle], which _is_ optional, will occupy the space allocated for an
 additional line of text, or two lines if [isThreeLine] is true. If [dense]
 is true then the overall height of this tile and the size of the
 [DefaultTextStyle]s that wrap the [title] and [subtitle] widget are reduced.

 It is the responsibility of the caller to ensure that [title] does not wrap,
 and to ensure that [subtitle] doesn't wrap (if [isThreeLine] is false) or
 wraps to two lines (if it is true).

 The heights of the [leading] and [trailing] widgets are constrained
 according to the
 [Material spec](https://material.io/design/components/lists.html).
 An exception is made for one-line ListTiles for accessibility. Please
 see the example below to see how to adhere to both Material spec and
 accessibility requirements.

 The [leading] and [trailing] widgets can expand as far as they wish
 horizontally, so ensure that they are properly constrained.

 List tiles are typically used in [ListView]s, or arranged in [Column]s in
 [Drawer]s and [Card]s.

 This widget requires a [Material] widget ancestor in the tree to paint
 itself on, which is typically provided by the app's [Scaffold].
 The [tileColor], [selectedTileColor], [focusColor], and [hoverColor]
 are not painted by the [ListTile] itself but by the [Material] widget
 ancestor. In this case, one can wrap a [Material] widget around the
 [ListTile], e.g.:

 
 ```dart
 const ColoredBox(
   color: Colors.green,
   child: Material(
     child: ListTile(
       title: Text('ListTile with red background'),
       tileColor: Colors.red,
     ),
   ),
 )
 ```
 

 ## Performance considerations when wrapping [ListTile] with [Material]

 Wrapping a large number of [ListTile]s individually with [Material]s
 is expensive. Consider only wrapping the [ListTile]s that require it
 or include a common [Material] ancestor where possible.

 [ListTile] must be wrapped in a [Material] widget to animate [tileColor],
 [selectedTileColor], [focusColor], and [hoverColor] as these colors
 are not drawn by the list tile itself but by the material widget ancestor.

 
 This example showcases how [ListTile] needs to be wrapped in a [Material]
 widget to animate colors.

 ** See code in examples/api/lib/material/list_tile/list_tile.0.dart **
 

 
 This example uses a [ListView] to demonstrate different configurations of
 [ListTile]s in [Card]s.

 ![Different variations of ListTile](https://flutter.github.io/assets-for-api-docs/assets/material/list_tile.png)

 ** See code in examples/api/lib/material/list_tile/list_tile.1.dart **
 

 
 This sample shows the creation of a [ListTile] using [ThemeData.useMaterial3] flag,
 as described in: https://m3.material.io/components/lists/overview.

 ** See code in examples/api/lib/material/list_tile/list_tile.2.dart **
 

 
 This sample shows [ListTile]'s [textColor] and [iconColor] can use
 [WidgetStateColor] color to change the color of the text and icon
 when the [ListTile] is enabled, selected, or disabled.

 ** See code in examples/api/lib/material/list_tile/list_tile.3.dart **
 

 
 This sample shows [ListTile.titleAlignment] can be used to configure the
 [leading] and [trailing] widgets alignment relative to the [title] and
 [subtitle] widgets.

 ** See code in examples/api/lib/material/list_tile/list_tile.4.dart **
 

 
 To use a [ListTile] within a [Row], it needs to be wrapped in an
 [Expanded] widget. [ListTile] requires fixed width constraints,
 whereas a [Row] does not constrain its children.

 ```dart
 const Row(
   children: <Widget>[
     Expanded(
       child: ListTile(
         leading: ,
         title: Text('These ListTiles are expanded '),
       ),
     ),
     Expanded(
       child: ListTile(
         trailing: ,
         title: Text('to fill the available space.'),
       ),
     ),
   ],
 )
 ```
 
 

 Tiles can be much more elaborate. Here is a tile which can be tapped, but
 which is disabled when the `_act` variable is not 2. When the tile is
 tapped, the whole row has an ink splash effect (see [InkWell]).

 ```dart
 ListTile(
   leading: const Icon(Icons.flight_land),
   title: const Text("Trix's airplane"),
   subtitle: _act != 2 ? const Text('The airplane is only in Act II.') : null,
   enabled: _act == 2,
   onTap:  
 )
 ```
 

 To be accessible, tappable [leading] and [trailing] widgets have to
 be at least 48x48 in size. However, to adhere to the Material spec,
 [trailing] and [leading] widgets in one-line ListTiles should visually be
 at most 32 ([dense]: true) or 40 ([dense]: false) in height, which may
 conflict with the accessibility requirement.

 For this reason, a one-line ListTile allows the height of [leading]
 and [trailing] widgets to be constrained by the height of the ListTile.
 This allows for the creation of tappable [leading] and [trailing] widgets
 that are large enough, but it is up to the developer to ensure that
 their widgets follow the Material spec.

 

 Here is an example of a one-line, non-[dense] ListTile with a
 tappable leading widget that adheres to accessibility requirements and
 the Material spec. To adjust the use case below for a one-line, [dense]
 ListTile, adjust the vertical padding to 8.0.

 ```dart
 ListTile(
   leading: GestureDetector(
     behavior: HitTestBehavior.translucent,
     onTap:  ,
     child: Container(
       width: 48,
       height: 48,
       padding: const EdgeInsets.symmetric(vertical: 4.0),
       alignment: Alignment.center,
       child: const ,
     ),
   ),
   title: const Text('title'),
   dense: false,
 )
 ```
 

 ## The ListTile layout isn't exactly what I want

 If the way ListTile pads and positions its elements isn't quite what
 you're looking for, it's easy to create custom list items with a
 combination of other widgets, such as [Row]s and [Column]s.

 
 Here is an example of a custom list item that resembles a YouTube-related
 video list item created with [Expanded] and [Container] widgets.

 ** See code in examples/api/lib/material/list_tile/custom_list_item.0.dart **
 

 
 Here is an example of an article list item with multiline titles and
 subtitles. It utilizes [Row]s and [Column]s, as well as [Expanded] and
 [AspectRatio] widgets to organize its layout.

 ** See code in examples/api/lib/material/list_tile/custom_list_item.1.dart **
 

 See also:

  * [ListTileTheme], which defines visual properties for [ListTile]s.
  * [ListView], which can display an arbitrary number of [ListTile]s
    in a scrolling list.
  * [CircleAvatar], which shows an icon representing a person and is often
    used as the [leading] element of a ListTile.
  * [Card], which can be used with [Column] to show a few [ListTile]s.
  * [Divider], which can be used to separate [ListTile]s.
  * [ListTile.divideTiles], a utility for inserting [Divider]s in between [ListTile]s.
  * [CheckboxListTile], [RadioListTile], and [SwitchListTile], widgets
    that combine [ListTile] with other controls.
  * Material 3 [ListTile] specifications are referenced from <https://m3.material.io/components/lists/specs>
    and Material 2 [ListTile] specifications are referenced from <https://material.io/design/components/lists.html>
  * Cookbook: [Use lists](https://docs.flutter.dev/cookbook/lists/basic-list)
  * Cookbook: [Implement swipe to dismiss](https://docs.flutter.dev/cookbook/gestures/dismissible)

## Dependencies

- StatelessWidget

## Members

- **leading**: `Widget?`
  A widget to display before the title.

 Typically an [Icon] or a [CircleAvatar] widget.

- **title**: `Widget?`
  The primary content of the list tile.

 Typically a [Text] widget.

 This should not wrap. To enforce the single line limit, use
 [Text.maxLines].

- **subtitle**: `Widget?`
  Additional content displayed below the title.

 Typically a [Text] widget.

 If [isThreeLine] is false, this should not wrap.

 If [isThreeLine] is true, this should be configured to take a maximum of
 two lines. For example, you can use [Text.maxLines] to enforce the number
 of lines.

 The subtitle's default [TextStyle] depends on [TextTheme.bodyMedium] except
 [TextStyle.color]. The [TextStyle.color] depends on the value of [enabled]
 and [selected].

 When [enabled] is false, the text color is set to [ThemeData.disabledColor].

 When [selected] is false, the text color is set to [ListTileTheme.textColor]
 if it's not null and to [TextTheme.bodySmall]'s color if [ListTileTheme.textColor]
 is null.

- **trailing**: `Widget?`
  A widget to display after the title.

 Typically an [Icon] widget.

 To show right-aligned metadata (assuming left-to-right reading order;
 left-aligned for right-to-left reading order), consider using a [Row] with
 [CrossAxisAlignment.baseline] alignment whose first item is [Expanded] and
 whose second child is the metadata text, instead of using the [trailing]
 property.

- **isThreeLine**: `bool?`
  Whether this list tile is intended to display three lines of text.

 If true, then [subtitle] must be non-null (since it is expected to give
 the second and third lines of text).

 If false, the list tile is treated as having one line if the subtitle is
 null and treated as having two lines if the subtitle is non-null.

 When using a [Text] widget for [title] and [subtitle], you can enforce
 line limits using [Text.maxLines].

 See also:

 * [ListTileTheme.of], which returns the nearest [ListTileTheme]'s
   [ListTileThemeData].

- **dense**: `bool?`
  
 Whether this list tile is part of a vertically dense list.

 If this property is null then its value is based on [ListTileTheme.dense].

 Dense list tiles default to a smaller height.

 It is not recommended to set [dense] to true when [ThemeData.useMaterial3] is true.
 

- **visualDensity**: `VisualDensity?`
  Defines how compact the list tile's layout will be.

 

 See also:

  * [ThemeData.visualDensity], which specifies the [visualDensity] for all
    widgets within a [Theme].

- **shape**: `ShapeBorder?`
  
 Defines the tile's [InkWell.customBorder] and [Ink.decoration] shape.
 

 If this property is null then [ListTileThemeData.shape] is used. If that
 is also null then a rectangular [Border] will be used.

 See also:

 * [ListTileTheme.of], which returns the nearest [ListTileTheme]'s
   [ListTileThemeData].

- **selectedColor**: `Color?`
  Defines the color used for icons and text when the list tile is selected.

 If this property is null then [ListTileThemeData.selectedColor]
 is used. If that is also null then [ColorScheme.primary] is used.

 See also:

 * [ListTileTheme.of], which returns the nearest [ListTileTheme]'s
   [ListTileThemeData].

- **iconColor**: `Color?`
  Defines the default color for [leading] and [trailing] icons.

 If this property is null and [selected] is false then [ListTileThemeData.iconColor]
 is used. If that is also null and [ThemeData.useMaterial3] is true, [ColorScheme.onSurfaceVariant]
 is used, otherwise if [ThemeData.brightness] is [Brightness.light], [Colors.black54] is used,
 and if [ThemeData.brightness] is [Brightness.dark], the value is null.

 If this property is null and [selected] is true then [ListTileThemeData.selectedColor]
 is used. If that is also null then [ColorScheme.primary] is used.

 If this color is a [WidgetStateColor] it will be resolved against
 [WidgetState.selected] and [WidgetState.disabled] states.

 See also:

 * [ListTileTheme.of], which returns the nearest [ListTileTheme]'s
   [ListTileThemeData].

- **textColor**: `Color?`
  Defines the text color for the [title], [subtitle], [leading], and [trailing].

 If this property is null and [selected] is false then [ListTileThemeData.textColor]
 is used. If that is also null then default text color is used for the [title], [subtitle]
 [leading], and [trailing]. Except for [subtitle], if [ThemeData.useMaterial3] is false,
 [TextTheme.bodySmall] is used.

 If this property is null and [selected] is true then [ListTileThemeData.selectedColor]
 is used. If that is also null then [ColorScheme.primary] is used.

 If this color is a [WidgetStateColor] it will be resolved against
 [WidgetState.selected] and [WidgetState.disabled] states.

 See also:

 * [ListTileTheme.of], which returns the nearest [ListTileTheme]'s
   [ListTileThemeData].

- **titleTextStyle**: `TextStyle?`
  The text style for ListTile's [title].

 If this property is null, then [ListTileThemeData.titleTextStyle] is used.
 If that is also null and [ThemeData.useMaterial3] is true, [TextTheme.bodyLarge]
 with [ColorScheme.onSurface] will be used. Otherwise, If ListTile style is
 [ListTileStyle.list], [TextTheme.titleMedium] will be used and if ListTile style
 is [ListTileStyle.drawer], [TextTheme.bodyLarge] will be used.

- **subtitleTextStyle**: `TextStyle?`
  The text style for ListTile's [subtitle].

 If this property is null, then [ListTileThemeData.subtitleTextStyle] is used.
 If that is also null and [ThemeData.useMaterial3] is true, [TextTheme.bodyMedium]
 with [ColorScheme.onSurfaceVariant] will be used, otherwise [TextTheme.bodyMedium]
 with [TextTheme.bodySmall] color will be used.

- **leadingAndTrailingTextStyle**: `TextStyle?`
  The text style for ListTile's [leading] and [trailing].

 If this property is null, then [ListTileThemeData.leadingAndTrailingTextStyle] is used.
 If that is also null and [ThemeData.useMaterial3] is true, [TextTheme.labelSmall]
 with [ColorScheme.onSurfaceVariant] will be used, otherwise [TextTheme.bodyMedium]
 will be used.

- **style**: `ListTileStyle?`
  Defines the font used for the [title].

 If this property is null then [ListTileThemeData.style] is used. If that
 is also null then [ListTileStyle.list] is used.

 See also:

 * [ListTileTheme.of], which returns the nearest [ListTileTheme]'s
   [ListTileThemeData].

- **contentPadding**: `EdgeInsetsGeometry?`
  The tile's internal padding.

 Insets a [ListTile]'s contents: its [leading], [title], [subtitle], and [trailing] widgets.

 If this property is null, then [ListTileThemeData.contentPadding] is used. If that is also
 null and [ThemeData.useMaterial3] is true, then a default value of
 `EdgeInsetsDirectional.only(start: 16.0, end: 24.0)` will be used. Otherwise, a default value
 of `EdgeInsets.symmetric(horizontal: 16.0)` will be used.

- **enabled**: `bool`
  Whether this list tile is interactive.

 If false, this list tile is styled with the disabled color from the
 current [Theme] and the [onTap] and [onLongPress] callbacks are
 inoperative.

- **onTap**: `GestureTapCallback?`
  Called when the user taps this list tile.

 Inoperative if [enabled] is false.

- **onLongPress**: `GestureLongPressCallback?`
  Called when the user long-presses on this list tile.

 Inoperative if [enabled] is false.

- **onFocusChange**: `ValueChanged&lt;bool&gt;?`
  

- **mouseCursor**: `MouseCursor?`
  
 The cursor for a mouse pointer when it enters or is hovering over the
 widget.

 If [mouseCursor] is a [WidgetStateMouseCursor],
 [WidgetStateProperty.resolve] is used for the following [WidgetState]s:

  * [WidgetState.selected].
  * [WidgetState.disabled].
 

 If null, then the value of [ListTileThemeData.mouseCursor] is used. If
 that is also null, then [WidgetStateMouseCursor.clickable] is used.

- **selected**: `bool`
  If this tile is also [enabled] then icons and text are rendered with the same color.

 By default the selected color is the theme's primary color. The selected color
 can be overridden with a [ListTileTheme].

 
 Here is an example of using a [StatefulWidget] to keep track of the
 selected index, and using that to set the [selected] property on the
 corresponding [ListTile].

 ** See code in examples/api/lib/material/list_tile/list_tile.selected.0.dart **
 

- **focusColor**: `Color?`
  The color for the tile's [Material] when it has the input focus.

- **hoverColor**: `Color?`
  The color for the tile's [Material] when a pointer is hovering over it.

- **splashColor**: `Color?`
  The color of splash for the tile's [Material].

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

- **tileColor**: `Color?`
  
 Defines the background color of `ListTile` when [selected] is false.

 If this property is null and [selected] is false then [ListTileThemeData.tileColor]
 is used. If that is also null and [selected] is true, [selectedTileColor] is used.
 When that is also null, the [ListTileTheme.selectedTileColor] is used, otherwise
 [Colors.transparent] is used.

 

- **selectedTileColor**: `Color?`
  Defines the background color of `ListTile` when [selected] is true.

 When the value if null, the [selectedTileColor] is set to [ListTileTheme.selectedTileColor]
 if it's not null and to [Colors.transparent] if it's null.

- **enableFeedback**: `bool?`
  
 Whether detected gestures should provide acoustic and/or haptic feedback.

 For example, on Android a tap will produce a clicking sound and a
 long-press will produce a short vibration, when feedback is enabled.

 When null, the default value is true.
 

 See also:

  * [Feedback] for providing platform-specific feedback to certain actions.

- **horizontalTitleGap**: `double?`
  The horizontal gap between the titles and the leading/trailing widgets.

 If null, then the value of [ListTileTheme.horizontalTitleGap] is used. If
 that is also null, then a default value of 16 is used.

- **minVerticalPadding**: `double?`
  The minimum padding on the top and bottom of the title and subtitle widgets.

 If null, then the value of [ListTileTheme.minVerticalPadding] is used. If
 that is also null, then a default value of 4 is used.

- **minLeadingWidth**: `double?`
  The minimum width allocated for the [ListTile.leading] widget.

 If null, then the value of [ListTileTheme.minLeadingWidth] is used. If
 that is also null, then a default value of 40 is used.

- **minTileHeight**: `double?`
  
 The minimum height allocated for the [ListTile] widget.

 If this is null, default tile heights are 56.0, 72.0, and 88.0 for one,
 two, and three lines of text respectively. If `isDense` is true, these
 defaults are changed to 48.0, 64.0, and 76.0. A visual density value or
 a large title will also adjust the default tile heights.
 

- **titleAlignment**: `ListTileTitleAlignment?`
  Defines how [ListTile.leading] and [ListTile.trailing] are
 vertically aligned relative to the [ListTile]'s titles
 ([ListTile.title] and [ListTile.subtitle]).

 If this property is null then [ListTileThemeData.titleAlignment]
 is used. If that is also null then [ListTileTitleAlignment.threeLine]
 is used.

 See also:

 * [ListTileTheme.of], which returns the nearest [ListTileTheme]'s
   [ListTileThemeData].

- **internalAddSemanticForOnTap**: `bool`
  Whether to add button:true to the semantics if onTap is provided.
 This is a temporary flag to help changing the behavior of ListTile onTap semantics.

## Constructors

### Unnamed Constructor
Creates a list tile.

 If [isThreeLine] is true, then [subtitle] must not be null.

 Requires one of its ancestors to be a [Material] widget.

