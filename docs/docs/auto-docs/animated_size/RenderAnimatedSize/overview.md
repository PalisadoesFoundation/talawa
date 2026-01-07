# Overview for `RenderAnimatedSize`

## Description

A render object that animates its size to its child's size over a given
 [duration] and with a given [curve]. If the child's size itself animates
 (i.e. if it changes size two frames in a row, as opposed to abruptly
 changing size in one frame then remaining that size in subsequent frames),
 this render object sizes itself to fit the child instead of animating
 itself.

 When the child overflows the current animated size of this render object, it
 is clipped.

## Dependencies

- RenderAligningShiftedBox

## Members

- **_controller**: `AnimationController`
- **_animation**: `CurvedAnimation`
- **_sizeTween**: `SizeTween`
- **_hasVisualOverflow**: `bool`
- **_lastValue**: `double?`
- **_state**: `RenderAnimatedSizeState`
- **_clipBehavior**: `Clip`
- **_vsync**: `TickerProvider`
- **_onEnd**: `VoidCallback?`
- **_currentSize**: `Size`
- **_clipRectLayer**: `LayerHandle&lt;ClipRectLayer&gt;`
## Constructors

### Unnamed Constructor
Creates a render object that animates its size to match its child.
 The [duration] and [curve] arguments define the animation.

 The [alignment] argument is used to align the child when the parent is not
 (yet) the same size as the child.

 The [duration] is required.

 The [vsync] should specify a [TickerProvider] for the animation
 controller.

 The arguments [duration], [curve], [alignment], and [vsync] must
 not be null.

