# Method: `addListener`

## Description

Register a listener that is called every time the user presses or releases
 a hardware keyboard key.

 Since the listeners have no way to indicate what they did with the event,
 listeners are assumed to not handle the key event. These events will also
 be distributed to other listeners, and to the [keyEventHandler].

 Most applications prefer to use the focus system (see [Focus] and
 [FocusManager]) to receive key events to the focused control instead of
 this kind of passive listener.

 Listeners can be removed with [removeListener].

## Return Type
`void`

## Parameters

- `listener`: `ValueChanged&lt;RawKeyEvent&gt;`
