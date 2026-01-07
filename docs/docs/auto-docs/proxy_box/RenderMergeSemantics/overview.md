# Overview for `RenderMergeSemantics`

## Description

Causes the semantics of all descendants to be merged into this
 node such that the entire subtree becomes a single leaf in the
 semantics tree.

 Useful for combining the semantics of multiple render objects that
 form part of a single conceptual widget, e.g. a checkbox, a label,
 and the gesture detector that goes with them.

## Dependencies

- RenderProxyBox

## Constructors

### Unnamed Constructor
Creates a render object that merges the semantics from its descendants.

