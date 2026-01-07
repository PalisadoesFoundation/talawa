# Overview for `RestorableEnumN`

## Description

A [RestorableProperty] that knows how to store and restore a nullable [Enum]
 type.

 

 The values are serialized using the name of the enum, obtained using the
 [EnumName.name] extension accessor.

 The represented value is accessible via the [value] getter. The set of
 values in the enum are accessible via the [values] getter. Since
 [RestorableEnumN] allows null, this set will include null.

 See also:

 * [RestorableEnum], a class similar to this one that knows how to store and
   restore non-nullable [Enum] types.

## Dependencies

- RestorableValue

## Members

- **_defaultValue**: `T?`
- **values**: `Set&lt;T&gt;`
  The set of non-null values that this [RestorableEnumN] may represent.

 This is a required field that supplies the enum values that are serialized
 and restored.

 If a value is encountered that is not null or a value in this set,
 [fromPrimitives] will assert when restoring.

 It is typically set to the `values` list of the enum type.

 In addition to this set, because [RestorableEnumN] allows nullable values,
 null is also a valid value, even though it doesn't appear in this set.

  For example, to create a [RestorableEnumN] with an
 [AxisDirection] enum value, with a default value of null, you would build
 it like the code below:

 ```dart
 RestorableEnumN&lt;AxisDirection&gt; axis = RestorableEnumN&lt;AxisDirection&gt;(null, values: AxisDirection.values);
 ```
 

## Constructors

### Unnamed Constructor
Creates a [RestorableEnumN].

 

