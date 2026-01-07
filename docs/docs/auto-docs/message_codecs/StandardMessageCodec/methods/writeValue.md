# Method: `writeValue`

## Description

Writes [value] to [buffer] by first writing a type discriminator
 byte, then the value itself.

 This method may be called recursively to serialize container values.

 Type discriminators 0 through 127 inclusive are reserved for use by the
 base class, as follows:

  * null = 0
  * true = 1
  * false = 2
  * 32 bit integer = 3
  * 64 bit integer = 4
  * larger integers = 5 (see below)
  * 64 bit floating-point number = 6
  * String = 7
  * Uint8List = 8
  * Int32List = 9
  * Int64List = 10
  * Float64List = 11
  * List = 12
  * Map = 13
  * Float32List = 14
  * Reserved for future expansion: 15..127

 The codec can be extended by overriding this method, calling super
 for values that the extension does not handle. Type discriminators
 used by extensions must be greater than or equal to 128 in order to avoid
 clashes with any later extensions to the base class.

 The "larger integers" type, 5, is never used by [writeValue]. A subclass
 could represent big integers from another package using that type. The
 format is first the type byte (0x05), then the actual number as an ASCII
 string giving the hexadecimal representation of the integer, with the
 string's length as encoded by [writeSize] followed by the string bytes. On
 Android, that would get converted to a `java.math.BigInteger` object. On
 iOS, the string representation is returned.

## Return Type
`void`

## Parameters

- `buffer`: `WriteBuffer`
- `value`: `Object?`
