# Method: `toPaint`

## Description

Create the [Paint] object that corresponds to this shadow description.

 The [offset] and [spreadRadius] are not represented in the [Paint] object.
 To honor those as well, the shape should be inflated by [spreadRadius] pixels
 in every direction and then translated by [offset] before being filled using
 this [Paint].

 The [blurStyle] is ignored if [debugDisableShadows] is true. This causes
 an especially significant change to the rendering when [BlurStyle.outer]
 is used; the caller is responsible for adjusting for that case if
 necessary. (This only matters when using [debugDisableShadows], e.g. in
 tests that use [matchesGoldenFile].)

## Return Type
`Paint`

