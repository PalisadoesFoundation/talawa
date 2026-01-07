# Method: `dispose`

## Description

Discards any resources used by this [OverlayEntry].

 This method must be called after [remove] if the [OverlayEntry] is
 inserted into an [Overlay].

 After this is called, the object is not in a usable state and should be
 discarded (calls to [addListener] will throw after the object is disposed).
 However, the listeners registered may not be immediately released until
 the widget built using this [OverlayEntry] is unmounted from the widget
 tree.

 This method should only be called by the object's owner.

## Return Type
`void`

