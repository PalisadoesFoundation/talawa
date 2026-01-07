# Method: `initWithValue`

## Description

Called by the [RestorationMixin] with the `value` returned by either
 [createDefaultValue] or [fromPrimitives] to set the value that this
 property currently wraps.

 The [initWithValue] method may be called multiple times throughout the
 life of the [RestorableProperty] whenever new restoration data has been
 provided to the [RestorationMixin] the property is registered to. When
 [initWithValue] is called, the property should forget its previous value
 and re-initialize itself to the newly provided `value`.

## Return Type
`void`

## Parameters

- `value`: `T`
