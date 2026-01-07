# Overview for `RenderEditable`

## Description

Displays some text in a scrollable container with a potentially blinking
 cursor and with gesture recognizers.

 This is the renderer for an editable text field. It does not directly
 provide affordances for editing the text, but it does handle text selection
 and manipulation of the text cursor.

 The [text] is displayed, scrolled by the given [offset], aligned according
 to [textAlign]. The [maxLines] property controls whether the text displays
 on one line or many. The [selection], if it is not collapsed, is painted in
 the [selectionColor]. If it _is_ collapsed, then it represents the cursor
 position. The cursor is shown while [showCursor] is true. It is painted in
 the [cursorColor].

 Keyboard handling, IME handling, scrolling, toggling the [showCursor] value
 to actually blink the cursor, and other features not mentioned above are the
 responsibility of higher layers and not handled by this object.

## Dependencies

- RenderBox, RelayoutWhenSystemFontsChangeMixin, ContainerRenderObjectMixin, RenderInlineChildrenContainerDefaults, TextLayoutMetrics

## Members

- **_foregroundRenderObject**: `_RenderEditableCustomPaint?`
  Child render objects

- **_backgroundRenderObject**: `_RenderEditableCustomPaint?`
- **_foregroundPainter**: `RenderEditablePainter?`
- **_painter**: `RenderEditablePainter?`
- **_caretPainter**: `_CaretPainter`
- **_selectionPainter**: `_TextHighlightPainter`
- **_autocorrectHighlightPainter**: `_TextHighlightPainter`
- **_cachedBuiltInForegroundPainters**: `_CompositeRenderEditablePainter?`
- **_cachedBuiltInPainters**: `_CompositeRenderEditablePainter?`
- **ignorePointer**: `bool`
  Whether the [handleEvent] will propagate pointer events to selection
 handlers.

 If this property is true, the [handleEvent] assumes that this renderer
 will be notified of input gestures via [handleTapDown], [handleTap],
 [handleDoubleTap], and [handleLongPress].

 If there are any gesture recognizers in the text span, the [handleEvent]
 will still propagate pointer events to those recognizers.

 The default value of this property is false.

- **_devicePixelRatio**: `double`
- **_obscuringCharacter**: `String`
- **_obscureText**: `bool`
- **textSelectionDelegate**: `TextSelectionDelegate`
  The object that controls the text selection, used by this render object
 for implementing cut, copy, and paste keyboard shortcuts.

 It will make cut, copy and paste functionality work with the most recently
 set [TextSelectionDelegate].

- **_selectionStartInViewport**: `ValueNotifier&lt;bool&gt;`
- **_selectionEndInViewport**: `ValueNotifier&lt;bool&gt;`
- **_textPainter**: `TextPainter`
- **_cachedAttributedValue**: `AttributedString?`
- **_cachedCombinedSemanticsInfos**: `List&lt;InlineSpanSemanticsInformation&gt;?`
- **_textIntrinsicsCache**: `TextPainter?`
- **_disposeShowCursor**: `bool`
- **_showCursor**: `ValueNotifier&lt;bool&gt;`
- **_hasFocus**: `bool`
- **_forceLine**: `bool`
- **_readOnly**: `bool`
- **_maxLines**: `int?`
- **_minLines**: `int?`
- **_expands**: `bool`
- **_selection**: `TextSelection?`
- **_offset**: `ViewportOffset`
- **_cursorWidth**: `double`
- **_cursorHeight**: `double?`
- **_paintCursorOnTop**: `bool`
- **_startHandleLayerLink**: `LayerLink`
- **_endHandleLayerLink**: `LayerLink`
- **floatingCursorAddedMargin**: `EdgeInsets`
  The padding applied to text field. Used to determine the bounds when
 moving the floating cursor.

 Defaults to a padding with left, top and right set to 4, bottom to 5.

 See also:

  * [FloatingCursorDragState], which explains the floating cursor feature
    in detail.

- **_floatingCursorOn**: `bool`
- **_floatingCursorTextPosition**: `TextPosition`
- **_enableInteractiveSelection**: `bool?`
- **_maxScrollExtent**: `double`
- **_clipBehavior**: `Clip`
- **_semanticsInfo**: `List&lt;InlineSpanSemanticsInformation&gt;?`
  Collected during [describeSemanticsConfiguration], used by
 [assembleSemanticsNode].

- **_cachedChildNodes**: `LinkedHashMap&lt;Key, SemanticsNode&gt;?`
- **_cachedLineBreakCount**: `int?`
- **_tap**: `TapGestureRecognizer`
- **_longPress**: `LongPressGestureRecognizer`
- **_lastTapDownPosition**: `Offset?`
- **_lastSecondaryTapDownPosition**: `Offset?`
- **_placeholderDimensions**: `List&lt;PlaceholderDimensions&gt;?`
- **_caretPrototype**: `Rect`
- **_relativeOrigin**: `Offset`
- **_previousOffset**: `Offset?`
- **_shouldResetOrigin**: `bool`
- **_resetOriginOnLeft**: `bool`
- **_resetOriginOnRight**: `bool`
- **_resetOriginOnTop**: `bool`
- **_resetOriginOnBottom**: `bool`
- **_resetFloatingCursorAnimationValue**: `double?`
- **_leaderLayerHandler**: `LayerHandle&lt;LeaderLayer&gt;`
- **_clipRectLayer**: `LayerHandle&lt;ClipRectLayer&gt;`
## Constructors

### Unnamed Constructor
Creates a render object that implements the visual aspects of a text field.

 The [textAlign] argument defaults to [TextAlign.start].

 If [showCursor] is not specified, then it defaults to hiding the cursor.

 The [maxLines] property can be set to null to remove the restriction on
 the number of lines. By default, it is 1, meaning this is a single-line
 text field. If it is not null, it must be greater than zero.

 Use [ViewportOffset.zero] for the [offset] if there is no need for
 scrolling.

