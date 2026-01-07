# Method: `push`

## Description

Adds a message (`data`) to the named channel buffer (`name`).

 The `callback` argument is a closure that, when called, will send messages
 back to the plugin.

 If a message overflows the channel, and the channel has not been
 configured to expect overflow, then, in debug mode, a message
 will be printed to the console warning about the overflow.

 Channel names cannot contain the U+0000 NULL character, because they
 are passed through APIs that use null-terminated strings.

## Return Type
`void`

## Parameters

- `name`: `String`
- `data`: `ByteData?`
- `callback`: `PlatformMessageResponseCallback`
