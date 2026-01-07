# Method: `adaptivePlatformDensity`

## Description

Returns a [VisualDensity] that is adaptive based on the current platform
 on which the framework is executing, from [defaultTargetPlatform].

 When [defaultTargetPlatform] is a desktop platform, this returns
 [compact], and for other platforms, it returns a default-constructed
 [VisualDensity].

 See also:

 * [defaultDensityForPlatform] which returns a [VisualDensity] that is
   adaptive based on the platform given to it.
 * [defaultTargetPlatform] which returns the platform on which the
   framework is currently executing.

## Return Type
`VisualDensity`

