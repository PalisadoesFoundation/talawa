# Overview for `TextPainter`

## Description

An object that paints a [TextSpan] tree into a [Canvas].

 To use a [TextPainter], follow these steps:

 1. Create a [TextSpan] tree and pass it to the [TextPainter]
    constructor.

 2. Call [layout] to prepare the paragraph.

 3. Call [paint] as often as desired to paint the paragraph.

 4. Call [dispose] when the object will no longer be accessed to release
    native resources. For [TextPainter] objects that are used repeatedly and
    stored on a [State] or [RenderObject], call [dispose] from
    [State.dispose] or [RenderObject.dispose] or similar. For [TextPainter]
    objects that are only used ephemerally, it is safe to immediately dispose
    them after the last call to methods or properties on the object.

 If the width of the area into which the text is being painted
 changes, return to step 2. If the text to be painted changes,
 return to step 1.

 The default text style color is white on non-web platforms and black on
 the web. If developing across both platforms, always set the text color
 explicitly.

## Members

- **_debugNeedsRelayout**: `bool`
- **_layoutCache**: `_TextPainterLayoutCacheWithOffset?`
- **_rebuildParagraphForPaint**: `bool`
- **_debugMarkNeedsLayoutCallStack**: `StackTrace?`
- **_text**: `InlineSpan?`
- **_cachedPlainText**: `String?`
- **_textAlign**: `TextAlign`
- **_textDirection**: `TextDirection?`
- **_textScaler**: `TextScaler`
- **_ellipsis**: `String?`
- **_locale**: `Locale?`
- **_maxLines**: `int?`
- **_strutStyle**: `StrutStyle?`
- **_textWidthBasis**: `TextWidthBasis`
- **_textHeightBehavior**: `TextHeightBehavior?`
- **_placeholderDimensions**: `List&lt;PlaceholderDimensions&gt;?`
- **_layoutTemplate**: `ui.Paragraph?`
- **_caretMetrics**: `_LineCaretMetrics`
- **_disposed**: `bool`
## Constructors

### Unnamed Constructor
Creates a text painter that paints the given text.

 The `text` and `textDirection` arguments are optional but [text] and
 [textDirection] must be non-null before calling [layout].

 The [maxLines] property, if non-null, must be greater than zero.

