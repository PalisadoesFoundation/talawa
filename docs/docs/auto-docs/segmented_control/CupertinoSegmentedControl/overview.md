# Overview for `CupertinoSegmentedControl`

## Description

An iOS-style segmented control.

 Displays the widgets provided in the [Map] of [children] in a
 horizontal list. Used to select between a number of mutually exclusive
 options. When one option in the segmented control is selected, the other
 options in the segmented control cease to be selected.

 A segmented control can feature any [Widget] as one of the values in its
 [Map] of [children]. The type T is the type of the keys used
 to identify each widget and determine which widget is selected. As
 required by the [Map] class, keys must be of consistent types
 and must be comparable. The ordering of the keys will determine the order
 of the widgets in the segmented control.

 When the state of the segmented control changes, the widget calls the
 [onValueChanged] callback. The map key associated with the newly selected
 widget is returned in the [onValueChanged] callback. Typically, widgets
 that use a segmented control will listen for the [onValueChanged] callback
 and rebuild the segmented control with a new [groupValue] to update which
 option is currently selected.

 The [children] will be displayed in the order of the keys in the [Map].
 The height of the segmented control is determined by the height of the
 tallest widget provided as a value in the [Map] of [children].
 The width of each child in the segmented control will be equal to the width
 of widest child, unless the combined width of the children is wider than
 the available horizontal space. In this case, the available horizontal space
 is divided by the number of provided [children] to determine the width of
 each widget. The selection area for each of the widgets in the [Map] of
 [children] will then be expanded to fill the calculated space, so each
 widget will appear to have the same dimensions.

 A segmented control may optionally be created with custom colors. The
 [unselectedColor], [selectedColor], [borderColor], and [pressedColor]
 arguments can be used to override the segmented control's colors from
 [CupertinoTheme] defaults. The [disabledColor] and [disabledTextColor]
 set the background and text colors of the segment when it is disabled.

 The segmented control can be disabled by adding children to the [Set] of
 [disabledChildren]. If the child is not present in the [Set], it is enabled
 by default.

 
 This example shows a [CupertinoSegmentedControl] with an enum type.

 The callback provided to [onValueChanged] should update the state of
 the parent [StatefulWidget] using the [State.setState] method, so that
 the parent gets rebuilt.

 This example also demonstrates how to use the [disabledChildren] property by
 toggling each [CupertinoSwitch] to enable or disable the segments.

 ** See code in examples/api/lib/cupertino/segmented_control/cupertino_segmented_control.0.dart **
 

 See also:

  * [CupertinoSegmentedControl], a segmented control widget in the style used
    up until iOS 13.
  * <https://developer.apple.com/design/human-interface-guidelines/ios/controls/segmented-controls/>

## Dependencies

- StatefulWidget

## Members

- **children**: `Map&lt;T, Widget&gt;`
  The identifying keys and corresponding widget values in the
 segmented control.

 The map must have more than one entry.
 This attribute must be an ordered [Map] such as a [LinkedHashMap].

- **groupValue**: `T?`
  The identifier of the widget that is currently selected.

 This must be one of the keys in the [Map] of [children].
 If this attribute is null, no widget will be initially selected.

- **onValueChanged**: `ValueChanged&lt;T&gt;`
  The callback that is called when a new option is tapped.

 The segmented control passes the newly selected widget's associated key
 to the callback but does not actually change state until the parent
 widget rebuilds the segmented control with the new [groupValue].

- **unselectedColor**: `Color?`
  The color used to fill the backgrounds of unselected widgets and as the
 text color of the selected widget.

 Defaults to [CupertinoTheme]'s `primaryContrastingColor` if null.

- **selectedColor**: `Color?`
  The color used to fill the background of the selected widget and as the text
 color of unselected widgets.

 Defaults to [CupertinoTheme]'s `primaryColor` if null.

- **borderColor**: `Color?`
  The color used as the border around each widget.

 Defaults to [CupertinoTheme]'s `primaryColor` if null.

- **pressedColor**: `Color?`
  The color used to fill the background of the widget the user is
 temporarily interacting with through a long press or drag.

 Defaults to the selectedColor at 20% opacity if null.

- **disabledColor**: `Color?`
  The color used to fill the background of the segment when it is disabled.

 If null, this color will be 50% opacity of the [selectedColor] when
 the segment is selected. If the segment is unselected, this color will be
 set to [unselectedColor].

- **disabledTextColor**: `Color?`
  The color used for the text of the segment when it is disabled.

- **padding**: `EdgeInsetsGeometry?`
  The CupertinoSegmentedControl will be placed inside this padding.

 Defaults to EdgeInsets.symmetric(horizontal: 16.0)

- **disabledChildren**: `Set&lt;T&gt;`
  The set of identifying keys that correspond to the segments that should be disabled.

 All segments are enabled by default.

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

