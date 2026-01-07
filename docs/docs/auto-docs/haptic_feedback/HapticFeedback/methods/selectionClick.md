# Method: `selectionClick`

## Description

Provides a haptic feedback indication selection changing through discrete values.

 On iOS versions 10 and above, this uses a `UISelectionFeedbackGenerator`.
 This call has no effects on iOS versions below 10.

 On Android, this uses `HapticFeedbackConstants.CLOCK_TICK`.

 See also:

 * [Human Interface Selection Playing Selection Haptics](https://developer.apple.com/design/human-interface-guidelines/playing-haptics#Selection)

## Return Type
`Future&lt;void&gt;`

