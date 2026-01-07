# Overview for `Allocator`

## Description

Manages memory on the native heap.

 When allocating memory, prefer calling this allocator directly as a
 function (see [AllocatorAlloc.call] for details).

 This interface provides only the [allocate] method to allocate a block of
 bytes, and the [free] method to release such a block again.
 Implementations only need to provide those two methods.
 The [AllocatorAlloc.call] extension method is defined in terms of those
 lower-level operations.

 An example of an allocator wrapping another to count the number of
 allocations:

 ```dart
 class CountingAllocator implements Allocator 
 ```

## Constructors

### _
This interface is meant to be implemented, not extended or mixed in.

