# Method: `nativeFunction`

## Description

The native function pointer which can be used to invoke the `callback`
 passed to the constructor.

 This pointer must not be read after the callable has been [close]d.

## Return Type
`Pointer&lt;NativeFunction&lt;T&gt;&gt;`

