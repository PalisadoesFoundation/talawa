# Method: `value`

## Description

The [Listenable] stored in this property.

 A representation of the current value of the [Listenable] is stored in the
 restoration data. During state restoration, the [Listenable] returned by
 this getter will be restored to the state it had when the restoration data
 the property is getting restored from was collected.

 The [value] can only be accessed after the property has been registered
 with a [RestorationMixin] by calling
 [RestorationMixin.registerForRestoration].

## Return Type
`T`

