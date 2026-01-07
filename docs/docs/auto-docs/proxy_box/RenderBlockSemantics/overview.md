# Overview for `RenderBlockSemantics`

## Description

Causes the semantics of all earlier render objects below the same semantic
 boundary to be dropped.

 This is useful in a stack where an opaque mask should prevent interactions
 with the render objects painted below the mask.

## Dependencies

- RenderProxyBox

## Members

- **_blocking**: `bool`
## Constructors

### Unnamed Constructor
Create a render object that blocks semantics for nodes below it in paint
 order.

