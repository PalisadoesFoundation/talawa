# Overview for `AbstractNode`

## Description

Deprecated. Unused by the framework and will be removed in a future version
 of Flutter. If needed, inline any required functionality of this class
 directly in the subclass.

 An abstract node in a tree.

 AbstractNode has as notion of depth, attachment, and parent, but does not
 have a model for children.

 When a subclass is changing the parent of a child, it should call either
 `parent.adoptChild(child)` or `parent.dropChild(child)` as appropriate.
 Subclasses can expose an API for manipulating the tree if desired (e.g. a
 setter for a `child` property, or an `` method to manipulate a list).

 The current parent node is exposed by the [parent] property.

 The current attachment state is exposed by [attached]. The root of any tree
 that is to be considered attached should be manually attached by calling
 [attach]. Other than that, the [attach] and [detach] methods should not be
 called directly; attachment is managed automatically by the aforementioned
 [adoptChild] and [dropChild] methods.

 Subclasses that have children must override [attach] and [detach] as
 described in the documentation for those methods.

 Nodes always have a [depth] greater than their ancestors'. There's no
 guarantee regarding depth between siblings. The depth of a node is used to
 ensure that nodes are processed in depth order. The [depth] of a child can
 be more than one greater than the [depth] of the parent, because the [depth]
 values are never decreased: all that matters is that it's greater than the
 parent. Consider a tree with a root node A, a child B, and a grandchild C.
 Initially, A will have [depth] 0, B [depth] 1, and C [depth] 2. If C is
 moved to be a child of A, sibling of B, then the numbers won't change. C's
 [depth] will still be 2. The [depth] is automatically maintained by the
 [adoptChild] and [dropChild] methods.

## Members

- **_depth**: `int`
- **_owner**: `Object?`
- **_parent**: `AbstractNode?`
