# Method: `lightImpact`

## Description

Provides a haptic feedback corresponding a collision impact with a light mass.

 On iOS versions 10 and above, this uses a `UIImpactFeedbackGenerator` with
 `UIImpactFeedbackStyleLight`. This call has no effects on iOS versions
 below 10.

 On Android, this uses `HapticFeedbackConstants.VIRTUAL_KEY`.

 
 See also:

 * [Human Interface Selection Playing Impact Haptic](https://developer.apple.com/design/human-interface-guidelines/playing-haptics#Impact)
 

## Return Type
`Future&lt;void&gt;`

