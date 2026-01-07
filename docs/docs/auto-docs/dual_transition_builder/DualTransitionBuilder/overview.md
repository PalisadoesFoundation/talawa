# Overview for `DualTransitionBuilder`

## Description

A transition builder that animates its [child] based on the
 [AnimationStatus] of the provided [animation].

 This widget can be used to specify different enter and exit transitions for
 a [child].

 While the [animation] runs forward, the [child] is animated according to
 [forwardBuilder] and while the [animation] is running in reverse, it is
 animated according to [reverseBuilder].

 Using this builder allows the widget tree to maintain its shape by nesting
 the enter and exit transitions. This ensures that no state information of
 any descendant widget is lost when the transition starts or completes.

## Dependencies

- StatefulWidget

## Members

- **animation**: `Animation&lt;double&gt;`
  The animation that drives the [child]'s transition.

 When this animation runs forward, the [child] transitions as specified by
 [forwardBuilder]. When it runs in reverse, the child transitions according
 to [reverseBuilder].

- **forwardBuilder**: `AnimatedTransitionBuilder`
  A builder for the transition that makes [child] appear on screen.

 The [child] should be fully visible when the provided `animation` reaches
 1.0.

 The `animation` provided to this builder is running forward from 0.0 to
 1.0 when [animation] runs _forward_. When [animation] runs in reverse,
 the given `animation` is set to [kAlwaysCompleteAnimation].

 See also:

  * [reverseBuilder], which builds the transition for making the [child]
   disappear from the screen.

- **reverseBuilder**: `AnimatedTransitionBuilder`
  A builder for a transition that makes [child] disappear from the screen.

 The [child] should be fully invisible when the provided `animation`
 reaches 1.0.

 The `animation` provided to this builder is running forward from 0.0 to
 1.0 when [animation] runs in _reverse_. When [animation] runs forward,
 the given `animation` is set to [kAlwaysDismissedAnimation].

 See also:

  * [forwardBuilder], which builds the transition for making the [child]
    appear on screen.

- **child**: `Widget?`
  The widget below this [DualTransitionBuilder] in the tree.

 This child widget will be wrapped by the transitions built by
 [forwardBuilder] and [reverseBuilder].

## Constructors

### Unnamed Constructor
Creates a [DualTransitionBuilder].

