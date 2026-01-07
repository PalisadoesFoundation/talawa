# Method: `avoidBounds`

## Description

Returns the areas of the screen that are obstructed by display features.

 A [DisplayFeature] obstructs the screen when the area it occupies is
 not 0 or the `state` is [DisplayFeatureState.postureHalfOpened].

## Return Type
`Iterable&lt;Rect&gt;`

## Parameters

- `mediaQuery`: `MediaQueryData`
