# Method: `correctPixels`

## Description

Change the value of [pixels] to the new value, without notifying any
 customers.

 This is used to adjust the position while doing layout. In particular,
 this is typically called as a response to [applyViewportDimension] or
 [applyContentDimensions] (in both cases, if this method is called, those
 methods should then return false to indicate that the position has been
 adjusted).

 Calling this is rarely correct in other contexts. It will not immediately
 cause the rendering to change, since it does not notify the widgets or
 render objects that might be listening to this object: they will only
 change when they next read the value, which could be arbitrarily later. It
 is generally only appropriate in the very specific case of the value being
 corrected during layout (since then the value is immediately read), in the
 specific case of a [ScrollPosition] with a single viewport customer.

 To cause the position to jump or animate to a new value, consider [jumpTo]
 or [animateTo], which will honor the normal conventions for changing the
 scroll offset.

 To force the [pixels] to a particular value without honoring the normal
 conventions for changing the scroll offset, consider [forcePixels]. (But
 see the discussion there for why that might still be a bad idea.)

 See also:

  * [correctBy], which is a method of [ViewportOffset] used
    by viewport render objects to correct the offset during layout
    without notifying its listeners.
  * [jumpTo], for making changes to position while not in the
    middle of layout and applying the new position immediately.
  * [animateTo], which is like [jumpTo] but animating to the
    destination offset.

## Return Type
`void`

## Parameters

- `value`: `double`
