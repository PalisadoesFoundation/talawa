# Method: `markParentNeedsLayout`

## Description

Mark this render object's layout information as dirty, and then defer to
 the parent.

 This function should only be called from [markNeedsLayout] or
 [markNeedsLayoutForSizedByParentChange] implementations of subclasses that
 introduce more reasons for deferring the handling of dirty layout to the
 parent. See [markNeedsLayout] for details.

 Only call this if [parent] is not null.

## Return Type
`void`

