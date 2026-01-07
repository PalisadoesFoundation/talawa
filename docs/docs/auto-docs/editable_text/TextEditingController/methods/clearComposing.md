# Method: `clearComposing`

## Description

Set the composing region to an empty range.

 The composing region is the range of text that is still being composed.
 Calling this function indicates that the user is done composing that
 region.

 Calling this will notify all the listeners of this [TextEditingController]
 that they need to update (it calls [notifyListeners]). For this reason,
 this method should only be called between frames, e.g. in response to user
 actions, not during the build, layout, or paint phases.

## Return Type
`void`

