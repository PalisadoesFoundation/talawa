# Method: `defaultDensityForPlatform`

## Description

Returns a [VisualDensity] that is adaptive based on the given [platform].

 For desktop platforms, this returns [compact], and for other platforms, it
 returns a default-constructed [VisualDensity].

 See also:

 * [adaptivePlatformDensity] which returns a [VisualDensity] that is
   adaptive based on [defaultTargetPlatform].

## Return Type
`VisualDensity`

## Parameters

- `platform`: `TargetPlatform`
