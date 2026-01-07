# Method: `descendantsAreTraversable`

## Description


 If false, will make this widget's descendants untraversable.

 Defaults to true. Does not affect traversability of this node (just its
 descendants): for that, use [FocusNode.skipTraversal].

 Does not affect the value of [FocusNode.skipTraversal] on the
 descendants. Does not affect focusability of the descendants.

 See also:

 * [ExcludeFocusTraversal], a widget that uses this property to
   conditionally exclude focus traversal for a subtree.
 * [descendantsAreFocusable], which makes this widget's descendants
   unfocusable.
 * [ExcludeFocus], a widget that conditionally excludes focus for a subtree.
 * [FocusTraversalGroup], a widget used to group together and configure the
   focus traversal policy for a widget subtree that has a
   `descendantsAreFocusable` parameter to conditionally block focus for a
   subtree.
 

## Return Type
`bool`

