# Method: `onPopInvoked`

## Description

Called after a route pop was handled.

 Even when the pop is canceled, for example by a [PopScope] widget, this
 will still be called. The `didPop` parameter indicates whether or not the
 back navigation actually happened successfully.

## Return Type
`void`

## Parameters

- `didPop`: `bool`
