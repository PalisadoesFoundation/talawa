# Method: `shouldDispatchEvent`

## Description

Whether a key down event, and likewise its accompanying key up event,
 should be dispatched.

 Certain events on some platforms should not be dispatched to listeners
 according to Flutter's event model. For example, on macOS, Fn keys are
 skipped to be consistent with other platform. On Win32, events dispatched
 for IME (`VK_PROCESSKEY`) are also skipped.

 This method will be called upon every down events. By default, this method
 always return true. Subclasses should override this method to define the
 filtering rule for the platform. If this method returns false for an event
 message, the event will not be dispatched to listeners, but respond with
 "handled: true" immediately. Moreover, the following up event with the
 same physical key will also be skipped.

## Return Type
`bool`

