# Method: `evict`

## Description

Evicts an entry from the image cache.

 Returns a [Future] which indicates whether the value was successfully
 removed.

 The [ImageProvider] used does not need to be the same instance that was
 passed to an [Image] widget, but it does need to create a key which is
 equal to one.

 The [cache] is optional and defaults to the global image cache.

 The [configuration] is optional and defaults to
 [ImageConfiguration.empty].

 

 The following sample code shows how an image loaded using the [Image]
 widget can be evicted using a [NetworkImage] with a matching URL.

 ```dart
 class MyWidget extends StatelessWidget 
 ```
 

## Return Type
`Future&lt;bool&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
