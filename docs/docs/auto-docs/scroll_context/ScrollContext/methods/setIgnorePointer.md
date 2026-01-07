# Method: `setIgnorePointer`

## Description

Whether the contents of the widget should ignore [PointerEvent] inputs.

 Setting this value to true prevents the use from interacting with the
 contents of the widget with pointer events. The widget itself is still
 interactive.

 For example, if the scroll position is being driven by an animation, it
 might be appropriate to set this value to ignore pointer events to
 prevent the user from accidentally interacting with the contents of the
 widget as it animates. The user will still be able to touch the widget,
 potentially stopping the animation.

## Return Type
`void`

## Parameters

- `value`: `bool`
