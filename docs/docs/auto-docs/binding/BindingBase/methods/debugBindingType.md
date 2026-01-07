# Method: `debugBindingType`

## Description

In debug builds, the type of the current binding, if any, or else null.

 This may be useful in asserts to verify that the binding has not been initialized
 before the point in the application code that wants to initialize the binding, or
 to verify that the binding is the one that is expected.

 For example, if an application uses [Zone]s to report uncaught exceptions, it may
 need to ensure that `` has not yet been invoked on any binding
 at the point where it configures the zone and initializes the binding.

 If this returns null, the binding has not been initialized.

 If this returns a non-null value, it returns the type of the binding instance.

 To obtain the binding itself, consider the `instance` getter on the [BindingBase]
 subclass or mixin.

 This method only returns a useful value in debug builds. In release builds, the
 return value is always null; to improve startup performance, the type of the
 binding is not tracked in release builds.

 See also:

  * [BindingBase], whose class documentation describes the conventions for dealing
    with bindings.
  * [initInstances], whose documentation details how to create a binding mixin.

## Return Type
`Type?`

