# Method: `connect`

## Description

Connects to a Flutter application.

 Resumes the application if it is currently paused (e.g. at a breakpoint).

 The `dartVmServiceUrl` parameter is the URL to Dart observatory
 (a.k.a. VM service). If not specified, the URL specified by the
 `VM_SERVICE_URL` environment variable is used. One or the other must be
 specified.

 The `printCommunication` parameter determines whether the command
 communication between the test and the app should be printed to stdout.

 The `logCommunicationToFile` parameter determines whether the command
 communication between the test and the app should be logged to
 `flutter_driver_commands.log`.

 The `isolateNumber` parameter determines the specific isolate to connect
 to. If this is left as `null`, will connect to the first isolate found
 running on `dartVmServiceUrl`.

 The `fuchsiaModuleTarget` parameter specifies the pattern for determining
 which mod to control. When running on a Fuchsia device, either this or the
 environment variable `FUCHSIA_MODULE_TARGET` must be set (the environment
 variable is treated as a substring pattern). This field will be ignored if
 `isolateNumber` is set, as this is already enough information to connect
 to an isolate. This parameter is ignored on non-fuchsia devices.

 The `headers` parameter optionally specifies HTTP headers to be included
 in the [WebSocket] connection. This is only used for
 [VMServiceFlutterDriver] connections.

 The return value is a future. This method never times out, though it may
 fail (completing with an error). A timeout can be applied by the caller
 using [Future.timeout] if necessary.

## Return Type
`Future&lt;FlutterDriver&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
