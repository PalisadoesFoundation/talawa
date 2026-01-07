# Overview for `BitField`

## Description

A BitField over an enum (or other class whose values implement "index").
 Only the first 62 values of the enum can be used as indices.

 When compiling to JavaScript, this class is not supported.

## Constructors

### Unnamed Constructor
Creates a bit field of all zeros.

 The given length must be at most 62.

### filled
Creates a bit field filled with a particular value.

 If the value argument is true, the bits are filled with ones. Otherwise,
 the bits are filled with zeros.

 The given length must be at most 62.

#### Parameters

- `length`: `int`
- `value`: `bool`
