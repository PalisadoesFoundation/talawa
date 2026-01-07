# Overview for `StandardMessageCodec`

## Description

[MessageCodec] using the Flutter standard binary encoding.

 Supported messages are acyclic values of these forms:

  * null
  * [bool]s
  * [num]s
  * [String]s
  * [Uint8List]s, [Int32List]s, [Int64List]s, [Float64List]s
  * [List]s of supported values
  * [Map]s from supported values to supported values

 Decoded values will use `List<Object?>` and `Map&lt;Object?, Object?&gt;`
 irrespective of content.

 The type returned from [decodeMessage] is `dynamic` (not `Object?`), which
 means *no type checking is performed on its return value*. It is strongly
 recommended that the return value be immediately cast to a known type to
 prevent runtime errors due to typos that the type checker could otherwise
 catch.

 The codec is extensible by subclasses overriding [writeValue] and
 [readValueOfType].

 ## Android specifics

 On Android, messages are represented as follows:

  * null: null
  * [bool]\: `java.lang.Boolean`
  * [int]\: `java.lang.Integer` for values that are representable using 32-bit
    two's complement; `java.lang.Long` otherwise
  * [double]\: `java.lang.Double`
  * [String]\: `java.lang.String`
  * [Uint8List]\: `byte[]`
  * [Int32List]\: `int[]`
  * [Int64List]\: `long[]`
  * [Float64List]\: `double[]`
  * [List]\: `java.util.ArrayList`
  * [Map]\: `java.util.HashMap`

 When sending a `java.math.BigInteger` from Java, it is converted into a
 [String] with the hexadecimal representation of the integer. (The value is
 tagged as being a big integer; subclasses of this class could be made to
 support it natively; see the discussion at [writeValue].) This codec does
 not support sending big integers from Dart.

 ## iOS specifics

 On iOS, messages are represented as follows:

  * null: nil
  * [bool]\: `NSNumber numberWithBool:`
  * [int]\: `NSNumber numberWithInt:` for values that are representable using
    32-bit two's complement; `NSNumber numberWithLong:` otherwise
  * [double]\: `NSNumber numberWithDouble:`
  * [String]\: `NSString`
  * [Uint8List], [Int32List], [Int64List], [Float64List]\:
    `FlutterStandardTypedData`
  * [List]\: `NSArray`
  * [Map]\: `NSDictionary`

## Dependencies

- MessageCodec

## Members

- **_valueNull**: `int`
- **_valueTrue**: `int`
- **_valueFalse**: `int`
- **_valueInt32**: `int`
- **_valueInt64**: `int`
- **_valueLargeInt**: `int`
- **_valueFloat64**: `int`
- **_valueString**: `int`
- **_valueUint8List**: `int`
- **_valueInt32List**: `int`
- **_valueInt64List**: `int`
- **_valueFloat64List**: `int`
- **_valueList**: `int`
- **_valueMap**: `int`
- **_valueFloat32List**: `int`
## Constructors

### Unnamed Constructor
Creates a [MessageCodec] using the Flutter standard binary encoding.

