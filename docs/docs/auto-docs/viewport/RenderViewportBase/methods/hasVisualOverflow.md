# Method: `hasVisualOverflow`

## Description

Whether the contents of this viewport would paint outside the bounds of
 the viewport if [paint] did not clip.

 This property enables an optimization whereby [paint] can skip apply a
 clip of the contents of the viewport are known to paint entirely within
 the bounds of the viewport.

## Return Type
`bool`

