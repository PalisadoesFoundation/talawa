# Overview for `ValueKey`

## Description

A key that uses a value of a particular type to identify itself.

 A [ValueKey&lt;T&gt;] is equal to another [ValueKey&lt;T&gt;] if, and only if, their
 values are [operator==].

 This class can be subclassed to create value keys that will not be equal to
 other value keys that happen to use the same value. If the subclass is
 private, this results in a value key type that cannot collide with keys from
 other sources, which could be useful, for example, if the keys are being
 used as fallbacks in the same scope as keys supplied from another widget.

 See also:

  * [Widget.key], which discusses how widgets use keys.

## Dependencies

- LocalKey

## Members

- **value**: `T`
  The value to which this key delegates its [operator==]

## Constructors

### Unnamed Constructor
Creates a key that delegates its [operator==] to the given value.

