# Method: `depth`

## Description

The depth of this render object in the render tree.

 The depth of nodes in a tree monotonically increases as you traverse down
 the tree: a node always has a [depth] greater than its ancestors.
 There's no guarantee regarding depth between siblings.

 The [depth] of a child can be more than one greater than the [depth] of
 the parent, because the [depth] values are never decreased: all that
 matters is that it's greater than the parent. Consider a tree with a root
 node A, a child B, and a grandchild C. Initially, A will have [depth] 0,
 B [depth] 1, and C [depth] 2. If C is moved to be a child of A,
 sibling of B, then the numbers won't change. C's [depth] will still be 2.

 The depth of a node is used to ensure that nodes are processed in
 depth order.  The [depth] is automatically maintained by the [adoptChild]
 and [dropChild] methods.

## Return Type
`int`

