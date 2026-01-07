# Method: `createDefaultValue`

## Description

Called by the [RestorationMixin] if no restoration data is available to
 restore the value of the property from to obtain the default value for the
 property.

 The method returns the default value that the property should wrap if no
 restoration data is available. After this is called, [initWithValue] will
 be called with this method's return value.

 The method may be called multiple times throughout the life of the
 [RestorableProperty]. Whenever new restoration data has been provided to
 the [RestorationMixin] the property is registered to, either this method
 or [fromPrimitives] is called before [initWithValue] is invoked.

## Return Type
`T`

