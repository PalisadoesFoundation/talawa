# Method: `setMessageHandler`

## Description

Set a callback for receiving messages from the platform plugins on the
 given channel, without decoding them.

 The given callback will replace the currently registered callback for that
 channel, if any. To remove the handler, pass null as the [handler]
 argument.

 The handler's return value, if non-null, is sent as a response, unencoded.

## Return Type
`void`

## Parameters

- `channel`: `String`
- `handler`: `MessageHandler?`
