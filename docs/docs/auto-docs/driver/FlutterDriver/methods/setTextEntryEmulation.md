# Method: `setTextEntryEmulation`

## Description

Configures text entry emulation.

 If `enabled` is true, enables text entry emulation via [enterText]. If
 `enabled` is false, disables it. By default text entry emulation is
 enabled.

 When disabled, [enterText] will fail with a [DriverError]. When an
 [EditableText] is focused, the operating system's configured keyboard
 method is invoked, such as an on-screen keyboard on a phone or a tablet.

 When enabled, the operating system's configured keyboard will not be
 invoked when the widget is focused, as the [SystemChannels.textInput]
 channel will be mocked out.

## Return Type
`Future&lt;void&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
