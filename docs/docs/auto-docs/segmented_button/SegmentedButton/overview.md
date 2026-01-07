# Overview for `SegmentedButton`

## Description

A Material button that allows the user to select from limited set of options.

 Segmented buttons are used to help people select options, switch views, or
 sort elements. They are typically used in cases where there are only 2-5
 options.

 The options are represented by segments described with [ButtonSegment]
 entries in the [segments] field. Each segment has a [ButtonSegment.value]
 that is used to indicate which segments are selected.

 The [selected] field is a set of selected [ButtonSegment.value]s. This
 should be updated by the app in response to [onSelectionChanged] updates.

 By default, only a single segment can be selected (for mutually exclusive
 choices). This can be relaxed with the [multiSelectionEnabled] field.

 Like [ButtonStyleButton]s, the [SegmentedButton]'s visuals can be
 configured with a [ButtonStyle] [style] field. However, unlike other
 buttons, some of the style parameters are applied to the entire segmented
 button, and others are used for each of the segments.

 By default, a checkmark icon is used to show selected items. To configure
 this behavior, you can use the [showSelectedIcon] and [selectedIcon] fields.

 Individual segments can be enabled or disabled with their
 [ButtonSegment.enabled] flag. If the [onSelectionChanged] field is null,
 then the entire segmented button will be disabled, regardless of the
 individual segment settings.

 
 This sample shows how to display a [SegmentedButton] with either a single or
 multiple selection.

 ** See code in examples/api/lib/material/segmented_button/segmented_button.0.dart **
 

 
 This sample showcases how to customize [SegmentedButton] using [SegmentedButton.styleFrom].

 ** See code in examples/api/lib/material/segmented_button/segmented_button.1.dart **
 

 See also:

   * Material Design spec: <https://m3.material.io/components/segmented-buttons/overview>
   * [ButtonStyle], which can be used in the [style] field to configure
     the appearance of the button and its segments.
   * [ToggleButtons], a similar widget that was built for Material 2.
     [SegmentedButton] should be considered as a replacement for
     [ToggleButtons].
   * [Radio], an alternative way to present the user with a mutually exclusive set of options.
   * [FilterChip], [ChoiceChip], which can be used when you need to show more than five options.

## Dependencies

- StatefulWidget

## Members

- **segments**: `List&lt;ButtonSegment&lt;T&gt;&gt;`
  Descriptions of the segments in the button.

 This a required parameter and must contain at least one segment,
 but it is recommended to contain two to five segments. If you need only
 a single segment, consider using a [Checkbox] or [Radio] widget instead.
 If you need more than five options, consider using [FilterChip] or
 [ChoiceChip] widgets.

- **direction**: `Axis`
  The orientation of the button's [segments].

 If this is [Axis.vertical], the segments will be aligned vertically
 and the first item in [segments] will be on the top.

 Defaults to [Axis.horizontal].

- **selected**: `Set&lt;T&gt;`
  The set of [ButtonSegment.value]s that indicate which [segments] are
 selected.

 As the [SegmentedButton] does not maintain the state of the selection,
 you will need to update this in response to [onSelectionChanged] calls.

 This is a required parameter.

- **onSelectionChanged**: `void Function(Set&lt;T&gt;)?`
  The function that is called when the selection changes.

 The callback's parameter indicates which of the segments are selected.

 When the callback is null, the entire [SegmentedButton] is disabled,
 and will not respond to input.

 The default is null.

- **multiSelectionEnabled**: `bool`
  Determines if multiple segments can be selected at one time.

 If true, more than one segment can be selected. When selecting a
 segment, the other selected segments will stay selected. Selecting an
 already selected segment will unselect it.

 If false, only one segment may be selected at a time. When a segment
 is selected, any previously selected segment will be unselected.

 The default is false, so only a single segment may be selected at one
 time.

- **emptySelectionAllowed**: `bool`
  Determines if having no selected segments is allowed.

 If true, then it is acceptable for none of the segments to be selected.
 This means that [selected] can be empty. If the user taps on a
 selected segment, it will be removed from the selection set passed into
 [onSelectionChanged].

 If false (the default), there must be at least one segment selected. If
 the user taps on the only selected segment it will not be deselected, and
 [onSelectionChanged] will not be called.

- **expandedInsets**: `EdgeInsets?`
  Determines the segmented button's size and padding based on [expandedInsets].

 If null (default), the button adopts its intrinsic content size. When specified,
 the button expands to fill its parent's space, with the [EdgeInsets]
 defining the padding.

- **style**: `ButtonStyle?`
  Customizes this button's appearance.

 The following style properties apply to the entire segmented button:

   * [ButtonStyle.shadowColor]
   * [ButtonStyle.elevation]
   * [ButtonStyle.side] - which is used for both the outer shape and
     dividers between segments.
   * [ButtonStyle.shape]

 The following style properties are applied to each of the individual
 button segments. For properties that are a [WidgetStateProperty],
 they will be resolved with the current state of the segment:

   * [ButtonStyle.textStyle]
   * [ButtonStyle.backgroundColor]
   * [ButtonStyle.foregroundColor]
   * [ButtonStyle.overlayColor]
   * [ButtonStyle.surfaceTintColor]
   * [ButtonStyle.elevation]
   * [ButtonStyle.padding]
   * [ButtonStyle.iconColor]
   * [ButtonStyle.iconSize]
   * [ButtonStyle.mouseCursor]
   * [ButtonStyle.visualDensity]
   * [ButtonStyle.tapTargetSize]
   * [ButtonStyle.animationDuration]
   * [ButtonStyle.enableFeedback]
   * [ButtonStyle.alignment]
   * [ButtonStyle.splashFactory]

- **showSelectedIcon**: `bool`
  Determines if the [selectedIcon] (usually an icon using [Icons.check])
 is displayed on the selected segments.

 If true, the [selectedIcon] will be displayed at the start of the segment.
 If both the [ButtonSegment.label] and [ButtonSegment.icon] are provided,
 then the icon will be replaced with the [selectedIcon]. If only the icon
 or the label is present then the [selectedIcon] will be shown at the start
 of the segment.

 If false, then the [selectedIcon] is not used and will not be displayed
 on selected segments.

 The default is true, meaning the [selectedIcon] will be shown on selected
 segments.

- **selectedIcon**: `Widget?`
  An icon that is used to indicate a segment is selected.

 If [showSelectedIcon] is true then for selected segments this icon
 will be shown before the [ButtonSegment.label], replacing the
 [ButtonSegment.icon] if it is specified.

 Defaults to an [Icon] with [Icons.check].

## Constructors

### Unnamed Constructor
Creates a const [SegmentedButton].

 [segments] must contain at least one segment, but it is recommended
 to have two to five segments. If you need only single segment,
 consider using a [Checkbox] or [Radio] widget instead. If you need
 more than five options, consider using [FilterChip] or [ChoiceChip]
 widgets.

 If [onSelectionChanged] is null, then the entire segmented button will
 be disabled.

 By default [selected] must only contain one entry. However, if
 [multiSelectionEnabled] is true, then [selected] can contain multiple
 entries. If [emptySelectionAllowed] is true, then [selected] can be empty.

