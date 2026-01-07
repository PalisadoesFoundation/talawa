# Method: `runtimeType`

## Description

A `Type` object representing the runtime type of a record.

 The runtime type of a record is defined by the record's *shape*,
 the number of positional fields and names of named fields,
 and the runtime type of each of those fields.
 (The runtime type of the record does not depend on
 the `runtimeType` getter of its fields' values,
 which may have overridden [Object.runtimeType].)

 The `Type` object of a record type is only equal to another `Type` object
 for a record type, and only if the other record type has the same shape,
 and if the corresponding fields have the same types.

## Return Type
`Type`

