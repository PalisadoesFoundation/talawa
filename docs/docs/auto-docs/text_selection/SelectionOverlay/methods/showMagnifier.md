# Method: `showMagnifier`

## Description


 Shows the magnifier, and hides the toolbar if it was showing when [showMagnifier]
 was called. This is safe to call on platforms not mobile, since
 a magnifierBuilder will not be provided, or the magnifierBuilder will return null
 on platforms not mobile.

 This is NOT the source of truth for if the magnifier is up or not,
 since magnifiers may hide themselves. If this info is needed, check
 [MagnifierController.shown].
 

## Return Type
`void`

## Parameters

- `initialMagnifierInfo`: `MagnifierInfo`
