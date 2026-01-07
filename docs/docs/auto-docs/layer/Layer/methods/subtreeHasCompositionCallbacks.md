# Method: `subtreeHasCompositionCallbacks`

## Description

Whether the subtree rooted at this layer has any composition callback
 observers.

 This only evaluates to true if the subtree rooted at this node has
 observers. For example, it may evaluate to true on a parent node but false
 on a child if the parent has observers but the child does not.

 See also:

   * [Layer.addCompositionCallback].

## Return Type
`bool`

