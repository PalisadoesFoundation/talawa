# Overview for `MacOSScrollViewFlingVelocityTracker`

## Description

A [VelocityTracker] subclass that provides a close approximation of macOS
 scroll view's velocity estimation strategy.

 The estimated velocity reported by this class is a close approximation of
 the velocity a macOS scroll view would report with the same
 [PointerMoveEvent]s, when the touch that initiates a fling is released.

 This class differs from the [VelocityTracker] class in that it uses weighted
 average of the latest few velocity samples of the tracked pointer, instead
 of doing a linear regression on a relatively large amount of data points, to
 estimate the velocity of the tracked pointer. Adding data points and
 estimating the velocity are both cheap.

 To obtain a velocity, call [getVelocity] or [getVelocityEstimate]. The
 estimated velocity is typically used as the initial flinging velocity of a
 `Scrollable`, when its drag gesture ends.

## Dependencies

- IOSScrollViewFlingVelocityTracker

## Constructors

### Unnamed Constructor
Create a new MacOSScrollViewFlingVelocityTracker.

