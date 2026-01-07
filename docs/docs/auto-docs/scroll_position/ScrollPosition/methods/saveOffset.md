# Method: `saveOffset`

## Description

Called whenever scrolling ends, to persist the current scroll offset for
 state restoration purposes.

 The default implementation stores the current value of [pixels] on the
 [context] by calling [ScrollContext.saveOffset]. At a later point in time
 or after the application restarts, the [context] may restore the scroll
 position to the persisted offset by calling [restoreOffset].

## Return Type
`void`

