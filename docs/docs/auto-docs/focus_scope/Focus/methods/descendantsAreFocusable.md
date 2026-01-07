# Method: `descendantsAreFocusable`

## Description


 If false, will make this widget's descendants unfocusable.

 Defaults to true. Does not affect focusability of this node (just its
 descendants): for that, use [FocusNode.canRequestFocus].

 If any descendants are focused when this is set to false, they will be
 unfocused. When [descendantsAreFocusable] is set to true again, they will
 not be refocused, although they will be able to accept focus again.

 Does not affect the value of [FocusNode.canRequestFocus] on the
 descendants.

 If a descendant node loses focus when this value is changed, the focus
 will move to the scope enclosing this node.

 See also:

 * [ExcludeFocus], a widget that uses this property to conditionally
   exclude focus for a subtree.
 * [descendantsAreTraversable], which makes this widget's descendants
   untraversable.
 * [ExcludeFocusTraversal], a widget that conditionally excludes focus
   traversal for a subtree.
 * [FocusTraversalGroup], a widget used to group together and configure the
   focus traversal policy for a widget subtree that has a
   `descendantsAreFocusable` parameter to conditionally block focus for a
   subtree.
 

## Return Type
`bool`

