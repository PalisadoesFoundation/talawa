# Method: `chain`

## Description

Returns a new [Animatable] whose value is determined by first evaluating
 the given parent and then evaluating this object at the result.

 This method represents function composition on [transform]:
 the [transform] method of the returned [Animatable] is the result of
 composing this object's [transform] method with
 the given parent's [transform] method.

 This allows [Tween]s to be chained before obtaining an [Animation],
 without allocating an [Animation] for the intermediate result.

## Return Type
`Animatable&lt;T&gt;`

## Parameters

- `parent`: `Animatable&lt;double&gt;`
