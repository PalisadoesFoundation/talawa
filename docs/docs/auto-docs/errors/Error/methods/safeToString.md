# Method: `safeToString`

## Description

Safely convert a value to a [String] description.

 The conversion is guaranteed to not throw, so it won't use the object's
 toString method except for specific known and trusted types.

## Return Type
`String`

## Parameters

- `object`: `Object?`
