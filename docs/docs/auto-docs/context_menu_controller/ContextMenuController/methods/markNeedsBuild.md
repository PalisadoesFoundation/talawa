# Method: `markNeedsBuild`

## Description

Cause the underlying [OverlayEntry] to rebuild during the next pipeline
 flush.

 It's necessary to call this function if the output of `contextMenuBuilder`
 has changed.

 Errors if the context menu is not currently shown.

 See also:

  * [OverlayEntry.markNeedsBuild]

## Return Type
`void`

