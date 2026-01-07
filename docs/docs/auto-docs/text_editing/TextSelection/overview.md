# Overview for `TextSelection`

## Description

A range of text that represents a selection.

## Dependencies

- TextRange

## Members

- **baseOffset**: `int`
  The offset at which the selection originates.

 Might be larger than, smaller than, or equal to extent.

- **extentOffset**: `int`
  The offset at which the selection terminates.

 When the user uses the arrow keys to adjust the selection, this is the
 value that changes. Similarly, if the current theme paints a caret on one
 side of the selection, this is the location at which to paint the caret.

 Might be larger than, smaller than, or equal to base.

- **affinity**: `TextAffinity`
  If the text range is collapsed and has more than one visual location
 (e.g., occurs at a line break), which of the two locations to use when
 painting the caret.

- **isDirectional**: `bool`
  Whether this selection has disambiguated its base and extent.

 On some platforms, the base and extent are not disambiguated until the
 first time the user adjusts the selection. At that point, either the start
 or the end of the selection becomes the base and the other one becomes the
 extent and is adjusted.

## Constructors

### Unnamed Constructor
Creates a text selection.

### collapsed
Creates a collapsed selection at the given offset.

 A collapsed selection starts and ends at the same offset, which means it
 contains zero characters but instead serves as an insertion point in the
 text.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
### fromPosition
Creates a collapsed selection at the given text position.

 A collapsed selection starts and ends at the same offset, which means it
 contains zero characters but instead serves as an insertion point in the
 text.

#### Parameters

- `position`: `TextPosition`
