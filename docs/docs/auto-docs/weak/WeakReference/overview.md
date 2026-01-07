# Overview for `WeakReference`

## Description

A weak reference to a Dart object.

 A _weak_ reference to the [target] object which may be cleared
 (set to reference `null` instead) at any time
 when there is no other way for the program to access the target object.

 _Being the target of a weak reference does not keep an object
 from being garbage collected._

 There are no guarantees that a weak reference will ever be cleared
 even if all references to its target are weak references.

 Not all objects are supported as targets for weak references.
 The [WeakReference] constructor will reject any object that is not
 supported as an [Expando] key.

 Use-cases like caching can benefit from using weak references. Example:

 ```dart
  [CachedComputation] caches the computation result, weakly holding
  on to the cache.
 
  If nothing else in the program is holding on the result, and the
  garbage collector runs, the cache is purged, freeing the memory.
 
  Until the cache is purged, the computation will not run again on
  a subsequent request.
 
  Example use:
  ```
  final cached = CachedComputation(
       => jsonDecode(someJsonSource) as Object);
  print(cached.result); // Executes computation.
  print(cached.result); // Most likely uses cache.
  ```
 class CachedComputation&lt;R extends Object&gt; 
 ```

## Constructors

### Unnamed Constructor
Creates a [WeakReference] pointing to the given [target].

 The [target] must be an object supported as an [Expando] key,
 which means [target] cannot be a number, a string, a boolean, a record,
 the `null` value, or certain other types of special objects.

