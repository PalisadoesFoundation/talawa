# Method: `close`

## Description

Closes this dynamic library.

 After calling [close], this library object can no longer be used for
 lookups. Further, this information is forwarded to the operating system,
 which may unload the library if there are no remaining references to it
 in the current process.

 Depending on whether another reference to this library has been opened,
 pointers and functions previously returned by [lookup] and
 [DynamicLibraryExtension.lookupFunction] may become invalid as well.

## Return Type
`void`

