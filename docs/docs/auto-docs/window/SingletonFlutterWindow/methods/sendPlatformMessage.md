# Method: `sendPlatformMessage`

## Description

Sends a message to a platform-specific plugin.

 

 The `name` parameter determines which plugin receives the message. The
 `data` parameter contains the message payload and is typically UTF-8
 encoded JSON but can be arbitrary data. If the plugin replies to the
 message, `callback` will be called with the response.

 The framework invokes [callback] in the same zone in which this method
 was called.

## Return Type
`void`

## Parameters

- `name`: `String`
- `data`: `ByteData?`
- `callback`: `PlatformMessageResponseCallback?`
