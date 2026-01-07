# Method: `requestData`

## Description

Sends a string and returns a string.

 This enables generic communication between the driver and the application.
 It's expected that the application has registered a [DataHandler]
 callback in [enableFlutterDriverExtension] that can successfully handle
 these requests.

## Return Type
`Future&lt;String&gt;`

## Parameters

- `message`: `String?`
- ``: `dynamic`
