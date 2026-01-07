# Overview for `NoSplash`

## Description

An [InteractiveInkFeature] that doesn't paint a splash.

 Use [NoSplash.splashFactory] to defeat the default ink splash drawn by
 an [InkWell] or [ButtonStyle]. For example, to create an [ElevatedButton]
 that does not draw the default "ripple" ink splash when it's tapped:

 ```dart
 ElevatedButton(
   style: ElevatedButton.styleFrom(
     splashFactory: NoSplash.splashFactory,
   ),
   onPressed:  ,
   child: const Text('No Splash'),
 )
 ```

## Dependencies

- InteractiveInkFeature

## Members

- **splashFactory**: `InteractiveInkFeatureFactory`
  Used to specify this type of ink splash for an [InkWell], [InkResponse]
 material [Theme], or [ButtonStyle].

## Constructors

### Unnamed Constructor
Create an [InteractiveInkFeature] that doesn't paint a splash.

