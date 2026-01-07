# Method: `afterData`

## Description

Returns an updated version of the [current] summary following a data event.

 Sub-classes must override this method to specify how the current summary
 is combined with the new data item in the fold computation.

## Return Type
`S`

## Parameters

- `current`: `S`
- `data`: `T`
