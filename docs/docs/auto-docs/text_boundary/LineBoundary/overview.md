# Overview for `LineBoundary`

## Description

A [TextBoundary] subclass for locating closest line breaks to a given
 `position`.

 When the given `position` points to a hard line break, the returned range
 is the line's content range before the hard line break, and does not contain
 the given `position`. For instance, the line breaks at `position = 1` for
 "a\nb" is `[0, 1)`, which does not contain the position `1`.

## Dependencies

- TextBoundary

## Members

- **_textLayout**: `TextLayoutMetrics`
## Constructors

### Unnamed Constructor
Creates a [LineBoundary] with the text and layout information.

