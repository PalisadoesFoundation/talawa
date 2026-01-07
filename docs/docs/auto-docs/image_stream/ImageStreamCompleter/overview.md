# Overview for `ImageStreamCompleter`

## Description

Base class for those that manage the loading of [dart:ui.Image] objects for
 [ImageStream]s.

 [ImageStreamListener] objects are rarely constructed directly. Generally, an
 [ImageProvider] subclass will return an [ImageStream] and automatically
 configure it with the right [ImageStreamCompleter] when possible.

## Dependencies

- Diagnosticable

## Members

- **_listeners**: `List&lt;ImageStreamListener&gt;`
- **_ephemeralErrorListeners**: `List&lt;ImageErrorListener&gt;`
- **_currentImage**: `ImageInfo?`
- **_currentError**: `FlutterErrorDetails?`
- **debugLabel**: `String?`
  A string identifying the source of the underlying image.

- **_hadAtLeastOneListener**: `bool`
  We must avoid disposing a completer if it has never had a listener, even
 if all [keepAlive] handles get disposed.

- **_addingInitialListeners**: `bool`
  Whether the future listeners added to this completer are initial listeners.

 This can be set to true when an [ImageStream] adds its initial listeners to
 this completer. This ultimately controls the synchronousCall parameter for
 the listener callbacks. When adding cached listeners to a completer,
 [_addingInitialListeners] can be set to false to indicate to the listeners
 that they are being called asynchronously.

- **_keepAliveHandles**: `int`
- **_disposed**: `bool`
- **_onLastListenerRemovedCallbacks**: `List&lt;VoidCallback&gt;`
