# Method: `handlePlatformMessage`

## Description

Queues a message.

 The returned future completes immediately.

 This method adds the provided message to the given channel (named by the
 `channel` argument) of the [ChannelBuffers] object. This simulates what
 happens when a plugin on the platform thread (e.g. Kotlin or Swift code)
 sends a message to the plugin package on the Dart thread.

 The `data` argument contains the message as encoded bytes. (The format
 used for the message depends on the channel.)

 The `callback` argument, if non-null, is eventually invoked with the
 response that would have been sent to the platform thread.

 In production code, it is more efficient to call
 `ServicesBinding.instance.channelBuffers.push` directly.

 In tests, consider using
 `tester.binding.defaultBinaryMessenger.handlePlatformMessage` (see
 [WidgetTester], [TestWidgetsFlutterBinding], [TestDefaultBinaryMessenger],
 and [TestDefaultBinaryMessenger.handlePlatformMessage] respectively).

 To register a handler for a given message channel, see [setMessageHandler].

 To send a message _to_ a plugin on the platform thread, see [send].

## Return Type
`Future&lt;void&gt;`

## Parameters

- `channel`: `String`
- `data`: `ByteData?`
- `callback`: `ui.PlatformMessageResponseCallback?`
