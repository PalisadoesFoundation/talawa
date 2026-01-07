# Method: `setPlaceholderDimensions`

## Description

Sets the dimensions of each placeholder in [text].

 The number of [PlaceholderDimensions] provided should be the same as the
 number of [PlaceholderSpan]s in text. Passing in an empty or null `value`
 will do nothing.

 If [layout] is attempted without setting the placeholder dimensions, the
 placeholders will be ignored in the text layout and no valid
 [inlinePlaceholderBoxes] will be returned.

## Return Type
`void`

## Parameters

- `value`: `List&lt;PlaceholderDimensions&gt;?`
