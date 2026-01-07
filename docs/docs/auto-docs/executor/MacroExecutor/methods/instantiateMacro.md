# Method: `instantiateMacro`

## Description

Creates an instance of the macro [name] from [library] in the executor,
 and returns an identifier for that instance.

 Throws an exception if an instance is not created.

 Instances may be re-used throughout a single build, but should be
 re-created on subsequent builds (even incremental ones).

## Return Type
`Future&lt;MacroInstanceIdentifier&gt;`

## Parameters

- `library`: `Uri`
- `name`: `String`
- `constructor`: `String`
- `arguments`: `Arguments`
