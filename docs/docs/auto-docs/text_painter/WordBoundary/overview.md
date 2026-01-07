# Overview for `WordBoundary`

## Description

A [TextBoundary] subclass for locating word breaks.

 The underlying implementation uses [UAX #29](https://unicode.org/reports/tr29/)
 defined default word boundaries.

 The default word break rules can be tailored to meet the requirements of
 different use cases. For instance, the default rule set keeps horizontal
 whitespaces together as a single word, which may not make sense in a
 word-counting context -- "hello    world" counts as 3 words instead of 2.
 An example is the [moveByWordBoundary] variant, which is a tailored
 word-break locator that more closely matches the default behavior of most
 platforms and editors when it comes to handling text editing keyboard
 shortcuts that move or delete word by word.

## Dependencies

- TextBoundary

## Members

- **_text**: `InlineSpan`
- **_paragraph**: `ui.Paragraph`
- **_regExpSpaceSeparatorOrPunctuation**: `RegExp`
- **moveByWordBoundary**: `TextBoundary`
  Returns a [TextBoundary] suitable for handling keyboard navigation
 commands that change the current selection word by word.

 This [TextBoundary] is used by text widgets in the flutter framework to
 provide default implementation for text editing shortcuts, for example,
 "delete to the previous word".

 The implementation applies the same set of rules [WordBoundary] uses,
 except that word breaks end on a space separator or a punctuation will be
 skipped, to match the behavior of most platforms. Additional rules may be
 added in the future to better match platform behaviors.

## Constructors

### _
Creates a [WordBoundary] with the text and layout information.

#### Parameters

- `_text`: `dynamic`
- `_paragraph`: `dynamic`
