# Method: `ensureChildUpdated`

## Description

Ensures the [Selectable] child has received up to date selection event.

 This method is called when a new [Selectable] is added to the delegate,
 and its screen location falls into the previous selection.

 Subclasses are responsible for updating the selection of this newly added
 [Selectable].

## Return Type
`void`

## Parameters

- `selectable`: `Selectable`
