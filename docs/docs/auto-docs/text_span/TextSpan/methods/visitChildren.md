# Method: `visitChildren`

## Description

Walks this [TextSpan] and its descendants in pre-order and calls [visitor]
 for each span that has text.

 When `visitor` returns true, the walk will continue. When `visitor`
 returns false, then the walk will end.

## Return Type
`bool`

## Parameters

- `visitor`: `InlineSpanVisitor`
