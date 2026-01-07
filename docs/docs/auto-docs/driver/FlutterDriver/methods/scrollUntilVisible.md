# Method: `scrollUntilVisible`

## Description

Repeatedly [scroll] the widget located by [scrollable] by [dxScroll] and
 [dyScroll] until [item] is visible, and then use [scrollIntoView] to
 ensure the item's final position matches [alignment].

 The [scrollable] must locate the scrolling widget that contains [item].
 Typically `find.byType('ListView')` or `find.byType('CustomScrollView')`.

 At least one of [dxScroll] and [dyScroll] must be non-zero.

 If [item] is below the currently visible items, then specify a negative
 value for [dyScroll] that's a small enough increment to expose [item]
 without potentially scrolling it up and completely out of view. Similarly
 if [item] is above, then specify a positive value for [dyScroll].

 If [item] is to the right of the currently visible items, then
 specify a negative value for [dxScroll] that's a small enough increment to
 expose [item] without potentially scrolling it up and completely out of
 view. Similarly if [item] is to the left, then specify a positive value
 for [dyScroll].

 The [timeout] value should be long enough to accommodate as many scrolls
 as needed to bring an item into view. The default is to not time out.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `scrollable`: `SerializableFinder`
- `item`: `SerializableFinder`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
