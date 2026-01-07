# Method: `allocate`

## Description

Allocates [byteCount] bytes of memory on the native heap.

 If [alignment] is provided, the allocated memory will be at least aligned
 to [alignment] bytes.

 To allocate a multiple of `sizeOf&lt;T&gt;` bytes, call the allocator directly
 as a function: `allocator&lt;T&gt;(count)` (see [AllocatorAlloc.call] for
 details).

 ```dart
 // This allocates two bytes. If you intended two Int32's, this is an
 // error.
 allocator.allocate&lt;Int32&gt;(2);

 // This allocates eight bytes, which is enough space for two Int32's.
 // However, this is not the idiomatic way.
 allocator.allocate&lt;Int32&gt;(sizeOf&lt;Int32&gt; * 2);

 // The idiomatic way to allocate space for two Int32 is to call the
 // allocator directly as a function.
 allocator&lt;Int32&gt;(2);
 ```

 Throws an [ArgumentError] if the number of bytes or alignment cannot be
 satisfied.

## Return Type
`Pointer&lt;T&gt;`

## Parameters

- `byteCount`: `int`
- ``: `dynamic`
