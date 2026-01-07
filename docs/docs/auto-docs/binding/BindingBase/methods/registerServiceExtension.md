# Method: `registerServiceExtension`

## Description

Registers a service extension method with the given name (full name
 "ext.flutter.name").

 The given callback is called when the extension method is called. The
 callback must return a [Future] that either eventually completes to a
 return value in the form of a name/value map where the values can all be
 converted to JSON using `json.` (see [JsonEncoder]), or fails. In
 case of failure, the failure is reported to the remote caller and is
 dumped to the logs.

 The returned map will be mutated.

 
 A registered service extension can only be activated if the vm-service
 is included in the build, which only happens in debug and profile mode.
 Although a service extension cannot be used in release mode its code may
 still be included in the Dart snapshot and blow up binary size if it is
 not wrapped in a guard that allows the tree shaker to remove it (see
 sample code below).

 
 The following code registers a service extension that is only included in
 debug builds.

 ```dart
 void  
 ```
 

 
 A service extension registered with the following code snippet is
 available in debug and profile mode.

 ```dart
 void  
 ```
 

 Both guards ensure that Dart's tree shaker can remove the code for the
 service extension in release builds.
 

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
