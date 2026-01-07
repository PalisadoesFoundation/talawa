# Overview for `ImageStreamCompleterHandle`

## Description

An opaque handle that keeps an [ImageStreamCompleter] alive even if it has
 lost its last listener.

 To create a handle, use [ImageStreamCompleter.keepAlive].

 Such handles are useful when an image cache needs to keep a completer alive
 but does not actually have a listener subscribed, or when a widget that
 displays an image needs to temporarily unsubscribe from the completer but
 may re-subscribe in the future, for example when the [TickerMode] changes.

## Members

- **_completer**: `ImageStreamCompleter?`
## Constructors

### _


#### Parameters

- `_completer`: `ImageStreamCompleter`
