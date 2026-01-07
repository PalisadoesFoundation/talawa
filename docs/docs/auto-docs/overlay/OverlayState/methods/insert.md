# Method: `insert`

## Description

Insert the given entry into the overlay.

 If `below` is non-null, the entry is inserted just below `below`.
 If `above` is non-null, the entry is inserted just above `above`.
 Otherwise, the entry is inserted on top.

 It is an error to specify both `above` and `below`.

## Return Type
`void`

## Parameters

- `entry`: `OverlayEntry`
- ``: `dynamic`
- ``: `dynamic`
