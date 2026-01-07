# Method: `vibrate`

## Description

Provides vibration haptic feedback to the user for a short duration.

 On iOS devices that support haptic feedback, this uses the default system
 vibration value (`kSystemSoundID_Vibrate`).

 On Android, this uses the platform haptic feedback API to simulate a
 response to a long press (`HapticFeedbackConstants.LONG_PRESS`).

## Return Type
`Future&lt;void&gt;`

