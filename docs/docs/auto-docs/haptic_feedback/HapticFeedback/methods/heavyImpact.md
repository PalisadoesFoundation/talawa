# Method: `heavyImpact`

## Description

Provides a haptic feedback corresponding a collision impact with a heavy mass.

 On iOS versions 10 and above, this uses a `UIImpactFeedbackGenerator` with
 `UIImpactFeedbackStyleHeavy`. This call has no effects on iOS versions
 below 10.

 On Android, this uses `HapticFeedbackConstants.CONTEXT_CLICK` on API levels
 23 and above. This call has no effects on Android API levels below 23.

 

## Return Type
`Future&lt;void&gt;`

