# Method: `initInstances`

## Description

The initialization method. Subclasses override this method to hook into
 the platform and otherwise configure their services. Subclasses must call
 "super.".

 The binding is not fully initialized when this method runs (for
 example, other binding mixins may not yet have run their
 [initInstances] method). For this reason, code in this method
 should avoid invoking callbacks or synchronously triggering any
 code that would normally assume that the bindings are ready.

 

 By convention, if the service is to be provided as a singleton,
 it should be exposed as `MixinClassName.instance`, a static
 getter with a non-nullable return type that returns
 `MixinClassName._instance`, a static field that is set by
 ``. To improve the developer experience, the
 return value should actually be
 `BindingBase.checkInstance(_instance)` (see [checkInstance]), as
 in the example below.

 ```dart
 mixin BazBinding on BindingBase 
 ```
 

## Return Type
`void`

