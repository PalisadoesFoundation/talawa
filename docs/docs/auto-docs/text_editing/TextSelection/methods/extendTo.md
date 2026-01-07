# Method: `extendTo`

## Description

Keeping the selection's [TextSelection.baseOffset] fixed, pivot the
 [TextSelection.extentOffset] to the given [TextPosition].

 In some cases, the [TextSelection.baseOffset] and
 [TextSelection.extentOffset] may flip during this operation, and/or the
 size of the selection may shrink.

 ## Difference with [expandTo]
 In contrast with this method, [expandTo] is strictly growth; the
 selection is grown to include the given [TextPosition] and will never
 shrink.

## Return Type
`TextSelection`

## Parameters

- `position`: `TextPosition`
