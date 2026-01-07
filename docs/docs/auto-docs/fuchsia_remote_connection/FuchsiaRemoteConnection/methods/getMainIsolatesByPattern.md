# Method: `getMainIsolatesByPattern`

## Description

Returns all Isolates running `` as matched by the [Pattern].

 If there are no live Dart VM's or the Isolate cannot be found, waits until
 either `timeout` is reached, or a Dart VM starts up with a name that
 matches `pattern`.

## Return Type
`Future&lt;List&lt;IsolateRef&gt;&gt;`

## Parameters

- `pattern`: `Pattern`
- ``: `dynamic`
- ``: `dynamic`
