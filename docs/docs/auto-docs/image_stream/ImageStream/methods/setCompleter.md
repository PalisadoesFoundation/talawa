# Method: `setCompleter`

## Description

Assigns a particular [ImageStreamCompleter] to this [ImageStream].

 This is usually done automatically by the [ImageProvider] that created the
 [ImageStream].

 This method can only be called once per stream. To have an [ImageStream]
 represent multiple images over time, assign it a completer that
 completes several images in succession.

## Return Type
`void`

## Parameters

- `value`: `ImageStreamCompleter`
