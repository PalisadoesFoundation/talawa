# Overview for `OverscrollIndicatorNotification`

## Description

A notification that either a [GlowingOverscrollIndicator] or a
 [StretchingOverscrollIndicator] will start showing an overscroll indication.

 To prevent the indicator from showing the indication, call
 [disallowIndicator] on the notification.

 See also:

  * [GlowingOverscrollIndicator], which generates this type of notification
    by painting an indicator over the child content.
  * [StretchingOverscrollIndicator], which generates this type of
    notification by applying a stretch transformation to the child content.

## Dependencies

- Notification, ViewportNotificationMixin

## Members

- **leading**: `bool`
  Whether the indication will be shown on the leading edge of the scroll
 view.

- **paintOffset**: `double`
  Controls at which offset a [GlowingOverscrollIndicator] draws.

 A positive offset will move the glow away from its edge,
 i.e. for a vertical, [leading] indicator, a [paintOffset] of 100.0 will
 draw the indicator 100.0 pixels from the top of the edge.
 For a vertical indicator with [leading] set to `false`, a [paintOffset]
 of 100.0 will draw the indicator 100.0 pixels from the bottom instead.

 A negative [paintOffset] is generally not useful, since the glow will be
 clipped.

 This has no effect on a [StretchingOverscrollIndicator].

- **accepted**: `bool`
  Whether the current overscroll event will allow for the indicator to be
 shown.

 Calling [disallowIndicator] sets this to false, preventing the over scroll
 indicator from showing.

 Defaults to true.

## Constructors

### Unnamed Constructor
Creates a notification that an [GlowingOverscrollIndicator] or a
 [StretchingOverscrollIndicator] will start showing an overscroll indication.

