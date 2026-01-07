# Method: `dispose`

## Description

Discards any resources used by the object. After this is called, the
 object is not in a usable state and should be discarded (calls to
 [addListener] will throw after the object is disposed).

 This method should only be called by the object's owner.

 This method does not notify listeners, and clears the listener list once
 it is called. Consumers of this class must decide on whether to notify
 listeners or not immediately before disposal.

## Return Type
`void`

