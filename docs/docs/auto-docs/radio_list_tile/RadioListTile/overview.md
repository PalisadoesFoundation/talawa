# Overview for `RadioListTile`

## Description

A [ListTile] with a [Radio]. In other words, a radio button with a label.

 The entire list tile is interactive: tapping anywhere in the tile selects
 the radio button.

 The [value], [groupValue], [onChanged], and [activeColor] properties of this
 widget are identical to the similarly-named properties on the [Radio]
 widget. The type parameter `T` serves the same purpose as that of the
 [Radio] class' type parameter.

 The [title], [subtitle], [isThreeLine], and [dense] properties are like
 those of the same name on [ListTile].

 The [selected] property on this widget is similar to the [ListTile.selected]
 property. The [fillColor] in the selected state is used for the selected item's
 text color. If it is null, the [activeColor] is used.

 This widget does not coordinate the [selected] state and the
 [checked] state; to have the list tile appear selected when the
 radio button is the selected radio button, set [selected] to true
 when [value] matches [groupValue].

 The radio button is shown on the left by default in left-to-right languages
 (i.e. the leading edge). This can be changed using [controlAffinity]. The
 [secondary] widget is placed on the opposite side. This maps to the
 [ListTile.leading] and [ListTile.trailing] properties of [ListTile].

 This widget requires a [Material] widget ancestor in the tree to paint
 itself on, which is typically provided by the app's [Scaffold].
 The [tileColor], and [selectedTileColor] are not painted by the
 [RadioListTile] itself but by the [Material] widget ancestor. In this
 case, one can wrap a [Material] widget around the [RadioListTile], e.g.:

 
 ```dart
 ColoredBox(
   color: Colors.green,
   child: Material(
     child: RadioListTile&lt;Meridiem&gt;(
       tileColor: Colors.red,
       title: const Text('AM'),
       groupValue: Meridiem.am,
       value: Meridiem.am,
       onChanged:(Meridiem? value) ,
     ),
   ),
 )
 ```
 

 ## Performance considerations when wrapping [RadioListTile] with [Material]

 Wrapping a large number of [RadioListTile]s individually with [Material]s
 is expensive. Consider only wrapping the [RadioListTile]s that require it
 or include a common [Material] ancestor where possible.

 To show the [RadioListTile] as disabled, pass null as the [onChanged]
 callback.

 
 ![RadioListTile sample](https://flutter.github.io/assets-for-api-docs/assets/material/radio_list_tile.png)

 This widget shows a pair of radio buttons that control the `_character`
 field. The field is of the type `SingingCharacter`, an enum.

 ** See code in examples/api/lib/material/radio_list_tile/radio_list_tile.0.dart **
 

 
 This sample demonstrates how [RadioListTile] positions the radio widget
 relative to the text in different configurations.

 ** See code in examples/api/lib/material/radio_list_tile/radio_list_tile.1.dart **
 

 ## Semantics in RadioListTile

 Since the entirety of the RadioListTile is interactive, it should represent
 itself as a single interactive entity.

 To do so, a RadioListTile widget wraps its children with a [MergeSemantics]
 widget. [MergeSemantics] will attempt to merge its descendant [Semantics]
 nodes into one node in the semantics tree. Therefore, RadioListTile will
 throw an error if any of its children requires its own [Semantics] node.

 For example, you cannot nest a [RichText] widget as a descendant of
 RadioListTile. [RichText] has an embedded gesture recognizer that
 requires its own [Semantics] node, which directly conflicts with
 RadioListTile's desire to merge all its descendants' semantic nodes
 into one. Therefore, it may be necessary to create a custom radio tile
 widget to accommodate similar use cases.

 
 ![Radio list tile semantics sample](https://flutter.github.io/assets-for-api-docs/assets/material/radio_list_tile_semantics.png)

 Here is an example of a custom labeled radio widget, called
 LinkedLabelRadio, that includes an interactive [RichText] widget that
 handles tap gestures.

 ** See code in examples/api/lib/material/radio_list_tile/custom_labeled_radio.0.dart **
 

 ## RadioListTile isn't exactly what I want

 If the way RadioListTile pads and positions its elements isn't quite what
 you're looking for, you can create custom labeled radio widgets by
 combining [Radio] with other widgets, such as [Text], [Padding] and
 [InkWell].

 
 ![Custom radio list tile sample](https://flutter.github.io/assets-for-api-docs/assets/material/radio_list_tile_custom.png)

 Here is an example of a custom LabeledRadio widget, but you can easily
 make your own configurable widget.

 ** See code in examples/api/lib/material/radio_list_tile/custom_labeled_radio.1.dart **
 

 See also:

  * [ListTileTheme], which can be used to affect the style of list tiles,
    including radio list tiles.
  * [CheckboxListTile], a similar widget for checkboxes.
  * [SwitchListTile], a similar widget for switches.
  * [ListTile] and [Radio], the widgets from which this widget is made.

## Dependencies

- StatelessWidget

## Members

- **value**: `T`
  The value represented by this radio button.

- **groupValue**: `T?`
  The currently selected value for this group of radio buttons.

 This radio button is considered selected if its [value] matches the
 [groupValue].

- **onChanged**: `ValueChanged<T?>?`
  Called when the user selects this radio button.

 The radio button passes [value] as a parameter to this callback. The radio
 button does not actually change state until the parent widget rebuilds the
 radio tile with the new [groupValue].

 If null, the radio button will be displayed as disabled.

 The provided callback will not be invoked if this radio button is already
 selected.

 The callback provided to [onChanged] should update the state of the parent
 [StatefulWidget] using the [State.setState] method, so that the parent
 gets rebuilt; for example:

 ```dart
 RadioListTile&lt;SingingCharacter&gt;(
   title: const Text('Lafayette'),
   value: SingingCharacter.lafayette,
   groupValue: _character,
   onChanged: (SingingCharacter? newValue) ,
 )
 ```

- **mouseCursor**: `MouseCursor?`
  The cursor for a mouse pointer when it enters or is hovering over the
 widget.

 If [mouseCursor] is a [WidgetStateMouseCursor],
 [WidgetStateProperty.resolve] is used for the following [WidgetState]s:

  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.disabled].

 If null, then the value of [RadioThemeData.mouseCursor] is used.
 If that is also null, then [WidgetStateMouseCursor.clickable] is used.

- **toggleable**: `bool`
  Set to true if this radio list tile is allowed to be returned to an
 indeterminate state by selecting it again when selected.

 To indicate returning to an indeterminate state, [onChanged] will be
 called with null.

 If true, [onChanged] can be called with [value] when selected while
 [groupValue] != [value], or with null when selected again while
 [groupValue] == [value].

 If false, [onChanged] will be called with [value] when it is selected
 while [groupValue] != [value], and only by selecting another radio button
 in the group (i.e. changing the value of [groupValue]) can this radio
 list tile be unselected.

 The default is false.

 
 This example shows how to enable deselecting a radio button by setting the
 [toggleable] attribute.

 ** See code in examples/api/lib/material/radio_list_tile/radio_list_tile.toggleable.0.dart **
 

- **activeColor**: `Color?`
  The color to use when this radio button is selected.

 Defaults to [ColorScheme.secondary] of the current [Theme].

- **fillColor**: `MaterialStateProperty<Color?>?`
  The color that fills the radio button.

 Resolves in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.disabled].

 If null, then the value of [activeColor] is used in the selected state. If
 that is also null, then the value of [RadioThemeData.fillColor] is used.
 If that is also null, then the default value is used.

- **materialTapTargetSize**: `MaterialTapTargetSize?`
  

 Defaults to [MaterialTapTargetSize.shrinkWrap].

- **hoverColor**: `Color?`
  

- **overlayColor**: `MaterialStateProperty<Color?>?`
  The color for the radio's [Material].

 Resolves in the following states:
  * [WidgetState.pressed].
  * [WidgetState.selected].
  * [WidgetState.hovered].

 If null, then the value of [activeColor] with alpha [kRadialReactionAlpha]
 and [hoverColor] is used in the pressed and hovered state. If that is also
 null, the value of [SwitchThemeData.overlayColor] is used. If that is
 also null, then the default value is used in the pressed and hovered state.

- **splashRadius**: `double?`
  

 If null, then the value of [RadioThemeData.splashRadius] is used. If that
 is also null, then [kRadialReactionRadius] is used.

- **title**: `Widget?`
  The primary content of the list tile.

 Typically a [Text] widget.

- **subtitle**: `Widget?`
  Additional content displayed below the title.

 Typically a [Text] widget.

- **secondary**: `Widget?`
  A widget to display on the opposite side of the tile from the radio button.

 Typically an [Icon] widget.

- **isThreeLine**: `bool`
  Whether this list tile is intended to display three lines of text.

 If false, the list tile is treated as having one line if the subtitle is
 null and treated as having two lines if the subtitle is non-null.

- **dense**: `bool?`
  Whether this list tile is part of a vertically dense list.

 If this property is null then its value is based on [ListTileThemeData.dense].

- **selected**: `bool`
  Whether to render icons and text in the [activeColor].

 No effort is made to automatically coordinate the [selected] state and the
 [checked] state. To have the list tile appear selected when the radio
 button is the selected radio button, set [selected] to true when [value]
 matches [groupValue].

 Normally, this property is left to its default value, false.

- **controlAffinity**: `ListTileControlAffinity?`
  Where to place the control relative to the text.

- **autofocus**: `bool`
  

- **contentPadding**: `EdgeInsetsGeometry?`
  Defines the insets surrounding the contents of the tile.

 Insets the [Radio], [title], [subtitle], and [secondary] widgets
 in [RadioListTile].

 When null, `EdgeInsets.symmetric(horizontal: 16.0)` is used.

- **shape**: `ShapeBorder?`
  If specified, [shape] defines the shape of the [RadioListTile]'s [InkWell] border.

- **tileColor**: `Color?`
  If specified, defines the background color for `RadioListTile` when
 [RadioListTile.selected] is false.

- **selectedTileColor**: `Color?`
  If non-null, defines the background color when [RadioListTile.selected] is true.

- **visualDensity**: `VisualDensity?`
  Defines how compact the list tile's layout will be.

 

- **focusNode**: `FocusNode?`
  

- **onFocusChange**: `ValueChanged&lt;bool&gt;?`
  

- **enableFeedback**: `bool?`
  

 See also:

  * [Feedback] for providing platform-specific feedback to certain actions.

- **_radioType**: `_RadioType`
- **internalAddSemanticForOnTap**: `bool`
  Whether to add button:true to the semantics if onTap is provided.
 This is a temporary flag to help changing the behavior of ListTile onTap semantics.

- **useCupertinoCheckmarkStyle**: `bool`
  Whether to use the checkbox style for the [CupertinoRadio] control.

 Only usable under the [RadioListTile.adaptive] constructor. If set to
 true, on Apple platforms the radio button will appear as an iOS styled
 checkmark. Controls the [CupertinoRadio] through
 [CupertinoRadio.useCheckmarkStyle].

 Defaults to false.

- **radioScaleFactor**: `double`
  Controls the scaling factor applied to the [Radio] within the [RadioListTile].

 Defaults to 1.0.

## Constructors

### Unnamed Constructor
Creates a combination of a list tile and a radio button.

 The radio tile itself does not maintain any state. Instead, when the radio
 button is selected, the widget calls the [onChanged] callback. Most
 widgets that use a radio button will listen for the [onChanged] callback
 and rebuild the radio tile with a new [groupValue] to update the visual
 appearance of the radio button.

 The following arguments are required:

 * [value] and [groupValue] together determine whether the radio button is
   selected.
 * [onChanged] is called when the user selects this radio button.

### adaptive
Creates a combination of a list tile and a platform adaptive radio.

 The checkbox uses [Radio.adaptive] to show a [CupertinoRadio] for
 iOS platforms, or [Radio] for all others.

 All other properties are the same as [RadioListTile].

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
