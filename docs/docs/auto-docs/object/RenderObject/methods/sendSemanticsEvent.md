# Method: `sendSemanticsEvent`

## Description

Sends a [SemanticsEvent] associated with this render object's [SemanticsNode].

 If this render object has no semantics information, the first parent
 render object with a non-null semantic node is used.

 If semantics are disabled, no events are dispatched.

 See [SemanticsNode.sendEvent] for a full description of the behavior.

## Return Type
`void`

## Parameters

- `semanticsEvent`: `SemanticsEvent`
