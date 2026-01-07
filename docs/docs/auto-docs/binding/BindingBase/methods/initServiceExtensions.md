# Method: `initServiceExtensions`

## Description

Called when the binding is initialized, to register service
 extensions.

 Bindings that want to expose service extensions should overload
 this method to register them using calls to
 [registerSignalServiceExtension],
 [registerBoolServiceExtension],
 [registerNumericServiceExtension], and
 [registerServiceExtension] (in increasing order of complexity).

 Implementations of this method must call their superclass
 implementation.

 

 See also:

  * <https://github.com/dart-lang/sdk/blob/main/runtime/vm/service/service.md#rpcs-requests-and-responses>

## Return Type
`void`

