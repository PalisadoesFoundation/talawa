# Overview for `HeroController`

## Description

A [Navigator] observer that manages [Hero] transitions.

 An instance of [HeroController] should be used in [Navigator.observers].
 This is done automatically by [MaterialApp].

## Dependencies

- NavigatorObserver

## Members

- **createRectTween**: `CreateRectTween?`
  Used to create [RectTween]s that interpolate the position of heroes in flight.

 If null, the controller uses a linear [RectTween].

- **_flights**: `Map&lt;Object, _HeroFlight&gt;`
## Constructors

### Unnamed Constructor
Creates a hero controller with the given [RectTween] constructor if any.

 The [createRectTween] argument is optional. If null, the controller uses a
 linear [Tween&lt;Rect&gt;].

