# Method: `handleMessage`

## Description

Handle a control message.

 This is intended to be called by the platform messages dispatcher, forwarding
 messages from plugins to the [kControlChannelName] channel.

 Messages use the [StandardMethodCodec] format. There are two methods
 supported: `resize` and `overflow`. The `resize` method changes the size
 of the buffer, and the `overflow` method controls whether overflow is
 expected or not.

 ## `resize`

 The `resize` method takes as its argument a list with two values, first
 the channel name (a UTF-8 string less than 254 bytes long and not
 containing any null bytes), and second the allowed size of the channel
 buffer (an integer between 0 and 2147483647).

 Upon receiving the message, the channel's buffer is resized. If necessary,
 messages are silently discarded to ensure the buffer is no bigger than
 specified.

 For historical reasons, this message can also be sent using a bespoke
 format consisting of a UTF-8-encoded string with three parts separated
 from each other by U+000D CARRIAGE RETURN (CR) characters, the three parts
 being the string `resize`, the string giving the channel name, and then
 the string giving the decimal serialization of the new channel buffer
 size. For example: `resize\rchannel\r1`

 ## `overflow`

 The `overflow` method takes as its argument a list with two values, first
 the channel name (a UTF-8 string less than 254 bytes long and not
 containing any null bytes), and second a boolean which is true if overflow
 is expected and false if it is not.

 This sets a flag on the channel in debug mode. In release mode the message
 is silently ignored. The flag indicates whether overflow is expected on this
 channel. When the flag is set, messages are discarded silently. When the
 flag is cleared (the default), any overflow on the channel causes a message
 to be printed to the console, warning that a message was lost.

## Return Type
`void`

## Parameters

- `data`: `ByteData`
