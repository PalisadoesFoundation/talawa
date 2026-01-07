# Overview for `CupertinoSlidingSegmentedControl`

## Description

An iOS 13 style segmented control.

 Displays the widgets provided in the [Map] of [children] in a horizontal list.
 It allows the user to select between a number of mutually exclusive options,
 by tapping or dragging within the segmented control.

 A segmented control can feature any [Widget] as one of the values in its
 [Map] of [children]. The type T is the type of the [Map] keys used to identify
 each widget and determine which widget is selected. As required by the [Map]
 class, keys must be of consistent types and must be comparable. The [children]
 argument must be an ordered [Map] such as a [LinkedHashMap], the ordering of
 the keys will determine the order of the widgets in the segmented control.

 The widget calls the [onValueChanged] callback *when a valid user gesture
 completes on an unselected segment*. The map key associated with the newly
 selected widget is returned in the [onValueChanged] callback. Typically,
 widgets that use a segmented control will listen for the [onValueChanged]
 callback and rebuild the segmented control with a new [groupValue] to update
 which option is currently selected.

 The [children] will be displayed in the order of the keys in the [Map],
 along the current [TextDirection]. Each child widget will have the same size.
 The height of the segmented control is determined by the height of the
 tallest child widget. The width of each child will be the intrinsic width of
 the widest child, or the available horizontal space divided by the number of
 [children], which ever is smaller.

 A segmented control may optionally be created with custom colors. The
 [thumbColor], [backgroundColor] arguments can be used to override the
 segmented control's colors from its defaults.

 
 This example shows a [CupertinoSlidingSegmentedControl] with an enum type.

 The callback provided to [onValueChanged] should update the state of
 the parent [StatefulWidget] using the [State.setState] method, so that
 the parent gets rebuilt; for example:

 ** See code in examples/api/lib/cupertino/segmented_control/cupertino_sliding_segmented_control.0.dart **
 
 See also:

  * <https://developer.apple.com/design/human-interface-guidelines/ios/controls/segmented-controls/>

## Dependencies

- StatefulWidget

## Members

- **children**: `Map&lt;T, Widget&gt;`
  The identifying keys and corresponding widget values in the
 segmented control.

 This attribute must be an ordered [Map] such as a [LinkedHashMap]. Each
 widget is typically a single-line [Text] widget or an [Icon] widget.

 The map must have more than one entry.

- **disabledChildren**: `Set&lt;T&gt;`
  The set of identifying keys that correspond to the segments that should be
 disabled.

 Disabled children cannot be selected by dragging, but they can be selected
 programmatically. For example, if the [groupValue] is set to a disabled
 segment, the segment is still selected but the segment content looks disabled.

 If an enabled segment is selected by dragging gesture and becomes disabled
 before dragging finishes, [onValueChanged] will be triggered when finger is
 released and the disabled segment is selected.

 By default, all segments are selectable.

- **groupValue**: `T?`
  The identifier of the widget that is currently selected.

 This must be one of the keys in the [Map] of [children].
 If this attribute is null, no widget will be initially selected.

- **onValueChanged**: `ValueChanged<T?>`
  The callback that is called when a new option is tapped.

 The segmented control passes the newly selected widget's associated key
 to the callback but does not actually change state until the parent
 widget rebuilds the segmented control with the new [groupValue].

 The callback provided to [onValueChanged] should update the state of
 the parent [StatefulWidget] using the [State.setState] method, so that
 the parent gets rebuilt; for example:

 

 ```dart
 class SegmentedControlExample extends StatefulWidget 

 class SegmentedControlExampleState extends State&lt;SegmentedControlExample&gt; 
 ```
 

- **backgroundColor**: `Color`
  The color used to paint the rounded rect behind the [children] and the separators.

 The default value is [CupertinoColors.tertiarySystemFill]. The background
 will not be painted if null is specified.

- **proportionalWidth**: `bool`
  Determine whether segments have proportional widths based on their content.

 If false, all segments will have the same width, determined by the longest
 segment. If true, each segment's width will be determined by its individual
 content.

 If the max width of parent constraints is smaller than the width that the
 segmented control needs, The segment widths will scale down proportionally
 to ensure the segment control fits within the boundaries; similarly, if
 the min width of parent constraints is larger, the segment width will scales
 up to meet the min width requirement.

 Defaults to false.

- **thumbColor**: `Color`
  The color used to paint the interior of the thumb that appears behind the
 currently selected item.

 The default value is a [CupertinoDynamicColor] that appears white in light
 mode and becomes a gray color in dark mode.

- **padding**: `EdgeInsetsGeometry`
  The amount of space by which to inset the [children].

 Defaults to `EdgeInsets.symmetric(vertical: 2, horizontal: 3)`.

## Constructors

### Unnamed Constructor
Creates an iOS-style segmented control bar.

 The [children] argument must be an ordered [Map] such as a
 [LinkedHashMap]. Further, the length of the [children] list must be
 greater than one.

 Each widget value in the map of [children] must have an associated key
 that uniquely identifies this widget. This key is what will be returned
 in the [onValueChanged] callback when a new value from the [children] map
 is selected.

 The [groupValue] is the currently selected value for the segmented control.
 If no [groupValue] is provided, or the [groupValue] is null, no widget will
 appear as selected. The [groupValue] must be either null or one of the keys
 in the [children] map.

