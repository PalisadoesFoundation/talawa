# Method: `setSemantics`

## Description

Turns semantics on or off in the Flutter app under test.

 Returns true when the call actually changed the state from on to off or
 vice versa.

 Does not enable or disable the assistive technology installed on the
 device. For example, this does not enable VoiceOver on iOS, TalkBack on
 Android, or NVDA on Windows.

 Enabling semantics on the web causes the engine to render ARIA-annotated
 HTML.

## Return Type
`Future&lt;bool&gt;`

## Parameters

- `enabled`: `bool`
- ``: `dynamic`
