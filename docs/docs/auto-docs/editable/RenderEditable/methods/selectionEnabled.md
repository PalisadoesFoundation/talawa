# Method: `selectionEnabled`

## Description

Whether interactive selection are enabled based on the values of
 [enableInteractiveSelection] and [obscureText].

 Since [RenderEditable] does not handle selection manipulation
 itself, this actually only affects whether the accessibility
 hints provided to the system (via
 [describeSemanticsConfiguration]) will enable selection
 manipulation. It's the responsibility of this object's owner
 to provide selection manipulation affordances.

 By default, [enableInteractiveSelection] is null, [obscureText] is false,
 and this getter returns true.

 If [enableInteractiveSelection] is null and [obscureText] is true, then this
 getter returns false. This is the common case for password fields.

 If [enableInteractiveSelection] is non-null then its value is
 returned. An application might [enableInteractiveSelection] to
 true to enable interactive selection for a password field, or to
 false to unconditionally disable interactive selection.

## Return Type
`bool`

