# Overview for `BoxConstraints`

## Description

Immutable layout constraints for [RenderBox] layout.

 A [Size] respects a [BoxConstraints] if, and only if, all of the following
 relations hold:

 * [minWidth] <= [Size.width] <= [maxWidth]
 * [minHeight] <= [Size.height] <= [maxHeight]

 The constraints themselves must satisfy these relations:

 * 0.0 <= [minWidth] <= [maxWidth] <= [double.infinity]
 * 0.0 <= [minHeight] <= [maxHeight] <= [double.infinity]

 [double.infinity] is a legal value for each constraint.

 ## The box layout model

 Render objects in the Flutter framework are laid out by a one-pass layout
 model which walks down the render tree passing constraints, then walks back
 up the render tree passing concrete geometry.

 For boxes, the constraints are [BoxConstraints], which, as described herein,
 consist of four numbers: a minimum width [minWidth], a maximum width
 [maxWidth], a minimum height [minHeight], and a maximum height [maxHeight].

 The geometry for boxes consists of a [Size], which must satisfy the
 constraints described above.

 Each [RenderBox] (the objects that provide the layout models for box
 widgets) receives [BoxConstraints] from its parent, then lays out each of
 its children, then picks a [Size] that satisfies the [BoxConstraints].

 Render objects position their children independently of laying them out.
 Frequently, the parent will use the children's sizes to determine their
 position. A child does not know its position and will not necessarily be
 laid out again, or repainted, if its position changes.

 ## Terminology

 When the minimum constraints and the maximum constraint in an axis are the
 same, that axis is _tightly_ constrained. See: [
 BoxConstraints.tightFor], [BoxConstraints.tightForFinite], [tighten],
 [hasTightWidth], [hasTightHeight], [isTight].

 An axis with a minimum constraint of 0.0 is _loose_ (regardless of the
 maximum constraint; if it is also 0.0, then the axis is simultaneously tight
 and loose!). See: [BoxConstraints.loose], [loosen].

 An axis whose maximum constraint is not infinite is _bounded_. See:
 [hasBoundedWidth], [hasBoundedHeight].

 An axis whose maximum constraint is infinite is _unbounded_. An axis is
 _expanding_ if it is tightly infinite (its minimum and maximum constraints
 are both infinite). See: [BoxConstraints.expand].

 An axis whose _minimum_ constraint is infinite is just said to be _infinite_
 (since by definition the maximum constraint must also be infinite in that
 case). See: [hasInfiniteWidth], [hasInfiniteHeight].

 A size is _constrained_ when it satisfies a [BoxConstraints] description.
 See: [constrain], [constrainWidth], [constrainHeight],
 [constrainDimensions], [constrainSizeAndAttemptToPreserveAspectRatio],
 [isSatisfiedBy].

## Dependencies

- Constraints

## Members

- **minWidth**: `double`
  The minimum width that satisfies the constraints.

- **maxWidth**: `double`
  The maximum width that satisfies the constraints.

 Might be [double.infinity].

- **minHeight**: `double`
  The minimum height that satisfies the constraints.

- **maxHeight**: `double`
  The maximum height that satisfies the constraints.

 Might be [double.infinity].

## Constructors

### Unnamed Constructor
Creates box constraints with the given constraints.

### tight
Creates box constraints that is respected only by the given size.

#### Parameters

- `size`: `Size`
### tightFor
Creates box constraints that require the given width or height.

 See also:

  * [BoxConstraints.tightForFinite], which is similar but instead of
    being tight if the value is non-null, is tight if the value is not
    infinite.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
### tightForFinite
Creates box constraints that require the given width or height, except if
 they are infinite.

 See also:

  * [BoxConstraints.tightFor], which is similar but instead of being
    tight if the value is not infinite, is tight if the value is non-null.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
### loose
Creates box constraints that forbid sizes larger than the given size.

#### Parameters

- `size`: `Size`
### expand
Creates box constraints that expand to fill another box constraints.

 If width or height is given, the constraints will require exactly the
 given value in the given dimension.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
### fromViewConstraints
Creates box constraints that match the given view constraints.

#### Parameters

- `constraints`: `ui.ViewConstraints`
