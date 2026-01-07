# Method: `resolve`

## Description

Resolves this image provider using the given `configuration`, returning
 an [ImageStream].

 This is the public entry-point of the [ImageProvider] class hierarchy.

 Subclasses should implement [obtainKey] and [loadImage], which are used by
 this method. If they need to change the implementation of [ImageStream]
 used, they should override [createStream]. If they need to manage the
 actual resolution of the image, they should override [resolveStreamForKey].

 See the Lifecycle documentation on [ImageProvider] for more information.

## Return Type
`ImageStream`

## Parameters

- `configuration`: `ImageConfiguration`
