# Method: `loadFont`

## Description

Hook called to load a font asset into the engine.

 Subclasses may override this to replace the default loading logic with
 custom logic (for example, to mock the underlying engine API in tests).

## Return Type
`Future&lt;void&gt;`

## Parameters

- `list`: `Uint8List`
- `family`: `String`
