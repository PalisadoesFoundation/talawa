# Method: `rearrange`

## Description

Remove all the entries listed in the given iterable, then reinsert them
 into the overlay in the given order.

 Entries mention in `newEntries` but absent from the overlay are inserted
 as if with [insertAll].

 Entries not mentioned in `newEntries` but present in the overlay are
 positioned as a group in the resulting list relative to the entries that
 were moved, as specified by one of `below` or `above`, which, if
 specified, must be one of the entries in `newEntries`:

 If `below` is non-null, the group is positioned just below `below`.
 If `above` is non-null, the group is positioned just above `above`.
 Otherwise, the group is left on top, with all the rearranged entries
 below.

 It is an error to specify both `above` and `below`.

## Return Type
`void`

## Parameters

- `newEntries`: `Iterable&lt;OverlayEntry&gt;`
- ``: `dynamic`
- ``: `dynamic`
