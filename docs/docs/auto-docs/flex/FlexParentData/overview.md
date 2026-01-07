# Overview for `FlexParentData`

## Description

Parent data for use with [RenderFlex].

## Dependencies

- ContainerBoxParentData

## Members

- **flex**: `int?`
  The flex factor to use for this child.

 If null or zero, the child is inflexible and determines its own size. If
 non-zero, the amount of space the child's can occupy in the main axis is
 determined by dividing the free space (after placing the inflexible
 children) according to the flex factors of the flexible children.

- **fit**: `FlexFit?`
  How a flexible child is inscribed into the available space.

 If [flex] is non-zero, the [fit] determines whether the child fills the
 space the parent makes available during layout. If the fit is
 [FlexFit.tight], the child is required to fill the available space. If the
 fit is [FlexFit.loose], the child can be at most as large as the available
 space (but is allowed to be smaller).

