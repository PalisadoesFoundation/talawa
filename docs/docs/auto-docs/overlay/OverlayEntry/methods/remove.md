# Method: `remove`

## Description

Remove this entry from the overlay.

 This should only be called once.

 This method removes this overlay entry from the overlay immediately. The
 UI will be updated in the same frame if this method is called before the
 overlay rebuild in this frame; otherwise, the UI will be updated in the
 next frame. This means that it is safe to call during builds, but also
 that if you do call this after the overlay rebuild, the UI will not update
 until the next frame (i.e. many milliseconds later).

## Return Type
`void`

