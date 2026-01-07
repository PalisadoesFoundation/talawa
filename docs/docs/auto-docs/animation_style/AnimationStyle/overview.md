# Overview for `AnimationStyle`

## Description

Used to override the default parameters of an animation.

 Currently, this class is used by the following widgets:
 - [ExpansionTile]
 - [MaterialApp]
 - [PopupMenuButton]
 - [ScaffoldMessengerState.showSnackBar]
 - [showBottomSheet]
 - [showModalBottomSheet]

 If [duration] and [reverseDuration] are set to [Duration.zero], the
 corresponding animation will be disabled.

 All of the parameters are optional. If no parameters are specified,
 the default animation will be used.

## Dependencies

- Diagnosticable

## Members

- **noAnimation**: `AnimationStyle`
  Creates an instance of Animation Style class with no animation.

- **curve**: `Curve?`
  When specified, the animation will use this curve.

- **duration**: `Duration?`
  When specified, the animation will use this duration.

- **reverseCurve**: `Curve?`
  When specified, the reverse animation will use this curve.

- **reverseDuration**: `Duration?`
  When specified, the reverse animation will use this duration.

## Constructors

### Unnamed Constructor
Creates an instance of Animation Style class.

