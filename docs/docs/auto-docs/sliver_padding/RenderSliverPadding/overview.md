# Overview for `RenderSliverPadding`

## Description

Insets a [RenderSliver], applying padding on each side.

 A [RenderSliverPadding] object wraps the [SliverGeometry.layoutExtent] of
 its child. Any incoming [SliverConstraints.overlap] is ignored and not
 passed on to the child.

 

## Dependencies

- RenderSliverEdgeInsetsPadding

## Members

- **_resolvedPadding**: `EdgeInsets?`
- **_padding**: `EdgeInsetsGeometry`
- **_textDirection**: `TextDirection?`
## Constructors

### Unnamed Constructor
Creates a render object that insets its child in a viewport.

 The [padding] argument must have non-negative insets.

