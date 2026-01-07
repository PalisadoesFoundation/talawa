# Overview for `CupertinoListTile`

## Description

An iOS-style list tile.

 The [CupertinoListTile] is a Cupertino equivalent of Material [ListTile].
 It comes in two forms, an old-fashioned edge-to-edge variant known from iOS
 Settings app and in a new, "Inset Grouped" form, known from either iOS Notes
 or Reminders app. The first is constructed using default constructor, and
 the latter using named constructor [CupertinoListTile.notched].

 The [title], [subtitle], and [additionalInfo] are usually [Text] widgets.
 They are all limited to one line so it is a responsibility of the caller to
 take care of text wrapping.

 The size of [leading] is by default constrained to match the iOS size,
 depending of the type of list tile. This can however be overridden by
 providing [leadingSize]. The [trailing] widget is not constrained and is
 therefore a responsibility of the caller to ensure reasonable size of the
 [trailing] widget.

 The background color of the tile can be set with [backgroundColor] for the
 state before tile was tapped and with [backgroundColorActivated] for the
 state after the tile was tapped. By default, both values are set to match
 the default iOS appearance.

 The [padding] and [leadingToTitle] are by default set to match iOS but can
 be overwritten if necessary.

 The [onTap] callback provides an option to react to taps anywhere inside the
 list tile. This can be used to navigate routes and according to iOS
 behavior it should not be used for example to toggle the [CupertinoSwitch]
 in the trailing widget.

 
 This example uses a [ListView] to demonstrate different configurations of
 [CupertinoListTile]s.

 ** See code in examples/api/lib/cupertino/list_tile/cupertino_list_tile.0.dart **
 

 See also:

  * [CupertinoListSection], an iOS-style list that is a typical container for
    [CupertinoListTile].
  * [ListTile], a Material Design list tile.

## Dependencies

- StatefulWidget

## Members

- **_type**: `_CupertinoListTileType`
- **title**: `Widget`
  A [title] is used to convey the central information. Usually a [Text].

- **subtitle**: `Widget?`
  A [subtitle] is used to display additional information. It is located
 below [title]. Usually a [Text] widget.

- **additionalInfo**: `Widget?`
  Similar to [subtitle], an [additionalInfo] is used to display additional
 information. However, instead of being displayed below [title], it is
 displayed on the right, before [trailing]. Usually a [Text] widget.

- **leading**: `Widget?`
  A widget displayed at the start of the [CupertinoListTile]. This is
 typically an `Icon` or an `Image`.

- **trailing**: `Widget?`
  A widget displayed at the end of the [CupertinoListTile]. This is usually
 a right chevron icon (e.g. `CupertinoListTileChevron`), or an `Icon`.

- **onTap**: `FutureOr&lt;void&gt; ?`
  The [onTap] function is called when a user taps on [CupertinoListTile]. If
 left `null`, the [CupertinoListTile] will not react on taps. If this is a
 `Future&lt;void&gt; `, then the [CupertinoListTile] remains activated
 until the returned future is awaited. This is according to iOS behavior.
 However, if this function is a `void `, then the tile is active
 only for the duration of invocation.

- **backgroundColor**: `Color?`
  The [backgroundColor] of the tile in normal state. Once the tile is
 tapped, the background color switches to [backgroundColorActivated]. It is
 set to match the iOS look by default.

- **backgroundColorActivated**: `Color?`
  The [backgroundColorActivated] is the background color of the tile after
 the tile was tapped. It is set to match the iOS look by default.

- **padding**: `EdgeInsetsGeometry?`
  Padding of the content inside [CupertinoListTile].

- **leadingSize**: `double`
  The [leadingSize] is used to constrain the width and height of [leading]
 widget.

- **leadingToTitle**: `double`
  The horizontal space between [leading] widget and [title].

## Constructors

