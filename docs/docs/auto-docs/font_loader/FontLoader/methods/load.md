# Method: `load`

## Description

Loads this font loader's font [family] and all of its associated assets
 into the Flutter engine, making the font available to the current
 application.

 This method should only be called once per font loader. Attempts to
 load fonts from the same loader more than once will cause a [StateError]
 to be thrown.

 The returned future will complete with an error if any of the font asset
 futures yield an error.

## Return Type
`Future&lt;void&gt;`

