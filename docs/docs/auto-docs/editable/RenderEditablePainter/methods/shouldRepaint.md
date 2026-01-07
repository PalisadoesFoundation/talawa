# Method: `shouldRepaint`

## Description

Determines whether repaint is needed when a new [RenderEditablePainter]
 is provided to a [RenderEditable].

 If the new instance represents different information than the old
 instance, then the method should return true, otherwise it should return
 false. When [oldDelegate] is null, this method should always return true
 unless the new painter initially does not paint anything.

 If the method returns false, then the [paint] call might be optimized
 away. However, the [paint] method will get called whenever the
 [RenderEditable]s it attaches to repaint, even if [shouldRepaint] returns
 false.

## Return Type
`bool`

## Parameters

- `oldDelegate`: `RenderEditablePainter?`
