# Overview for `TextSelectionGestureDetectorBuilder`

## Description

Builds a [TextSelectionGestureDetector] to wrap an [EditableText].

 The class implements sensible defaults for many user interactions
 with an [EditableText] (see the documentation of the various gesture handler
 methods, e.g. [onTapDown], [onForcePressStart], etc.). Subclasses of
 [TextSelectionGestureDetectorBuilder] can change the behavior performed in
 responds to these gesture events by overriding the corresponding handler
 methods of this class.

 The resulting [TextSelectionGestureDetector] to wrap an [EditableText] is
 obtained by calling [buildGestureDetector].

 A [TextSelectionGestureDetectorBuilder] must be provided a
 [TextSelectionGestureDetectorBuilderDelegate], from which information about
 the [EditableText] may be obtained. Typically, the [State] of the widget
 that builds the [EditableText] implements this interface, and then passes
 itself as the [delegate].

 See also:

  * [TextField], which uses a subclass to implement the Material-specific
    gesture logic of an [EditableText].
  * [CupertinoTextField], which uses a subclass to implement the
    Cupertino-specific gesture logic of an [EditableText].

## Members

- **delegate**: `TextSelectionGestureDetectorBuilderDelegate`
  The delegate for this [TextSelectionGestureDetectorBuilder].

 The delegate provides the builder with information about what actions can
 currently be performed on the text field. Based on this, the builder adds
 the correct gesture handlers to the gesture detector.

 Typically implemented by a [State] of a widget that builds an
 [EditableText].

- **_shouldShowSelectionToolbar**: `bool`
- **_isShiftPressed**: `bool`
  Whether the Shift key was pressed when the most recent [PointerDownEvent]
 was tracked by the [BaseTapAndDragGestureRecognizer].

- **_dragStartScrollOffset**: `double`
  The viewport offset pixels of any [Scrollable] containing the
 [RenderEditable] at the last drag start.

- **_dragStartViewportOffset**: `double`
  The viewport offset pixels of the [RenderEditable] at the last drag start.

- **_dragStartSelection**: `TextSelection?`
- **_longPressStartedWithoutFocus**: `bool`
## Constructors

### Unnamed Constructor
Creates a [TextSelectionGestureDetectorBuilder].

