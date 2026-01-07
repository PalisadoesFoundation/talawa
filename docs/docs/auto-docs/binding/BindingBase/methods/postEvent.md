# Method: `postEvent`

## Description

All events dispatched by a [BindingBase] use this method instead of
 calling [developer.postEvent] directly so that tests for [BindingBase]
 can track which events were dispatched by overriding this method.

 This is unrelated to the events managed by [lockEvents].

## Return Type
`void`

## Parameters

- `eventKind`: `String`
- `eventData`: `Map&lt;String, dynamic&gt;`
