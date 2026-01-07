# Method: `shouldRepaint`

## Description

Override this method to return true when the children need to be
 repainted. This should compare the fields of the current delegate and the
 given oldDelegate and return true if the fields are such that
 paintChildren would act differently.

 The delegate can also trigger a repaint if the delegate provides the
 repaint animation argument to this object's constructor and that animation
 ticks. Triggering a repaint using this animation-based mechanism is more
 efficient than rebuilding the [Flow] widget to change its delegate.

 The flow container might repaint even if this function returns false, for
 example if layout triggers painting (e.g., if [shouldRelayout] returns
 true).

## Return Type
`bool`

## Parameters

- `oldDelegate`: `FlowDelegate`
