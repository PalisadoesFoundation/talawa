# Method: `drain`

## Description

Deprecated. Migrate to [setListener] instead.

 Remove and process all stored messages for a given channel.

 This should be called once a channel is prepared to handle messages
 (i.e. when a message handler is set up in the framework).

 The messages are processed by calling the given `callback`. Each message
 is processed in its own microtask.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `name`: `String`
- `callback`: `DrainChannelCallback`