### Unnamed Constructor
Creates an edge-to-edge iOS-style list tile like the tiles in iOS Settings
 app.

 The [title] parameter is required. It is used to convey the most important
 information of list tile. It is typically a [Text].

 The [subtitle] parameter is used to display additional information. It is
 placed below the [title].

 The [additionalInfo] parameter is used to display additional information.
 It is placed at the end of the tile, before the [trailing] if supplied.

 The [leading] parameter is typically an [Icon] or an [Image] and it comes
 at the start of the tile. If omitted in all list tiles, a `hasLeading` of
 enclosing [CupertinoListSection] should be set to `false` to ensure
 correct margin of divider between tiles.

 The [trailing] parameter is typically a [CupertinoListTileChevron], an
 [Icon], or a [CupertinoButton]. It is placed at the very end of the tile.

 The [onTap] parameter is used to provide an action that is called when the
 tile is tapped. It is mainly used for navigating to a new route. It should
 not be used to toggle a trailing [CupertinoSwitch] and similar use cases
 because when tile is tapped, it switches the background color and remains
 changed. This is according to iOS behavior.

 The [backgroundColor] provides a custom background color for the tile in
 a state before tapped. By default, it matches the theme's background color
 which is by default a [CupertinoColors.systemBackground].

 The [backgroundColorActivated] provides a custom background color for the
 tile after it was tapped. By default, it matches the theme's background
 color which is by default a [CupertinoColors.systemGrey4].

 The [padding] parameter sets the padding of the content inside the tile.
 It defaults to a value that matches the iOS look, depending on a type of
 [CupertinoListTile]. For native look, it should not be provided.

 The [leadingSize] constrains the width and height of the leading widget.
 By default, it is set to a value that matches the iOS look, depending on a
 type of [CupertinoListTile]. For native look, it should not be provided.

 The [leadingToTitle] specifies the horizontal space between [leading] and
 [title] widgets. By default, it is set to a value that matched the iOS
 look, depending on a type of [CupertinoListTile]. For native look, it
 should not be provided.

### notched
Creates a notched iOS-style list tile like the tiles in iOS Notes app or
 Reminders app.

 The [title] parameter is required. It is used to convey the most important
 information of list tile. It is typically a [Text].

 The [subtitle] parameter is used to display additional information. It is
 placed below the [title].

 The [additionalInfo] parameter is used to display additional information.
 It is placed at the end of the tile, before the [trailing] if supplied.

 The [leading] parameter is typically an [Icon] or an [Image] and it comes
 at the start of the tile. If omitted in all list tiles, a `hasLeading` of
 enclosing [CupertinoListSection] should be set to `false` to ensure
 correct margin of divider between tiles. For Notes-like tile appearance,
 the [leading] can be left `null`.

 The [trailing] parameter is typically a [CupertinoListTileChevron], an
 [Icon], or a [CupertinoButton]. It is placed at the very end of the tile.
 For Notes-like tile appearance, the [trailing] can be left `null`.

 The [onTap] parameter is used to provide an action that is called when the
 tile is tapped. It is mainly used for navigating to a new route. It should
 not be used to toggle a trailing [CupertinoSwitch] and similar use cases
 because when tile is tapped, it switches the background color and remains
 changed. This is according to iOS behavior.

 The [backgroundColor] provides a custom background color for the tile in
 a state before tapped. By default, it matches the theme's background color
 which is by default a [CupertinoColors.systemBackground].

 The [backgroundColorActivated] provides a custom background color for the
 tile after it was tapped. By default, it matches the theme's background
 color which is by default a [CupertinoColors.systemGrey4].

 The [padding] parameter sets the padding of the content inside the tile.
 It defaults to a value that matches the iOS look, depending on a type of
 [CupertinoListTile]. For native look, it should not be provided.

 The [leadingSize] constrains the width and height of the leading widget.
 By default, it is set to a value that matches the iOS look, depending on a
 type of [CupertinoListTile]. For native look, it should not be provided.

 The [leadingToTitle] specifies the horizontal space between [leading] and
 [title] widgets. By default, it is set to a value that matched the iOS
 look, depending on a type of [CupertinoListTile]. For native look, it
 should not be provided.

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
