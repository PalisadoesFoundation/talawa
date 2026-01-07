# Method: `lookup`

## Description

Looks up a symbol in the [DynamicLibrary] and returns its address in
 memory.

 Similar to the functionality of the
 [dlsym(3)](https://man7.org/linux/man-pages/man3/dlsym.3.html) system
 call.

 The symbol must be provided by the dynamic library. To check whether
 the library provides such symbol, use [providesSymbol].

## Return Type
`Pointer&lt;T&gt;`

## Parameters

- `symbolName`: `String`
