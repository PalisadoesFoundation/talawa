# Overview for `VerticalCaretMovementRun`

## Description

The consecutive sequence of [TextPosition]s that the caret should move to
 when the user navigates the paragraph using the upward arrow key or the
 downward arrow key.

 
 When the user presses the upward arrow key or the downward arrow key, on
 many platforms (macOS for instance), the caret will move to the previous
 line or the next line, while maintaining its original horizontal location.
 When it encounters a shorter line, the caret moves to the closest horizontal
 location within that line, and restores the original horizontal location
 when a long enough line is encountered.

 Additionally, the caret will move to the beginning of the document if the
 upward arrow key is pressed and the caret is already on the first line. If
 the downward arrow key is pressed next, the caret will restore its original
 horizontal location and move to the second line. Similarly the caret moves
 to the end of the document if the downward arrow key is pressed when it's
 already on the last line.

 Consider a left-aligned paragraph:
   aa|
   a
   aaa
 where the caret was initially placed at the end of the first line. Pressing
 the downward arrow key once will move the caret to the end of the second
 line, and twice the arrow key moves to the third line after the second "a"
 on that line. Pressing the downward arrow key again, the caret will move to
 the end of the third line (the end of the document). Pressing the upward
 arrow key in this state will result in the caret moving to the end of the
 second line.

 Vertical caret runs are typically interrupted when the layout of the text
 changes (including when the text itself changes), or when the selection is
 changed by other input events or programmatically (for example, when the
 user pressed the left arrow key).
 

 The [movePrevious] method moves the caret location (which is
 [VerticalCaretMovementRun.current]) to the previous line, and in case
 the caret is already on the first line, the method does nothing and returns
 false. Similarly the [moveNext] method moves the caret to the next line, and
 returns false if the caret is already on the last line.

 The [moveByOffset] method takes a pixel offset from the current position to move
 the caret up or down.

 If the underlying paragraph's layout changes, [isValid] becomes false and
 the [VerticalCaretMovementRun] must not be used. The [isValid] property must
 be checked before calling [movePrevious], [moveNext] and [moveByOffset],
 or accessing [current].

## Dependencies

- Iterator

## Members

- **_currentOffset**: `Offset`
- **_currentLine**: `int`
- **_currentTextPosition**: `TextPosition`
- **_lineMetrics**: `List<ui.LineMetrics>`
- **_editable**: `RenderEditable`
- **_isValid**: `bool`
- **_positionCache**: `Map&lt;int, MapEntry&lt;Offset, TextPosition&gt;&gt;`
## Constructors

### _


#### Parameters

- `_editable`: `dynamic`
- `_lineMetrics`: `dynamic`
- `_currentTextPosition`: `dynamic`
- `_currentLine`: `dynamic`
- `_currentOffset`: `dynamic`
