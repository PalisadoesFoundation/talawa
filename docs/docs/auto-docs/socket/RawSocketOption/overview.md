# Overview for `RawSocketOption`

## Description

The [RawSocketOption] is used as a parameter to [Socket.setRawOption] and
 [RawSocket.setRawOption] to customize the behaviour of the underlying
 socket.

 It allows for fine grained control of the socket options, and its values
 will be passed to the underlying platform's implementation of setsockopt and
 getsockopt.

## Members

- **level**: `int`
  The level for the option to set or get.

 See also:
   * [RawSocketOption.levelSocket]
   * [RawSocketOption.levelIPv4]
   * [RawSocketOption.levelIPv6]
   * [RawSocketOption.levelTcp]
   * [RawSocketOption.levelUdp]

- **option**: `int`
  The numeric ID of the option to set or get.

- **value**: `Uint8List`
  The raw data to set, or the array to write the current option value into.

 This list must be the correct length for the expected option. For most
 options that take [int] or [bool] values, the length should be 4. For options
 that expect a struct (such as an in_addr_t), the length should be the
 correct length for that struct.

## Constructors

### Unnamed Constructor
Creates a [RawSocketOption] for [RawSocket.getRawOption]
 and [RawSocket.setRawOption].

 The [level] and [option] arguments correspond to `level` and `optname` arguments
 on the `` and `` native calls.

 The value argument and its length correspond to the optval and length
 arguments on the native call.

 For a [RawSocket.getRawOption] call, the value parameter will be updated
 after a successful call (although its length will not be changed).

 For a [RawSocket.setRawOption] call, the value parameter will be used set
 the option.

### fromInt
Convenience constructor for creating an integer based [RawSocketOption].

#### Parameters

- `level`: `int`
- `option`: `int`
- `value`: `int`
### fromBool
Convenience constructor for creating a boolean based [RawSocketOption].

#### Parameters

- `level`: `int`
- `option`: `int`
- `value`: `bool`
