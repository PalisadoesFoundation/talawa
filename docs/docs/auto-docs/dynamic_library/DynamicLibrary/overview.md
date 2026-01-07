# Overview for `DynamicLibrary`

## Description

A dynamically loaded native library.

 A dynamically loaded library is a mapping from symbols to memory addresses.
 These memory addresses can be accessed through [lookup].

## Constructors

### process
Creates a [DynamicLibrary] holding all global symbols.

 Any symbol in a library currently loaded with global visibility
 (including the executable itself) may be resolved through this library.

### executable
Creates a [DynamicLibrary] containing all the symbols of the running
 executable.

 This is useful for using dart:ffi with static libraries.

### open
Loads a library file and provides access to its symbols.

 The [path] must refer to a native library file which can be successfully
 loaded.

 Calling this function multiple times with the same [path], even across
 different isolates, only loads the library into the DartVM process once.
 Multiple loads of the same library file produces [DynamicLibrary] objects
 which are equal (`==`), but not [identical].

#### Parameters

- `path`: `String`
