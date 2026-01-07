# Overview for `ExpansionTile`

## Description

A single-line [ListTile] with an expansion arrow icon that expands or collapses
 the tile to reveal or hide the [children].

 This widget is typically used with [ListView] to create an "expand /
 collapse" list entry. When used with scrolling widgets like [ListView], a
 unique [PageStorageKey] must be specified as the [key], to enable the
 [ExpansionTile] to save and restore its expanded state when it is scrolled
 in and out of view.

 This class overrides the [ListTileThemeData.iconColor] and [ListTileThemeData.textColor]
 theme properties for its [ListTile]. These colors animate between values when
 the tile is expanded and collapsed: between [iconColor], [collapsedIconColor] and
 between [textColor] and [collapsedTextColor].

 The expansion arrow icon is shown on the right by default in left-to-right languages
 (i.e. the trailing edge). This can be changed using [controlAffinity]. This maps
 to the [leading] and [trailing] properties of [ExpansionTile].

 
 This example demonstrates how the [ExpansionTile] icon's location and appearance
 can be customized.

 ** See code in examples/api/lib/material/expansion_tile/expansion_tile.0.dart **
 

 
 This example demonstrates how an [ExpansionTileController] can be used to
 programmatically expand or collapse an [ExpansionTile].

 ** See code in examples/api/lib/material/expansion_tile/expansion_tile.1.dart **
 

 See also:

  * [ListTile], useful for creating expansion tile [children] when the
    expansion tile represents a sublist.
  * The "Expand and collapse" section of
    <https://material.io/components/lists#types>

## Dependencies

- StatefulWidget

## Members

- **leading**: `Widget?`
  A widget to display before the title.

 Typically a [CircleAvatar] widget.

 Depending on the value of [controlAffinity], the [leading] widget
 may replace the rotating expansion arrow icon.

- **title**: `Widget`
  The primary content of the list item.

 Typically a [Text] widget.

- **subtitle**: `Widget?`
  Additional content displayed below the title.

 Typically a [Text] widget.

- **onExpansionChanged**: `ValueChanged&lt;bool&gt;?`
  Called when the tile expands or collapses.

 When the tile starts expanding, this function is called with the value
 true. When the tile starts collapsing, this function is called with
 the value false.

 Instead of providing this property, consider adding this callback as a
 listener to a provided [controller].

- **children**: `List&lt;Widget&gt;`
  The widgets that are displayed when the tile expands.

 Typically [ListTile] widgets.

- **backgroundColor**: `Color?`
  The color to display behind the sublist when expanded.

 If this property is null then [ExpansionTileThemeData.backgroundColor] is used. If that
 is also null then Colors.transparent is used.

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **collapsedBackgroundColor**: `Color?`
  When not null, defines the background color of tile when the sublist is collapsed.

 If this property is null then [ExpansionTileThemeData.collapsedBackgroundColor] is used.
 If that is also null then Colors.transparent is used.

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **trailing**: `Widget?`
  A widget to display after the title.

 Depending on the value of [controlAffinity], the [trailing] widget
 may replace the rotating expansion arrow icon.

- **showTrailingIcon**: `bool`
  Specifies if the [ExpansionTile] should build a default trailing icon if [trailing] is null.

- **initiallyExpanded**: `bool`
  Specifies if the list tile is initially expanded (true) or collapsed (false).

 Alternatively, a provided [controller] can be used to initially expand the
 tile if [ExpansibleController.expand] is called before this widget is built.

 Defaults to false.

- **maintainState**: `bool`
  Specifies whether the state of the children is maintained when the tile expands and collapses.

 When true, the children are kept in the tree while the tile is collapsed.
 When false (default), the children are removed from the tree when the tile is
 collapsed and recreated upon expansion.

- **tilePadding**: `EdgeInsetsGeometry?`
  Specifies padding for the [ListTile].

 Analogous to [ListTile.contentPadding], this property defines the insets for
 the [leading], [title], [subtitle] and [trailing] widgets. It does not inset
 the expanded [children] widgets.

 If this property is null then [ExpansionTileThemeData.tilePadding] is used. If that
 is also null then the tile's padding is `EdgeInsets.symmetric(horizontal: 16.0)`.

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **expandedAlignment**: `Alignment?`
  Specifies the alignment of [children], which are arranged in a column when
 the tile is expanded.

 The internals of the expanded tile make use of a [Column] widget for
 [children], and [Align] widget to align the column. The [expandedAlignment]
 parameter is passed directly into the [Align].

 Modifying this property controls the alignment of the column within the
 expanded tile, not the alignment of [children] widgets within the column.
 To align each child within [children], see [expandedCrossAxisAlignment].

 The width of the column is the width of the widest child widget in [children].

 If this property is null then [ExpansionTileThemeData.expandedAlignment]is used. If that
 is also null then the value of [expandedAlignment] is [Alignment.center].

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **expandedCrossAxisAlignment**: `CrossAxisAlignment?`
  Specifies the alignment of each child within [children] when the tile is expanded.

 The internals of the expanded tile make use of a [Column] widget for
 [children], and the `crossAxisAlignment` parameter is passed directly into
 the [Column].

 Modifying this property controls the cross axis alignment of each child
 within its [Column]. The width of the [Column] that houses [children] will
 be the same as the widest child widget in [children]. The width of the
 [Column] might not be equal to the width of the expanded tile.

 To align the [Column] along the expanded tile, use the [expandedAlignment]
 property instead.

 When the value is null, the value of [expandedCrossAxisAlignment] is
 [CrossAxisAlignment.center].

