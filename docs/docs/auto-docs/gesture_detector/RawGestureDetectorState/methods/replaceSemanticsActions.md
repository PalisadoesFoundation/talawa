# Method: `replaceSemanticsActions`

## Description

This method can be called to filter the list of available semantic actions,
 after the render object was created.

 The actual filtering is happening in the next frame and a frame will be
 scheduled if non is pending.

 This is used by [Scrollable] to configure system accessibility tools so
 that they know in which direction a particular list can be scrolled.

 If this is never called, then the actions are not filtered. If the list of
 actions to filter changes, it must be called again.

## Return Type
`void`

## Parameters

- `actions`: `Set&lt;SemanticsAction&gt;`
