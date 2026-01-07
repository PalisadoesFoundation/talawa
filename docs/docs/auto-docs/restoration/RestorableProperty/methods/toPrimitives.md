# Method: `toPrimitives`

## Description

Called by the [RestorationMixin] to retrieve the information that this
 property wants to store in the restoration data.

 The returned object must be serializable with the [StandardMessageCodec]
 and if it includes any collections, those should not be modified after
 they have been returned by this method.

 The information returned by this method may be handed back to the property
 in a call to [fromPrimitives] at a later point in time (possibly after the
 application restarted) to restore the value that the property is currently
 wrapping.

 When the value returned by this method changes, the property must call
 [notifyListeners]. The [RestorationMixin] will invoke this method whenever
 the property's listeners are notified.

## Return Type
`Object?`

