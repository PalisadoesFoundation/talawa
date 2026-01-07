# Overview for `RestorableEnum`

## Description

A [RestorableProperty] that knows how to store and restore an [Enum]
 type.

 

 The values are serialized using the name of the enum, obtained using the
 [EnumName.name] extension accessor.

 The represented value is accessible via the [value] getter.

 See also:

 * [RestorableEnumN], a class similar to this one that knows how to store and
   restore nullable [Enum] types.

## Dependencies

- RestorableValue

## Members

- **_defaultValue**: `T`
- **values**: `Set&lt;T&gt;`
  The set of values that this [RestorableEnum] may represent.

 This is a required field that supplies the possible enum values that can
 be serialized and restored.

 If a value is encountered that is not in this set, [fromPrimitives] will
 assert when restoring.

 It is typically set to the `values` list of the enum type.

  For example, to create a [RestorableEnum] with an
 [AxisDirection] enum value, with a default value of [AxisDirection.up],
 you would build it like the code below:

 ```dart
 RestorableEnum&lt;AxisDirection&gt; axis = RestorableEnum&lt;AxisDirection&gt;(AxisDirection.up, values: AxisDirection.values);
 ```
 

## Constructors

### Unnamed Constructor
Creates a [RestorableEnum].

 

