# Method: `obtainKey`

## Description

Converts an [ImageProvider]'s settings plus an [ImageConfiguration] to a key
 that describes the precise image to load.

 The type of the key is determined by the subclass. It is a value that
 unambiguously identifies the image (_including its scale_) that the
 [loadImage] method will fetch. Different [ImageProvider]s given the same
 constructor arguments and [ImageConfiguration] objects should return keys
 that are '==' to each other (possibly by using a class for the key that
 itself implements [==]).

 If the result can be determined synchronously, this function should return
 a [SynchronousFuture]. This allows image resolution to progress
 synchronously during a frame rather than delaying image loading.

## Return Type
`Future&lt;T&gt;`

## Parameters

- `configuration`: `ImageConfiguration`
