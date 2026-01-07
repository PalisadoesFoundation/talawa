# Method: `canRequestFocus`

## Description


 If true, this widget may request the primary focus.

 Defaults to true. Set to false if you want the [FocusNode] this widget
 manages to do nothing when [FocusNode.requestFocus] is called on it. Does
 not affect the children of this node, and [FocusNode.hasFocus] can still
 return true if this node is the ancestor of the primary focus.

 This is different than [Focus.skipTraversal] because [Focus.skipTraversal]
 still allows the widget to be focused, just not traversed to.

 Setting [FocusNode.canRequestFocus] to false implies that the widget will
 also be skipped for traversal purposes.

 See also:

 * [FocusTraversalGroup], a widget that sets the traversal policy for its
   descendants.
 * [FocusTraversalPolicy], a class that can be extended to describe a
   traversal policy.
 

## Return Type
`bool`

