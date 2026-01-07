# Method: `layout`

## Description

Compute the layout for this render object.

 This method is the main entry point for parents to ask their children to
 update their layout information. The parent passes a constraints object,
 which informs the child as to which layouts are permissible. The child is
 required to obey the given constraints.

 If the parent reads information computed during the child's layout, the
 parent must pass true for `parentUsesSize`. In that case, the parent will
 be marked as needing layout whenever the child is marked as needing layout
 because the parent's layout information depends on the child's layout
 information. If the parent uses the default value (false) for
 `parentUsesSize`, the child can change its layout information (subject to
 the given constraints) without informing the parent.

 Subclasses should not override [layout] directly. Instead, they should
 override [performResize] and/or [performLayout]. The [layout] method
 delegates the actual work to [performResize] and [performLayout].

 The parent's [performLayout] method should call the [layout] of all its
 children unconditionally. It is the [layout] method's responsibility (as
 implemented here) to return early if the child does not need to do any
 work to update its layout information.

## Return Type
`void`

## Parameters

- `constraints`: `Constraints`
- ``: `dynamic`
