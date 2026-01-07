# Overview for `BoxPainter`

## Description

A stateful class that can paint a particular [Decoration].

 [BoxPainter] objects can cache resources so that they can be used
 multiple times.

 Some resources used by [BoxPainter] may load asynchronously. When this
 happens, the [onChanged] callback will be invoked. To stop this callback
 from being called after the painter has been discarded, call [dispose].

## Members

- **onChanged**: `VoidCallback?`
  Callback that is invoked if an asynchronously-loading resource used by the
 decoration finishes loading. For example, an image. When this is invoked,
 the [paint] method should be called again.

 Resources might not start to load until after [paint] has been called,
 because they might depend on the configuration.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

