# Overview for `AnimatedScale`

## Description

Animated version of [Transform.scale] which automatically transitions the child's
 scale over a given duration whenever the given scale changes.

 

 This code defines a widget that uses [AnimatedScale] to change the size
 of [FlutterLogo] gradually to a new scale whenever the button is pressed.

 ```dart
 class LogoScale extends StatefulWidget 

 class LogoScaleState extends State&lt;LogoScale&gt; 
 ```
 

 See also:

  * [AnimatedRotation], for animating the rotation of a child.
  * [AnimatedSize], for animating the resize of a child based on changes
    in layout.
  * [AnimatedSlide], for animating the translation of a child by a given offset relative to its size.
  * [ScaleTransition], an explicitly animated version of this widget, where
    an [Animation] is provided by the caller instead of being built in.

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **scale**: `double`
  The target scale.

- **alignment**: `Alignment`
  The alignment of the origin of the coordinate system in which the scale
 takes place, relative to the size of the box.

 For example, to set the origin of the scale to bottom middle, you can use
 an alignment of (0.0, 1.0).

- **filterQuality**: `FilterQuality?`
  The filter quality with which to apply the transform as a bitmap operation.

 

## Constructors

### Unnamed Constructor
Creates a widget that animates its scale implicitly.

