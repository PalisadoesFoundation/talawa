# Overview for `BeveledRectangleBorder`

## Description

A rectangular border with flattened or "beveled" corners.

 The line segments that connect the rectangle's four sides will
 begin and at locations offset by the corresponding border radius,
 but not farther than the side's center. If all the border radii
 exceed the sides' half widths/heights the resulting shape is
 diamond made by connecting the centers of the sides.

## Dependencies

- OutlinedBorder

## Members

- **borderRadius**: `BorderRadiusGeometry`
  The radii for each corner.

 Each corner [Radius] defines the endpoints of a line segment that
 spans the corner. The endpoints are located in the same place as
 they would be for [RoundedRectangleBorder], but they're connected
 by a straight line instead of an arc.

 Negative radius values are clamped to 0.0 by [getInnerPath] and
 [getOuterPath].

## Constructors

### Unnamed Constructor
Creates a border like a [RoundedRectangleBorder] except that the corners
 are joined by straight lines instead of arcs.

