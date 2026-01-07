# Overview for `EdgeDraggingAutoScroller`

## Description

An auto scroller that scrolls the [scrollable] if a drag gesture drags close
 to its edge.

 The scroll velocity is controlled by the [velocityScalar]:

 velocity = (distance of overscroll) * [velocityScalar].

## Members

- **scrollable**: `ScrollableState`
  The [Scrollable] this auto scroller is scrolling.

- **onScrollViewScrolled**: `VoidCallback?`
  Called when a scroll view is scrolled.

 The scroll view may be scrolled multiple times in a row until the drag
 target no longer triggers the auto scroll. This callback will be called
 in between each scroll.

- **velocityScalar**: `double`
  
 The velocity scalar per pixel over scroll.

 It represents how the velocity scale with the over scroll distance. The
 auto-scroll velocity = (distance of overscroll) * velocityScalar.
 

- **_dragTargetRelatedToScrollOrigin**: `Rect`
- **_scrolling**: `bool`
## Constructors

### Unnamed Constructor
Creates a auto scroller that scrolls the [scrollable].

