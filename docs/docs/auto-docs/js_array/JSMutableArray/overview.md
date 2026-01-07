# Overview for `JSMutableArray`

## Description

Dummy subclasses that allow the backend to track more precise
 information about arrays through their type. The CPA type inference
 relies on the fact that these classes do not override [] nor []=.

 These classes are really a fiction, and can have no methods, since
 getInterceptor always returns JSArray.  We should consider pushing the
 'isGrowable' and 'isMutable' checks into the getInterceptor implementation
 so these classes can have specialized implementations. Doing so will
 challenge many assumptions in the JS backend.

## Dependencies

- JSArray, JSMutableIndexable

