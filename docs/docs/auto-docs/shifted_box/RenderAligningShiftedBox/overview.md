# Overview for `RenderAligningShiftedBox`

## Description

Abstract class for one-child-layout render boxes that use a
 [AlignmentGeometry] to align their children.

## Dependencies

- RenderShiftedBox

## Members

- **_resolvedAlignment**: `Alignment?`
- **_alignment**: `AlignmentGeometry`
- **_textDirection**: `TextDirection?`
## Constructors

### Unnamed Constructor
Initializes member variables for subclasses.

 The [textDirection] must be non-null if the [alignment] is
 direction-sensitive.

