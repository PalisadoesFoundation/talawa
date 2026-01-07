# Overview for `TrainHoppingAnimation`

## Description

This animation starts by proxying one animation, but when the value of that
 animation crosses the value of the second (either because the second is
 going in the opposite direction, or because the one overtakes the other),
 the animation hops over to proxying the second animation.

 When the [TrainHoppingAnimation] starts proxying the second animation
 instead of the first, the [onSwitchedTrain] callback is called.

 If the two animations start at the same value, then the
 [TrainHoppingAnimation] immediately hops to the second animation, and the
 [onSwitchedTrain] callback is not called. If only one animation is provided
 (i.e. if the second is null), then the [TrainHoppingAnimation] just proxies
 the first animation.

 Since this object must track the two animations even when it has no
 listeners of its own, instead of shutting down when all its listeners are
 removed, it exposes a [] method. Call this method to shut this
 object down.

## Dependencies

- Animation, AnimationEagerListenerMixin, AnimationLocalListenersMixin, AnimationLocalStatusListenersMixin

## Members

- **_currentTrain**: `Animation&lt;double&gt;?`
- **_nextTrain**: `Animation&lt;double&gt;?`
- **_mode**: `_TrainHoppingMode?`
- **onSwitchedTrain**: `VoidCallback?`
  Called when this animation switches to be driven by the second animation.

 This is not called if the two animations provided to the constructor have
 the same value at the time of the call to the constructor. In that case,
 the second animation is used from the start, and the first is ignored.

- **_lastStatus**: `AnimationStatus?`
- **_lastValue**: `double?`
## Constructors

### Unnamed Constructor
Creates a train-hopping animation.

 The current train argument must not be null but the next train argument
 can be null. If the next train is null, then this object will just proxy
 the first animation and never hop.

