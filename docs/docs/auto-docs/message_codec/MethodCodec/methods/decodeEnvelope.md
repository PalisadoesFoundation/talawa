# Method: `decodeEnvelope`

## Description

Decodes the specified result [envelope] from binary.

 Throws [PlatformException], if [envelope] represents an error, otherwise
 returns the enveloped result.

 The type returned from [decodeEnvelope] is `dynamic` (not `Object?`),
 which means *no type checking is performed on its return value*. It is
 strongly recommended that the return value be immediately cast to a known
 type to prevent runtime errors due to typos that the type checker could
 otherwise catch.

## Return Type
`dynamic`

## Parameters

- `envelope`: `ByteData`
