# Method: `build`

## Description

Adds a placeholder box to the paragraph builder if a size has been
 calculated for the widget.

 Sizes are provided through `dimensions`, which should contain a 1:1
 in-order mapping of widget to laid-out dimensions. If no such dimension
 is provided, the widget will be skipped.

 The `textScaler` will be applied to the laid-out size of the widget.

## Return Type
`void`

## Parameters

- `builder`: `ui.ParagraphBuilder`
- ``: `dynamic`
- ``: `dynamic`
