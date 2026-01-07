# Method: `keepAlive`

## Description

Creates an [ImageStreamCompleterHandle] that will prevent this stream from
 being disposed at least until the handle is disposed.

 Such handles are useful when an image cache needs to keep a completer
 alive but does not itself have a listener subscribed, or when a widget
 that displays an image needs to temporarily unsubscribe from the completer
 but may re-subscribe in the future, for example when the [TickerMode]
 changes.

## Return Type
`ImageStreamCompleterHandle`

