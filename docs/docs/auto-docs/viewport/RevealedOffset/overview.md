# Overview for `RevealedOffset`

## Description

Return value for [RenderAbstractViewport.getOffsetToReveal].

 It indicates the [offset] required to reveal an element in a viewport and
 the [rect] position said element would have in the viewport at that
 [offset].

## Members

- **offset**: `double`
  Offset for the viewport to reveal a specific element in the viewport.

 See also:

  * [RenderAbstractViewport.getOffsetToReveal], which calculates this
    value for a specific element.

- **rect**: `Rect`
  The [Rect] in the outer coordinate system of the viewport at which the
 to-be-revealed element would be located if the viewport's offset is set
 to [offset].

 A viewport usually has two coordinate systems and works as an adapter
 between the two:

 The inner coordinate system has its origin at the top left corner of the
 content that moves inside the viewport. The origin of this coordinate
 system usually moves around relative to the leading edge of the viewport
 when the viewport offset changes.

 The outer coordinate system has its origin at the top left corner of the
 visible part of the viewport. This origin stays at the same position
 regardless of the current viewport offset.

 In other words: [rect] describes where the revealed element would be
 located relative to the top left corner of the visible part of the
 viewport if the viewport's offset is set to [offset].

 See also:

  * [RenderAbstractViewport.getOffsetToReveal], which calculates this
    value for a specific element.

## Constructors

### Unnamed Constructor
Instantiates a return value for [RenderAbstractViewport.getOffsetToReveal].

