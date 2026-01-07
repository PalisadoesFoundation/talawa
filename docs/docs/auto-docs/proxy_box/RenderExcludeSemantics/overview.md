# Overview for `RenderExcludeSemantics`

## Description

Excludes this subtree from the semantic tree.

 When [excluding] is true, this render object (and its subtree) is excluded
 from the semantic tree.

 Useful e.g. for hiding text that is redundant with other text next
 to it (e.g. text included only for the visual effect).

## Dependencies

- RenderProxyBox

## Members

- **_excluding**: `bool`
## Constructors

### Unnamed Constructor
Creates a render object that ignores the semantics of its subtree.

