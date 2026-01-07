# Method: `skipTraversal`

## Description

Sets the [FocusNode.skipTraversal] flag on the focus node so that it won't
 be visited by the [FocusTraversalPolicy].

 This is sometimes useful if a [Focus] widget should receive key events as
 part of the focus chain, but shouldn't be accessible via focus traversal.

 This is different from [FocusNode.canRequestFocus] because it only implies
 that the widget can't be reached via traversal, not that it can't be
 focused. It may still be focused explicitly.

## Return Type
`bool`

