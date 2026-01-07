# Method: `mediumImpact`

## Description

Provides a haptic feedback corresponding a collision impact with a medium mass.

 On iOS versions 10 and above, this uses a `UIImpactFeedbackGenerator` with
 `UIImpactFeedbackStyleMedium`. This call has no effects on iOS versions
 below 10.

 On Android, this uses `HapticFeedbackConstants.KEYBOARD_TAP`.

 

## Return Type
`Future&lt;void&gt;`

