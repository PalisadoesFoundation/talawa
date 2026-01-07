# Overview for `MagnifierInfo`

## Description

A data class that contains the geometry information of text layouts
 and selection gestures, used to position magnifiers.

## Members

- **empty**: `MagnifierInfo`
  Const [MagnifierInfo] with all values set to 0.

- **globalGesturePosition**: `Offset`
  The offset of the gesture position that the magnifier should be shown at.

- **currentLineBoundaries**: `Rect`
  The rect of the current line the magnifier should be shown at, without
 taking into account any padding of the field; only the position of the
 first and last character.

- **caretRect**: `Rect`
  The rect of the handle that the magnifier should follow.

- **fieldBounds**: `Rect`
  The bounds of the entire text field that the magnifier is bound to.

## Constructors

### Unnamed Constructor
Constructs a [MagnifierInfo] from provided geometry values.

