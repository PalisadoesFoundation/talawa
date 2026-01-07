# Overview for `TweenSequenceItem`

## Description

A simple holder for one element of a [TweenSequence].

## Members

- **tween**: `Animatable&lt;T&gt;`
  Defines the value of the [TweenSequence] for the interval within the
 animation's duration indicated by [weight] and this item's position
 in the list of items.

 

 The value of this item can be "curved" by chaining it to a [CurveTween].
 For example to create a tween that eases from 0.0 to 10.0:

 ```dart
 Tween&lt;double&gt;(begin: 0.0, end: 10.0)
   .chain(CurveTween(curve: Curves.ease))
 ```
 

- **weight**: `double`
  An arbitrary value that indicates the relative percentage of a
 [TweenSequence] animation's duration when [tween] will be used.

 The percentage for an individual item is the item's weight divided by the
 sum of all of the items' weights.

## Constructors

### Unnamed Constructor
Construct a TweenSequenceItem.

 The [weight] must be greater than 0.0.

