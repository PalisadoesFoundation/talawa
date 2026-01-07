# Overview for `RenderSector`

## Description

Base class for [RenderObject]s that live in a polar coordinate space.

 In a polar coordinate system each point on a plane is determined by a
 distance from a reference point ("radius") and an angle from a reference
 direction ("theta").

 See also:

  * <https://en.wikipedia.org/wiki/Polar_coordinate_system>, which defines
    the polar coordinate space.
  * [RenderBox], which is the base class for [RenderObject]s that live in a
    Cartesian coordinate space.

## Dependencies

- RenderObject

## Members

- **deltaRadius**: `double`
- **deltaTheta**: `double`
