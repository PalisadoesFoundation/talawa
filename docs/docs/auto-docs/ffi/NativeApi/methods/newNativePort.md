# Method: `newNativePort`

## Description

A function pointer to
 ```c
 Dart_Port Dart_NewNativePort(const char* name,
                              Dart_NativeMessageHandler handler,
                              bool handle_concurrently)
 ```
 in `dart_native_api.h`.

## Return Type
`Pointer<NativeFunction<Int64 Function(Pointer&lt;Uint8>, Pointer&lt;NativeFunction<Dart_NativeMessageHandler&gt;&gt;, Int8)>>`

