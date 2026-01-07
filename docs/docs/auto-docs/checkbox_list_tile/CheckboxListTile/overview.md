# Overview for `CheckboxListTile`

## Description

A [ListTile] with a [Checkbox]. In other words, a checkbox with a label.

 The entire list tile is interactive: tapping anywhere in the tile toggles
 the checkbox.

 

 The [value], [onChanged], [activeColor] and [checkColor] properties of this widget are
 identical to the similarly-named properties on the [Checkbox] widget.

 The [title], [subtitle], [isThreeLine], [dense], and [contentPadding] properties are like
 those of the same name on [ListTile].

 The [selected] property on this widget is similar to the [ListTile.selected]
 property. This tile's [activeColor] is used for the selected item's text color, or
 the theme's [CheckboxThemeData.overlayColor] if [activeColor] is null.

 This widget does not coordinate the [selected] state and the [value] state; to have the list tile
 appear selected when the checkbox is checked, pass the same value to both.

 The checkbox is shown on the right by default in left-to-right languages
 (i.e. the trailing edge). This can be changed using [controlAffinity]. The
 [secondary] widget is placed on the opposite side. This maps to the
 [ListTile.leading] and [ListTile.trailing] properties of [ListTile].

 This widget requires a [Material] widget ancestor in the tree to paint
 itself on, which is typically provided by the app's [Scaffold].
 The [tileColor], and [selectedTileColor] are not painted by the
 [CheckboxListTile] itself but by the [Material] widget ancestor.
 In this case, one can wrap a [Material] widget around the [CheckboxListTile],
 e.g.:

 
 ```dart
 ColoredBox(
   color: Colors.green,
   child: Material(
     child: CheckboxListTile(
       tileColor: Colors.red,
       title: const Text('CheckboxListTile with red background'),
       value: true,
       onChanged:(bool? value) ,
     ),
   ),
 )
 ```
 

 ## Performance considerations when wrapping [CheckboxListTile] with [Material]

 Wrapping a large number of [CheckboxListTile]s individually with [Material]s
 is expensive. Consider only wrapping the [CheckboxListTile]s that require it
 or include a common [Material] ancestor where possible.

 To show the [CheckboxListTile] as disabled, pass null as the [onChanged]
 callback.

 
 ![CheckboxListTile sample](https://flutter.github.io/assets-for-api-docs/assets/material/checkbox_list_tile.png)

 This widget shows a checkbox that, when checked, slows down all animations
 (including the animation of the checkbox itself getting checked!).

 This sample requires that you also import 'package:flutter/scheduler.dart',
 so that you can reference [timeDilation].

 ** See code in examples/api/lib/material/checkbox_list_tile/checkbox_list_tile.0.dart **
 

 
 This sample demonstrates how [CheckboxListTile] positions the checkbox widget
 relative to the text in different configurations.

 ** See code in examples/api/lib/material/checkbox_list_tile/checkbox_list_tile.1.dart **
 

 ## Semantics in CheckboxListTile

 Since the entirety of the CheckboxListTile is interactive, it should represent
 itself as a single interactive entity.

 To do so, a CheckboxListTile widget wraps its children with a [MergeSemantics]
 widget. [MergeSemantics] will attempt to merge its descendant [Semantics]
 nodes into one node in the semantics tree. Therefore, CheckboxListTile will
 throw an error if any of its children requires its own [Semantics] node.

 For example, you cannot nest a [RichText] widget as a descendant of
 CheckboxListTile. [RichText] has an embedded gesture recognizer that
 requires its own [Semantics] node, which directly conflicts with
 CheckboxListTile's desire to merge all its descendants' semantic nodes
 into one. Therefore, it may be necessary to create a custom radio tile
 widget to accommodate similar use cases.

 
 ![Checkbox list tile semantics sample](https://flutter.github.io/assets-for-api-docs/assets/material/checkbox_list_tile_semantics.png)

 Here is an example of a custom labeled checkbox widget, called
 LinkedLabelCheckbox, that includes an interactive [RichText] widget that
 handles tap gestures.

 ** See code in examples/api/lib/material/checkbox_list_tile/custom_labeled_checkbox.0.dart **
 

 ## CheckboxListTile isn't exactly what I want

 If the way CheckboxListTile pads and positions its elements isn't quite
 what you're looking for, you can create custom labeled checkbox widgets by
 combining [Checkbox] with other widgets, such as [Text], [Padding] and
 [InkWell].

 
 ![Custom checkbox list tile sample](https://flutter.github.io/assets-for-api-docs/assets/material/checkbox_list_tile_custom.png)

 Here is an example of a custom LabeledCheckbox widget, but you can easily
 make your own configurable widget.

 ** See code in examples/api/lib/material/checkbox_list_tile/custom_labeled_checkbox.1.dart **
 

 See also:

  * [ListTileTheme], which can be used to affect the style of list tiles,
    including checkbox list tiles.
  * [RadioListTile], a similar widget for radio buttons.
  * [SwitchListTile], a similar widget for switches.
  * [ListTile] and [Checkbox], the widgets from which this widget is made.

## Dependencies

- StatelessWidget

## Members

- **value**: `bool?`
  Whether this checkbox is checked.

- **onChanged**: `ValueChanged<bool?>?`
  Called when the value of the checkbox should change.

 The checkbox passes the new value to the callback but does not actually
 change state until the parent widget rebuilds the checkbox tile with the
 new value.

 If null, the checkbox will be displayed as disabled.

 

 The callback provided to [onChanged] should update the state of the parent
 [StatefulWidget] using the [State.setState] method, so that the parent
 gets rebuilt; for example:

 ```dart
 CheckboxListTile(
   value: _throwShotAway,
   onChanged: (bool? newValue) ,
   title: const Text('Throw away your shot'),
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

 If null, then the value of [CheckboxThemeData.mouseCursor] is used. If
 that is also null, then [WidgetStateMouseCursor.clickable] is used.

- **activeColor**: `Color?`
  The color to use when this checkbox is checked.

 Defaults to [ColorScheme.secondary] of the current [Theme].

- **fillColor**: `MaterialStateProperty<Color?>?`
  The color that fills the checkbox.

 Resolves in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.disabled].

 If null, then the value of [activeColor] is used in the selected
 state. If that is also null, the value of [CheckboxThemeData.fillColor]
 is used. If that is also null, then the default value is used.

- **checkColor**: `Color?`
  The color to use for the check icon when this checkbox is checked.

 Defaults to Color(0xFFFFFFFF).

- **hoverColor**: `Color?`
  

- **overlayColor**: `MaterialStateProperty<Color?>?`
  The color for the checkbox's [Material].

 Resolves in the following states:
  * [WidgetState.pressed].
  * [WidgetState.selected].
  * [WidgetState.hovered].

 If null, then the value of [activeColor] with alpha [kRadialReactionAlpha]
 and [hoverColor] is used in the pressed and hovered state. If that is also null,
 the value of [CheckboxThemeData.overlayColor] is used. If that is also null,
 then the default value is used in the pressed and hovered state.

- **splashRadius**: `double?`
  

 If null, then the value of [CheckboxThemeData.splashRadius] is used. If
 that is also null, then [kRadialReactionRadius] is used.

- **materialTapTargetSize**: `MaterialTapTargetSize?`
  

 Defaults to [MaterialTapTargetSize.shrinkWrap].

- **visualDensity**: `VisualDensity?`
  Defines how compact the list tile's layout will be.

 

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

- **shape**: `ShapeBorder?`
  

- **side**: `BorderSide?`
  

 The given value is passed directly to [Checkbox.side].

 If this property is null, then [CheckboxThemeData.side] of
 [ThemeData.checkboxTheme] is used. If that is also null, then the side
 will be width 2.

- **isError**: `bool`
  

 Defaults to false.

- **tileColor**: `Color?`
  

- **title**: `Widget?`
  The primary content of the list tile.

 Typically a [Text] widget.

- **subtitle**: `Widget?`
  Additional content displayed below the title.

 Typically a [Text] widget.

- **secondary**: `Widget?`
  A widget to display on the opposite side of the tile from the checkbox.

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
 [value] state. To have the list tile appear selected when the checkbox is
 checked, pass the same value to both.

 Normally, this property is left to its default value, false.

- **controlAffinity**: `ListTileControlAffinity?`
  Where to place the control relative to the text.

- **contentPadding**: `EdgeInsetsGeometry?`
  Defines insets surrounding the tile's contents.

 This value will surround the [Checkbox], [title], [subtitle], and [secondary]
 widgets in [CheckboxListTile].

 When the value is null, the [contentPadding] is `EdgeInsets.symmetric(horizontal: 16.0)`.

- **tristate**: `bool`
  If true the checkbox's [value] can be true, false, or null.

 Checkbox displays a dash when its value is null.

 When a tri-state checkbox ([tristate] is true) is tapped, its [onChanged]
 callback will be applied to true if the current value is false, to null if
 value is true, and to false if value is null (i.e. it cycles through false
 => true => null => false when tapped).

 If tristate is false (the default), [value] must not be null.

- **checkboxShape**: `OutlinedBorder?`
  

 If this property is null then [CheckboxThemeData.shape] of [ThemeData.checkboxTheme]
 is used. If that's null then the shape will be a [RoundedRectangleBorder]
 with a circular corner radius of 1.0.

- **selectedTileColor**: `Color?`
  If non-null, defines the background color when [CheckboxListTile.selected] is true.

- **onFocusChange**: `ValueChanged&lt;bool&gt;?`
  

- **enableFeedback**: `bool?`
  

 See also:

  * [Feedback] for providing platform-specific feedback to certain actions.

- **enabled**: `bool?`
  Whether the CheckboxListTile is interactive.

 If false, this list tile is styled with the disabled color from the
 current [Theme] and the [ListTile.onTap] callback is
 inoperative.

- **internalAddSemanticForOnTap**: `bool`
  Whether to add button:true to the semantics if onTap is provided.
 This is a temporary flag to help changing the behavior of ListTile onTap semantics.

- **checkboxScaleFactor**: `double`
  Controls the scaling factor applied to the [Checkbox] within the [CheckboxListTile].

 Defaults to 1.0.

- **checkboxSemanticLabel**: `String?`
  

- **_checkboxType**: `_CheckboxType`
## Constructors

### Unnamed Constructor
Creates a combination of a list tile and a checkbox.

 The checkbox tile itself does not maintain any state. Instead, when the
 state of the checkbox changes, the widget calls the [onChanged] callback.
 Most widgets that use a checkbox will listen for the [onChanged] callback
 and rebuild the checkbox tile with a new [value] to update the visual
 appearance of the checkbox.

 The following arguments are required:

 * [value], which determines whether the checkbox is checked. The [value]
   can only be null if [tristate] is true.
 * [onChanged], which is called when the value of the checkbox should
   change. It can be set to null to disable the checkbox.

### adaptive
Creates a combination of a list tile and a platform adaptive checkbox.

 The checkbox uses [Checkbox.adaptive] to show a [CupertinoCheckbox] for
 iOS platforms, or [Checkbox] for all others.

 All other properties are the same as [CheckboxListTile].

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
