# Method: `sizedByParent`

## Description

Whether the constraints are the only input to the sizing algorithm (in
 particular, child nodes have no impact).

 Returning false is always correct, but returning true can be more
 efficient when computing the size of this render object because we don't
 need to recompute the size if the constraints don't change.

 Typically, subclasses will always return the same value. If the value can
 change, then, when it does change, the subclass should make sure to call
 [markNeedsLayoutForSizedByParentChange].

 Subclasses that return true must not change the dimensions of this render
 object in [performLayout]. Instead, that work should be done by
 [performResize] or - for subclasses of [RenderBox] - in
 [RenderBox.computeDryLayout].

## Return Type
`bool`

