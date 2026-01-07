# Overview for `RangeMaintainingScrollPhysics`

## Description

Scroll physics that attempt to keep the scroll position in range when the
 contents change dimensions suddenly.

 This attempts to maintain the amount of overscroll or underscroll already present,
 if the scroll position is already out of range _and_ the extents
 have decreased, meaning that some content was removed. The reason for this
 condition is that when new content is added, keeping the same overscroll
 would mean that instead of showing it to the user, all of it is
 being skipped by jumping right to the max extent.

 If the scroll activity is animating the scroll position, sudden changes to
 the scroll dimensions are allowed to happen (so as to prevent animations
 from jumping back and forth between in-range and out-of-range values).

 These physics should be combined with other scroll physics, e.g.
 [BouncingScrollPhysics] or [ClampingScrollPhysics], to obtain a complete
 description of typical scroll physics. See [applyTo].

 ## Implementation details

 Specifically, these physics perform two adjustments.

 The first is to maintain overscroll when the position is out of range.

 The second is to enforce the boundary when the position is in range.

 If the current velocity is non-zero, neither adjustment is made. The
 assumption is that there is an ongoing animation and therefore
 further changing the scroll position would disrupt the experience.

 If the extents haven't changed, then the overscroll adjustment is
 not made. The assumption is that if the position is overscrolled,
 it is intentional, otherwise the position could not have reached
 that position. (Consider [ClampingScrollPhysics] vs
 [BouncingScrollPhysics] for example.)

 If the position itself changed since the last animation frame,
 then the overscroll is not maintained. The assumption is similar
 to the previous case: the position would not have been placed out
 of range unless it was intentional.

 In addition, if the position changed and the boundaries were and
 still are finite, then the boundary isn't enforced either, for
 the same reason. However, if any of the boundaries were or are
 now infinite, the boundary _is_ enforced, on the assumption that
 infinite boundaries indicate a lazy-loading scroll view, which
 cannot enforce boundaries while the full list has not loaded.

 If the range was out of range, then the boundary is not enforced
 even if the range is not maintained. If the range is maintained,
 then the distance between the old position and the old boundary is
 applied to the new boundary to obtain the new position.

 If the range was in range, and the boundary is to be enforced,
 then the new position is obtained by deferring to the other physics,
 if any, and then clamped to the new range.

## Dependencies

- ScrollPhysics

## Constructors

### Unnamed Constructor
Creates scroll physics that maintain the scroll position in range.

