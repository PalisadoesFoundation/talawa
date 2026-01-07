# Method: `overlayEntries`

## Description

The overlay entries of this route.

 These are typically populated by [install]. The [Navigator] is in charge
 of adding them to and removing them from the [Overlay].

 There must be at least one entry in this list after [install] has been
 invoked.

 The [Navigator] will take care of keeping the entries together if the
 route is moved in the history.

## Return Type
`List&lt;OverlayEntry&gt;`

