# Overview for `RenderSemanticsGestureHandler`

## Description

Listens for the specified gestures from the semantics server (e.g.
 an accessibility tool).

## Dependencies

- RenderProxyBoxWithHitTestBehavior

## Members

- **_validActions**: `Set&lt;SemanticsAction&gt;?`
- **_onTap**: `GestureTapCallback?`
- **_onLongPress**: `GestureLongPressCallback?`
- **_onHorizontalDragUpdate**: `GestureDragUpdateCallback?`
- **_onVerticalDragUpdate**: `GestureDragUpdateCallback?`
- **scrollFactor**: `double`
  The fraction of the dimension of this render box to use when
 scrolling. For example, if this is 0.8 and the box is 200 pixels
 wide, then when a left-scroll action is received from the
 accessibility system, it will translate into a 160 pixel
 leftwards drag.

## Constructors

### Unnamed Constructor
Creates a render object that listens for specific semantic gestures.

