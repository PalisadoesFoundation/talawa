# Overview for `EditableTextTapUpOutsideIntent`

## Description

An [Intent] that represents a tap outside the field.

 Invoked when the user taps up outside the focused [EditableText] if
 [EditableText.onTapUpOutside] is null.

 Override this [Intent] to modify the default behavior, which is to unfocus
 on a touch event on web and do nothing on other platforms.

 
 A common requirement is to unfocus text fields when the user taps outside of
 it. For UX reasons, it's often desirable to only unfocus when the user taps
 outside of the text field, but not when they scroll.

 To achieve this, you can override the default behavior of
 [EditableTextTapOutsideIntent] and [EditableTextTapUpOutsideIntent] to check
 the difference in distance between the pointer down and pointer up events
 before potentially unfocusing.

 ** See code in examples/api/lib/widgets/text_editing_intents/editable_text_tap_up_outside_intent.0.dart **
 

 See also:

  * [Action.overridable] for an example on how to make an [Action]
    overridable.

## Dependencies

- Intent

## Members

- **focusNode**: `FocusNode`
  The [FocusNode] that this [Intent]'s action should be performed on.

- **pointerUpEvent**: `PointerUpEvent`
  The [PointerUpEvent] that initiated this [Intent].

## Constructors

### Unnamed Constructor
Creates an [EditableTextTapUpOutsideIntent].

