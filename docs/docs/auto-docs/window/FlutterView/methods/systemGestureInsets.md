# Method: `systemGestureInsets`

## Description

The number of physical pixels on each side of the display rectangle into
 which the view can render, but where the operating system will consume
 input gestures for the sake of system navigation.

 For example, an operating system might use the vertical edges of the
 screen, where swiping inwards from the edges takes users backward
 through the history of screens they previously visited.

 When this property changes, [PlatformDispatcher.onMetricsChanged] is called.

 See also:

  * [WidgetsBindingObserver], for a mechanism at the widgets layer to
    observe when this value changes.
  * [MediaQuery.of], a simpler mechanism for the same.

## Return Type
`ViewPadding`

