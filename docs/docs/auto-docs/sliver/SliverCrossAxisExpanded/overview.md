# Overview for `SliverCrossAxisExpanded`

## Description

Set a flex factor for allocating space in the cross axis direction.

 This is a [ParentDataWidget] to be used in [SliverCrossAxisGroup].
 After all slivers with null or zero flex (e.g. [SliverConstrainedCrossAxis])
 are laid out (which should determine their own [SliverGeometry.crossAxisExtent]),
 the remaining space is laid out among the slivers with nonzero flex
 proportionally to their flex value.

## Dependencies

- ParentDataWidget

## Members

- **flex**: `int`
  Flex value for allocating cross axis extent left after laying out the children with
 constrained cross axis. The children with flex values will have the remaining extent
 allocated proportionally to their flex value. This must an integer between
 0 and infinity, exclusive.

## Constructors

### Unnamed Constructor
Creates an object that assigns a [flex] value to the child sliver.

 The provided [flex] value must be greater than 0.