- **childrenPadding**: `EdgeInsetsGeometry?`
  Specifies padding for [children].

 If this property is null then [ExpansionTileThemeData.childrenPadding] is used. If that
 is also null then the value of [childrenPadding] is [EdgeInsets.zero].

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **iconColor**: `Color?`
  The icon color of tile's expansion arrow icon when the sublist is expanded.

 Used to override to the [ListTileThemeData.iconColor].

 If this property is null then [ExpansionTileThemeData.iconColor] is used. If that
 is also null then the value of [ColorScheme.primary] is used.

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **collapsedIconColor**: `Color?`
  The icon color of tile's expansion arrow icon when the sublist is collapsed.

 Used to override to the [ListTileThemeData.iconColor].

 If this property is null then [ExpansionTileThemeData.collapsedIconColor] is used. If that
 is also null and [ThemeData.useMaterial3] is true, [ColorScheme.onSurface] is used. Otherwise,
 defaults to [ThemeData.unselectedWidgetColor] color.

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **textColor**: `Color?`
  The color of the tile's titles when the sublist is expanded.

 Used to override to the [ListTileThemeData.textColor].

 If this property is null then [ExpansionTileThemeData.textColor] is used. If that
 is also null then and [ThemeData.useMaterial3] is true, color of the [TextTheme.bodyLarge]
 will be used for the [title] and [subtitle]. Otherwise, defaults to [ColorScheme.primary] color.

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **collapsedTextColor**: `Color?`
  The color of the tile's titles when the sublist is collapsed.

 Used to override to the [ListTileThemeData.textColor].

 If this property is null then [ExpansionTileThemeData.collapsedTextColor] is used.
 If that is also null and [ThemeData.useMaterial3] is true, color of the
 [TextTheme.bodyLarge] will be used for the [title] and [subtitle]. Otherwise,
 defaults to color of the [TextTheme.titleMedium].

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **shape**: `ShapeBorder?`
  The tile's border shape when the sublist is expanded.

 If this property is null, the [ExpansionTileThemeData.shape] is used. If that
 is also null, a [Border] with vertical sides default to [ThemeData.dividerColor] is used

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **collapsedShape**: `ShapeBorder?`
  The tile's border shape when the sublist is collapsed.

 If this property is null, the [ExpansionTileThemeData.collapsedShape] is used. If that
 is also null, a [Border] with vertical sides default to Color [Colors.transparent] is used

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **clipBehavior**: `Clip?`
  

 If this is not null and a custom collapsed or expanded shape is provided,
 the value of [clipBehavior] will be used to clip the expansion tile.

 If this property is null, the [ExpansionTileThemeData.clipBehavior] is used. If that
 is also null, defaults to [Clip.antiAlias].

 See also:

 * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
   [ExpansionTileThemeData].

- **controlAffinity**: `ListTileControlAffinity?`
  Typically used to force the expansion arrow icon to the tile's leading or trailing edge.

 By default, the value of [controlAffinity] is [ListTileControlAffinity.platform],
 which means that the expansion arrow icon will appear on the tile's trailing edge.

- **controller**: `ExpansionTileController?`
  If provided, the controller can be used to expand and collapse tiles.

 In cases were control over the tile's state is needed from a callback triggered
 by a widget within the tile, [ExpansionTileController.of] may be more convenient
 than supplying a controller.

- **dense**: `bool?`
  

- **visualDensity**: `VisualDensity?`
  Defines how compact the expansion tile's layout will be.

 

- **minTileHeight**: `double?`
  

- **enableFeedback**: `bool?`
  

- **enabled**: `bool`
  Whether this expansion tile is interactive.

 If false, the internal [ListTile] will be disabled, changing its
 appearance according to the theme and disabling user interaction.

 Even if disabled, the expansion can still be toggled programmatically
 through an [ExpansionTileController].

- **expansionAnimationStyle**: `AnimationStyle?`
  Used to override the expansion animation curve and duration.

 If [AnimationStyle.duration] is provided, it will be used to override
 the expansion animation duration. If it is null, then [AnimationStyle.duration]
 from the [ExpansionTileThemeData.expansionAnimationStyle] will be used.
 Otherwise, defaults to 200ms.

 If [AnimationStyle.curve] is provided, it will be used to override
 the expansion animation curve. If it is null, then [AnimationStyle.curve]
 from the [ExpansionTileThemeData.expansionAnimationStyle] will be used.
 Otherwise, defaults to [Curves.easeIn].

 If [AnimationStyle.reverseCurve] is provided, it will be used to override
 the collapse animation curve. If it is null, then [AnimationStyle.reverseCurve]
 from the [ExpansionTileThemeData.expansionAnimationStyle] will be used.
 Otherwise, the same curve will be used as for expansion.

 To disable the theme animation, use [AnimationStyle.noAnimation].

 
 This sample showcases how to override the [ExpansionTile] expansion
 animation curve and duration using [AnimationStyle].

 ** See code in examples/api/lib/material/expansion_tile/expansion_tile.2.dart **
 

- **internalAddSemanticForOnTap**: `bool`
  Whether to add button:true to the semantics if onTap is provided.
 This is a temporary flag to help changing the behavior of ListTile onTap semantics.

## Constructors

### Unnamed Constructor
Creates a single-line [ListTile] with an expansion arrow icon that expands or collapses
 the tile to reveal or hide the [children]. The [initiallyExpanded] property must
 be non-null.

