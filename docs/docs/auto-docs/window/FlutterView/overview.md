# Overview for `FlutterView`

## Description

A view into which a Flutter [Scene] is drawn.

 Each [FlutterView] has its own layer tree that is rendered
 whenever [render] is called on it with a [Scene].

 References to [FlutterView] objects are obtained via the [PlatformDispatcher].

 ## Insets and Padding

 

 In this illustration, the black areas represent system UI that the app
 cannot draw over. The red area represents view padding that the view may not
 be able to detect gestures in and may not want to draw in. The grey area
 represents the system keyboard, which can cover over the bottom view padding
 when visible.

 The [viewInsets] are the physical pixels which the operating
 system reserves for system UI, such as the keyboard, which would fully
 obscure any content drawn in that area.

 The [viewPadding] are the physical pixels on each side of the
 display that may be partially obscured by system UI or by physical
 intrusions into the display, such as an overscan region on a television or a
 "notch" on a phone. Unlike the insets, these areas may have portions that
 show the user view-painted pixels without being obscured, such as a
 notch at the top of a phone that covers only a subset of the area. Insets,
 on the other hand, either partially or fully obscure the window, such as an
 opaque keyboard or a partially translucent status bar, which cover an area
 without gaps.

 The [padding] property is computed from both
 [viewInsets] and [viewPadding]. It will allow a
 view inset to consume view padding where appropriate, such as when a phone's
 keyboard is covering the bottom view padding and so "absorbs" it.

 Clients that want to position elements relative to the view padding
 regardless of the view insets should use the [viewPadding]
 property, e.g. if you wish to draw a widget at the center of the screen with
 respect to the iPhone "safe area" regardless of whether the keyboard is
 showing.

 [padding] is useful for clients that want to know how much
 padding should be accounted for without concern for the current inset(s)
 state, e.g. determining whether a gesture should be considered for scrolling
 purposes. This value varies based on the current state of the insets. For
 example, a visible keyboard will consume all gestures in the bottom part of
 the [viewPadding] anyway, so there is no need to account for
 that in the [padding], which is always safe to use for such
 calculations.

## Members

- **viewId**: `int`
  The opaque ID for this view.

- **platformDispatcher**: `PlatformDispatcher`
  The platform dispatcher that this view is registered with, and gets its
 information from.

- **_viewConfiguration**: `_ViewConfiguration`
  The configuration of this view.

## Constructors

### _


#### Parameters

- `viewId`: `dynamic`
- `platformDispatcher`: `dynamic`
- `_viewConfiguration`: `dynamic`
