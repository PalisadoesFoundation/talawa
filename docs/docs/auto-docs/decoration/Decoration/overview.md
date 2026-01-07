# Overview for `Decoration`

## Description

A description of a box decoration (a decoration applied to a [Rect]).

 This class presents the abstract interface for all decorations.
 See [BoxDecoration] for a concrete example.

 To actually paint a [Decoration], use the [createBoxPainter]
 method to obtain a [BoxPainter]. [Decoration] objects can be
 shared between boxes; [BoxPainter] objects can cache resources to
 make painting on a particular surface faster.

## Dependencies

- Diagnosticable

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

