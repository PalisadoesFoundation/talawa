# Method: `debugCheckZone`

## Description

Checks that the current [Zone] is the same as that which was used
 to initialize the binding.

 If the current zone ([Zone.current]) is not the zone that was active when
 the binding was initialized, then this method generates a [FlutterError]
 exception with detailed information. The exception is either thrown
 directly, or reported via [FlutterError.reportError], depending on the
 value of [BindingBase.debugZoneErrorsAreFatal].

 To silence the message displayed by [debugCheckZone], ensure that the same
 zone is used when calling `` as when calling the
 framework in any other context (e.g. via [runApp]). For example, consider
 keeping a reference to the zone used to initialize the binding, and using
 [Zone.run] to use it again when calling into the framework.

 ## Usage

 The binding is considered initialized once [BindingBase.initInstances] has
 run; if this is called before then, it will throw an [AssertionError].

 The `entryPoint` parameter is the name of the API that is checking the
 zones are consistent, for example, `'runApp'`.

 This function always returns true (if it does not throw). It is expected
 to be invoked via the binding instance, e.g.:

 ```dart
 void  
 ```

 If the binding expects to be used with multiple zones, it should override
 this method to return true always without throwing. (For example, the
 bindings used with [flutter_test] do this as they make heavy use of zones
 to drive the framework with an artificial clock and to catch errors and
 report them as test failures.)

## Return Type
`bool`

## Parameters

- `entryPoint`: `String`
