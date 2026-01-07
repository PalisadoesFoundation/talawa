# Method: `addEphemeralErrorListener`

## Description

Adds an error listener callback that is called when the first error is reported.

 The callback will be removed automatically after the first successful
 image load or the first error - that is why it is called "ephemeral".

 If a concrete image is already available, the listener will be discarded
 synchronously. If an error has been already reported, the listener
 will be notified synchronously.

 The presence of a listener will affect neither the lifecycle of this object
 nor what [hasListeners] reports.

 It is different from [addListener] in a few points: Firstly, this one only
 listens to errors, while [addListener] listens to all kinds of events.
 Secondly, this listener will be automatically removed according to the
 rules mentioned above, while [addListener] will need manual removal.
 Thirdly, this listener will not affect how this object is disposed, while
 any non-removed listener added via [addListener] will forbid this object
 from disposal.

 When you want to know full information and full control, use [addListener].
 When you only want to get notified for an error ephemerally, use this function.

 See also:

  * [addListener], which adds a full-featured listener and needs manual
    removal.

## Return Type
`void`

## Parameters

- `listener`: `ImageErrorListener`
