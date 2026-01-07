# Overview for `EditableTextTapOutsideIntent`

## Description

An [Intent] that represents a tap outside the field.

 Invoked when the user taps outside the focused [EditableText] if
 [EditableText.onTapOutside] is null.

 Override this [Intent] to modify the default behavior, which is to unfocus
 on a touch event on web and do nothing on other platforms.

 See also:

  * [Action.overridable] for an example on how to make an [Action]
    overridable.

## Dependencies

- Intent

## Members

- **focusNode**: `FocusNode`
  The [FocusNode] that this [Intent]'s action should be performed on.

- **pointerDownEvent**: `PointerDownEvent`
  The [PointerDownEvent] that initiated this [Intent].

## Constructors

### Unnamed Constructor
Creates an [EditableTextTapOutsideIntent].

