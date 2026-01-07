# Overview for `InteractiveInkFeatureFactory`

## Description

An encapsulation of an [InteractiveInkFeature] constructor used by
 [InkWell], [InkResponse], and [ThemeData].

 Interactive ink feature implementations should provide a static const
 `splashFactory` value that's an instance of this class. The `splashFactory`
 can be used to configure an [InkWell], [InkResponse] or [ThemeData].

 See also:

  * [InkSplash.splashFactory]
  * [InkRipple.splashFactory]

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

 Subclasses should provide a const constructor.

