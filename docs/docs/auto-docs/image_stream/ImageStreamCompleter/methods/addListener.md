# Method: `addListener`

## Description

Adds a listener callback that is called whenever a new concrete [ImageInfo]
 object is available or an error is reported. If a concrete image is
 already available, or if an error has been already reported, this object
 will notify the listener synchronously.

 If the [ImageStreamCompleter] completes multiple images over its lifetime,
 this listener's [ImageStreamListener.onImage] will fire multiple times.

 

 See also:

  * [addEphemeralErrorListener], which adds an error listener that is
    automatically removed after first image load or error.

## Return Type
`void`

## Parameters

- `listener`: `ImageStreamListener`
