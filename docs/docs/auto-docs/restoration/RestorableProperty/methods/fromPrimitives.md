# Method: `fromPrimitives`

## Description

Called by the [RestorationMixin] to convert the `data` previously
 retrieved from [toPrimitives] back into an object of type `T` that this
 property should wrap.

 The object returned by this method is passed to [initWithValue] to restore
 the value that this property is wrapping to the value described by the
 provided `data`.

 The method may be called multiple times throughout the life of the
 [RestorableProperty]. Whenever new restoration data has been provided to
 the [RestorationMixin] the property is registered to, either this method
 or [createDefaultValue] is called before [initWithValue] is invoked.

## Return Type
`T`

## Parameters

- `data`: `Object?`
