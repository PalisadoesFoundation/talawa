# Method: `runProcess`

## Description

Run the command and arguments in `commandLine` as a sub-process from
 `workingDirectory` if set, or the [defaultWorkingDirectory] if not. Uses
 [Directory.current] if [defaultWorkingDirectory] is not set.

 Set `failOk` if [runProcess] should not throw an exception when the
 command completes with a non-zero exit code.

## Return Type
`Future&lt;String&gt;`

## Parameters

- `commandLine`: `List&lt;String&gt;`
- ``: `dynamic`
- ``: `dynamic`
