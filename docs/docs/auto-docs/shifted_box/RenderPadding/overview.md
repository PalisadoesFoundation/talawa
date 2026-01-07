# Overview for `RenderPadding`

## Description

Insets its child by the given padding.

 When passing layout constraints to its child, padding shrinks the
 constraints by the given padding, causing the child to layout at a smaller
 size. Padding then sizes itself to its child's size, inflated by the
 padding, effectively creating empty space around the child.

## Dependencies

- RenderShiftedBox

## Members

- **_resolvedPaddingCache**: `EdgeInsets?`
- **_padding**: `EdgeInsetsGeometry`
- **_textDirection**: `TextDirection?`
## Constructors

### Unnamed Constructor
Creates a render object that insets its child.

 The [padding] argument must have non-negative insets.

