# Method: `updateMagnifier`

## Description


 Update the current magnifier with new selection data, so the magnifier
 can respond accordingly.

 If the magnifier is not shown, this still updates the magnifier position
 because the magnifier may have hidden itself and is looking for a cue to reshow
 itself.

 If there is no magnifier in the overlay, this does nothing.
 

## Return Type
`void`

## Parameters

- `magnifierInfo`: `MagnifierInfo`
