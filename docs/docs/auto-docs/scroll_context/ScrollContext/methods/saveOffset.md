# Method: `saveOffset`

## Description

Called by the [ScrollPosition] whenever scrolling ends to persist the
 provided scroll `offset` for state restoration purposes.

 The [ScrollContext] may pass the value back to a [ScrollPosition] by
 calling [ScrollPosition.restoreOffset] at a later point in time or after
 the application has restarted to restore the scroll offset.

## Return Type
`void`

## Parameters

- `offset`: `double`
