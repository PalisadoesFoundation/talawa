# Overview for `ChannelBuffers`

## Description

The buffering and dispatch mechanism for messages sent by plugins
 on the engine side to their corresponding plugin code on the
 framework side.

 Messages for a channel are stored until a listener is provided for that channel,
 using [setListener]. Only one listener may be configured per channel.

 Typically these buffers are drained once a callback is set up on
 the [BinaryMessenger] in the Flutter framework. (See [setListener].)

 ## Channel names

 By convention, channels are normally named with a reverse-DNS prefix, a
 slash, and then a domain-specific name. For example, `com.example/demo`.

 Channel names cannot contain the U+0000 NULL character, because they
 are passed through APIs that use null-terminated strings.

 ## Buffer capacity and overflow

 Each channel has a finite buffer capacity and messages will
 be deleted in a first-in-first-out (FIFO) manner if the capacity is exceeded.

 By default buffers store one message per channel, and when a
 message overflows, in debug mode, a message is printed to the
 console. The message looks like the following:

 > A message on the com.example channel was discarded before it could be
 > handled.
 > This happens when a plugin sends messages to the framework side before the
 > framework has had an opportunity to register a listener. See the
 > ChannelBuffers API documentation for details on how to configure the channel
 > to expect more messages, or to expect messages to get discarded:
 >   https://api.flutter.dev/flutter/dart-ui/ChannelBuffers-class.html

 There are tradeoffs associated with any size. The correct size
 should be chosen for the semantics of the channel. To change the
 size a plugin can send a message using the control channel,
 as described below.

 Size 0 is appropriate for channels where messages sent before
 the engine and framework are ready should be ignored. For
 example, a plugin that notifies the framework any time a
 radiation sensor detects an ionization event might set its size
 to zero since past ionization events are typically not
 interesting, only instantaneous readings are worth tracking.

 Size 1 is appropriate for level-triggered plugins. For example,
 a plugin that notifies the framework of the current value of a
 pressure sensor might leave its size at one (the default), while
 sending messages continually; once the framework side of the plugin
 registers with the channel, it will immediately receive the most
 up to date value and earlier messages will have been discarded.

 Sizes greater than one are appropriate for plugins where every
 message is important. For example, a plugin that itself
 registers with another system that has been buffering events,
 and immediately forwards all the previously-buffered events,
 would likely wish to avoid having any messages dropped on the
 floor. In such situations, it is important to select a size that
 will avoid overflows. It is also important to consider the
 potential for the framework side to never fully initialize (e.g. if
 the user starts the application, but terminates it soon
 afterwards, leaving time for the platform side of a plugin to
 run but not the framework side).

 ## The control channel

 A plugin can configure its channel's buffers by sending messages to the
 control channel, `dev.flutter/channel-buffers` (see [kControlChannelName]).

 There are two messages that can be sent to this control channel, to adjust
 the buffer size and to disable the overflow warnings. See [handleMessage]
 for details on these messages.

## Members

- **kDefaultBufferSize**: `int`
  The number of messages that channel buffers will store by default.

- **kControlChannelName**: `String`
  The name of the channel that plugins can use to communicate with the
 channel buffers system.

 These messages are handled by [handleMessage].

- **_channels**: `Map&lt;String, _Channel&gt;`
  A mapping between a channel name and its associated [_Channel].

## Constructors

### Unnamed Constructor
Create a buffer pool for platform messages.

 It is generally not necessary to create an instance of this class;
 the global [channelBuffers] instance is the one used by the engine.

