# Overview for `RenderConstrainedBox`

## Description

Imposes additional constraints on its child.

 A render constrained box proxies most functions in the render box protocol
 to its child, except that when laying out its child, it tightens the
 constraints provided by its parent by enforcing the [additionalConstraints]
 as well.

 For example, if you wanted [child] to have a minimum height of 50.0 logical
 pixels, you could use `const BoxConstraints(minHeight: 50.0)` as the
 [additionalConstraints].

## Dependencies

- RenderProxyBox

## Members

- **_additionalConstraints**: `BoxConstraints`
## Constructors

### Unnamed Constructor
Creates a render box that constrains its child.

 The [additionalConstraints] argument must be valid.

