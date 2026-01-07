# Overview for `RenderFollowerLayer`

## Description

Transform the child so that its origin is [offset] from the origin of the
 [RenderLeaderLayer] with the same [LayerLink].

 The [RenderLeaderLayer] in question must be earlier in the paint order.

 Hit testing on descendants of this render object will only work if the
 target position is within the box that this render object's parent considers
 to be hittable.

 See also:

  * [CompositedTransformFollower], the corresponding widget.
  * [FollowerLayer], the layer that this render object creates.

## Dependencies

- RenderProxyBox

## Members

- **_link**: `LayerLink`
- **_showWhenUnlinked**: `bool`
- **_offset**: `Offset`
- **_leaderAnchor**: `Alignment`
- **_followerAnchor**: `Alignment`
## Constructors

### Unnamed Constructor
Creates a render object that uses a [FollowerLayer].

