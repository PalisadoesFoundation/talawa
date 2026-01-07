# Overview for `AnimatedRotation`

## Description

Animated version of [Transform.rotate] which automatically transitions the child's
 rotation over a given duration whenever the given rotation changes.

 

 This code defines a widget that uses [AnimatedRotation] to rotate a [FlutterLogo]
 gradually by an eighth of a turn (45 degrees) with each press of the button.

 ```dart
 class LogoRotate extends StatefulWidget 

 class LogoRotateState extends State&lt;LogoRotate&gt; 
 ```
 

 See also:

  * [AnimatedScale], for animating the scale of a child.
  * [RotationTransition], an explicitly animated version of this widget, where
    an [Animation] is provided by the caller instead of being built in.

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **turns**: `double`
  The animation that controls the rotation of the child.

 If the current value of the turns animation is v, the child will be
 rotated v * 2 * pi radians before being painted.

- **alignment**: `Alignment`
  The alignment of the origin of the coordinate system in which the rotation
 takes place, relative to the size of the box.

 For example, to set the origin of the rotation to bottom middle, you can use
 an alignment of (0.0, 1.0).

- **filterQuality**: `FilterQuality?`
  The filter quality with which to apply the transform as a bitmap operation.

 

## Constructors

### Unnamed Constructor
Creates a widget that animates its rotation implicitly.

