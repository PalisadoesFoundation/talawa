# Overview for `CupertinoPicker`

## Description

An iOS-styled picker.

 Displays its children widgets on a wheel for selection and
 calls back when the currently selected item changes.

 By default, the first child in `children` will be the initially selected child.
 The index of a different child can be specified in [scrollController], to make
 that child the initially selected child.

 Can be used with [showCupertinoModalPopup] to display the picker modally at the
 bottom of the screen. When calling [showCupertinoModalPopup], be sure to set
 `semanticsDismissible` to true to enable dismissing the modal via semantics.

 Sizes itself to its parent. All children are sized to the same size based
 on [itemExtent].

 By default, descendent texts are shown with [CupertinoTextThemeData.pickerTextStyle].

 
 This example shows a [CupertinoPicker] that displays a list of fruits on a wheel for
 selection.

 ** See code in examples/api/lib/cupertino/picker/cupertino_picker.0.dart **
 

 See also:

  * [ListWheelScrollView], the generic widget backing this picker without
    the iOS design specific chrome.
  * <https://developer.apple.com/design/human-interface-guidelines/pickers/>

## Dependencies

- StatefulWidget

## Members

- **diameterRatio**: `double`
  Relative ratio between this picker's height and the simulated cylinder's diameter.

 Smaller values creates more pronounced curvatures in the scrollable wheel.

 For more details, see [ListWheelScrollView.diameterRatio].

 Defaults to 1.1 to visually mimic iOS.

- **backgroundColor**: `Color?`
  Background color behind the children.

 Defaults to null, which disables background painting entirely.
 (i.e. the picker is going to have a completely transparent background), to match
 the native UIPicker and UIDatePicker.

 Any alpha value less 255 (fully opaque) will cause the removal of the
 wheel list edge fade gradient from rendering of the widget.

- **offAxisFraction**: `double`
  

- **useMagnifier**: `bool`
  

- **magnification**: `double`
  

- **scrollController**: `FixedExtentScrollController?`
  A [FixedExtentScrollController] to read and control the current item, and
 to set the initial item.

 If null, an implicit one will be created internally.

- **itemExtent**: `double`
  
 The uniform height of all children.

 All children will be given the [BoxConstraints] to match this exact
 height. Must be a positive value.
 

- **squeeze**: `double`
  

 Defaults to `1.45` to visually mimic iOS.

- **onSelectedItemChanged**: `ValueChanged&lt;int&gt;?`
  An option callback when the currently centered item changes.

 Value changes when the item closest to the center changes.

 This can be called during scrolls and during ballistic flings. To get the
 value only when the scrolling settles, use a [NotificationListener],
 listen for [ScrollEndNotification] and read its [FixedExtentMetrics].

- **childDelegate**: `ListWheelChildDelegate`
  A delegate that lazily instantiates children.

- **selectionOverlay**: `Widget?`
  A widget overlaid on the picker to highlight the currently selected entry.

 The [selectionOverlay] widget drawn above the [CupertinoPicker]'s picker
 wheel.
 It is vertically centered in the picker and is constrained to have the
 same height as the center row.

 If unspecified, it defaults to a [CupertinoPickerDefaultSelectionOverlay]
 which is a gray rounded rectangle overlay in iOS 14 style.
 This property can be set to null to remove the overlay.

## Constructors

### Unnamed Constructor
Creates a picker from a concrete list of children.

 The [itemExtent] must be greater than zero.

 The [backgroundColor] defaults to null, which disables background painting entirely.
 (i.e. the picker is going to have a completely transparent background), to match
 the native UIPicker and UIDatePicker. Also, if it has transparency, no gradient
 effect will be rendered.

 The [scrollController] argument can be used to specify a custom
 [FixedExtentScrollController] for programmatically reading or changing
 the current picker index or for selecting an initial index value.

 The [looping] argument decides whether the child list loops and can be
 scrolled infinitely. If set to true, scrolling past the end of the list
 will loop the list back to the beginning. If set to false, the list will
 stop scrolling when you reach the end or the beginning.

### builder
Creates a picker from an [IndexedWidgetBuilder] callback where the builder
 is dynamically invoked during layout.

 A child is lazily created when it starts becoming visible in the viewport.
 All of the children provided by the builder are cached and reused, so
 normally the builder is only called once for each index (except when
 rebuilding - the cache is cleared).

 The [childCount] argument reflects the number of children that will be
 provided by the [itemBuilder].
 

 The [itemExtent] argument must be positive.

 The [backgroundColor] defaults to null, which disables background painting entirely.
 (i.e. the picker is going to have a completely transparent background), to match
 the native UIPicker and UIDatePicker.

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
