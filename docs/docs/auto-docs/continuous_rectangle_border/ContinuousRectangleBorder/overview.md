# Overview for `ContinuousRectangleBorder`

## Description

A rectangular border with smooth continuous transitions between the straight
 sides and the rounded corners.

 
 ```dart
 Widget build(BuildContext context) 
 ```
 

 See also:

  * [RoundedRectangleBorder] Which creates rectangles with rounded corners,
    however its straight sides change into a rounded corner with a circular
    radius in a step function instead of gradually like the
    [ContinuousRectangleBorder].

## Dependencies

- OutlinedBorder

## Members

- **borderRadius**: `BorderRadiusGeometry`
  The radius for each corner.

 Negative radius values are clamped to 0.0 by [getInnerPath] and
 [getOuterPath].

## Constructors

### Unnamed Constructor
Creates a [ContinuousRectangleBorder].

