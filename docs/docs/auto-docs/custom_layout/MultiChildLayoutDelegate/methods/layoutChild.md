# Method: `layoutChild`

## Description

Ask the child to update its layout within the limits specified by
 the constraints parameter. The child's size is returned.

 Call this from your [performLayout] function to lay out each
 child. Every child must be laid out using this function exactly
 once each time the [performLayout] function is called.

## Return Type
`Size`

## Parameters

- `childId`: `Object`
- `constraints`: `BoxConstraints`
