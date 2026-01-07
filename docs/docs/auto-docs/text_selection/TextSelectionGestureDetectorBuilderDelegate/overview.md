# Overview for `TextSelectionGestureDetectorBuilderDelegate`

## Description

Delegate interface for the [TextSelectionGestureDetectorBuilder].

 The interface is usually implemented by the [State] of text field
 implementations wrapping [EditableText], so that they can use a
 [TextSelectionGestureDetectorBuilder] to build a
 [TextSelectionGestureDetector] for their [EditableText]. The delegate
 provides the builder with information about the current state of the text
 field. Based on that information, the builder adds the correct gesture
 handlers to the gesture detector.

 See also:

  * [TextField], which implements this delegate for the Material text field.
  * [CupertinoTextField], which implements this delegate for the Cupertino
    text field.

