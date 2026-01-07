# Method: `transform`

## Description

Returns the interpolated value for the current value of the given animation.

 This method returns `begin` and `end` when the animation values are 0.0 or
 1.0, respectively.

 This function is implemented by deferring to [lerp]. Subclasses that want
 to provide custom behavior should override [lerp], not [transform] (nor
 [evaluate]).

 See the constructor for details about whether the [begin] and [end]
 properties may be null when this is called. It varies from subclass to
 subclass.

## Return Type
`T`

## Parameters

- `t`: `double`
