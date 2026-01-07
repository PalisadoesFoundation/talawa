# Overview for `TextBoundary`

## Description

An interface for retrieving the logical text boundary (as opposed to the
 visual boundary) at a given code unit offset in a document.

 Either the [getTextBoundaryAt] method, or both the
 [getLeadingTextBoundaryAt] method and the [getTrailingTextBoundaryAt] method
 must be implemented.

## Constructors

### Unnamed Constructor
A constant constructor to enable subclass override.

