# Method: `shouldReclip`

## Description

Called whenever a new instance of the custom clipper delegate class is
 provided to the clip object, or any time that a new clip object is created
 with a new instance of the custom clipper delegate class (which amounts to
 the same thing, because the latter is implemented in terms of the former).

 If the new instance represents different information than the old
 instance, then the method should return true, otherwise it should return
 false.

 If the method returns false, then the [getClip] call might be optimized
 away.

 It's possible that the [getClip] method will get called even if
 [shouldReclip] returns false or if the [shouldReclip] method is never
 called at all (e.g. if the box changes size).

## Return Type
`bool`

## Parameters

- `oldClipper`: `CustomClipper&lt;T&gt;`
