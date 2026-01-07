# Method: `shouldRebuildSemantics`

## Description

Called whenever a new instance of the custom painter delegate class is
 provided to the [RenderCustomPaint] object, or any time that a new
 [CustomPaint] object is created with a new instance of the custom painter
 delegate class (which amounts to the same thing, because the latter is
 implemented in terms of the former).

 If the new instance would cause [semanticsBuilder] to create different
 semantics information, then this method should return true, otherwise it
 should return false.

 If the method returns false, then the [semanticsBuilder] call might be
 optimized away.

 It's possible that the [semanticsBuilder] will get called even if
 [shouldRebuildSemantics] would return false. For example, it is called
 when the [CustomPaint] is rendered for the very first time, or when the
 box changes its size.

 By default this method delegates to [shouldRepaint] under the assumption
 that in most cases semantics change when something new is drawn.

## Return Type
`bool`

## Parameters

- `oldDelegate`: `CustomPainter`
