# Overview for `CompoundAnimation`

## Description

An interface for combining multiple Animations. Subclasses need only
 implement the `value` getter to control how the child animations are
 combined. Can be chained to combine more than 2 animations.

 For example, to create an animation that is the sum of two others, subclass
 this class and define `T get value = first.value + second.value;`

 By default, the [status] of a [CompoundAnimation] is the status of the
 [next] animation if [next] is moving, and the status of the [first]
 animation otherwise.

## Dependencies

- Animation, AnimationLazyListenerMixin, AnimationLocalListenersMixin, AnimationLocalStatusListenersMixin

## Members

- **first**: `Animation&lt;T&gt;`
  The first sub-animation. Its status takes precedence if neither are
 animating.

- **next**: `Animation&lt;T&gt;`
  The second sub-animation.

- **_lastStatus**: `AnimationStatus?`
- **_lastValue**: `T?`
## Constructors

### Unnamed Constructor
Creates a [CompoundAnimation].

 Either argument can be a [CompoundAnimation] itself to combine multiple animations.

