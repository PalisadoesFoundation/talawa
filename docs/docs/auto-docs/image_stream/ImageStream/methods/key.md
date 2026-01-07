# Method: `key`

## Description

Returns an object which can be used with `==` to determine if this
 [ImageStream] shares the same listeners list as another [ImageStream].

 This can be used to avoid un-registering and re-registering listeners
 after calling [ImageProvider.resolve] on a new, but possibly equivalent,
 [ImageProvider].

 The key may change once in the lifetime of the object. When it changes, it
 will go from being different than other [ImageStream]'s keys to
 potentially being the same as others'. No notification is sent when this
 happens.

## Return Type
`Object`

