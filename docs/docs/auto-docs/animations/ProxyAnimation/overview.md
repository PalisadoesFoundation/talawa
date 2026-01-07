# Overview for `ProxyAnimation`

## Description

An animation that is a proxy for another animation.

 A proxy animation is useful because the parent animation can be mutated. For
 example, one object can create a proxy animation, hand the proxy to another
 object, and then later change the animation from which the proxy receives
 its value.

## Dependencies

- Animation, AnimationLazyListenerMixin, AnimationLocalListenersMixin, AnimationLocalStatusListenersMixin

## Members

- **_status**: `AnimationStatus?`
- **_value**: `double?`
- **_parent**: `Animation&lt;double&gt;?`
## Constructors

### Unnamed Constructor
Creates a proxy animation.

 If the animation argument is omitted, the proxy animation will have the
 status [AnimationStatus.dismissed] and a value of 0.0.

