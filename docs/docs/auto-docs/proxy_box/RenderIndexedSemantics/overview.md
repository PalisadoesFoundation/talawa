# Overview for `RenderIndexedSemantics`

## Description

A render objects that annotates semantics with an index.

 Certain widgets will automatically provide a child index for building
 semantics. For example, the [ScrollView] uses the index of the first
 visible child semantics node to determine the
 [SemanticsConfiguration.scrollIndex].

 See also:

  * [CustomScrollView], for an explanation of scroll semantics.

## Dependencies

- RenderProxyBox

## Members

- **_index**: `int`
## Constructors

### Unnamed Constructor
Creates a render object that annotates the child semantics with an index.

