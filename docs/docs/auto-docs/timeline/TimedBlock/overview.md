# Overview for `TimedBlock`

## Description

Provides [start], [end], and [duration] of a named block of code, timed by
 [FlutterTimeline].

## Members

- **name**: `String`
  A readable label for a block of code that was measured.

 This field should be sufficiently unique and descriptive for someone to
 easily tell which part of code was measured.

- **start**: `double`
  The timestamp in microseconds that marks the beginning of the measured
 block of code.

- **end**: `double`
  The timestamp in microseconds that marks the end of the measured block of
 code.

## Constructors

### Unnamed Constructor
Creates a timed block of code from a [name], [start], and [end].

 The [name] should be sufficiently unique and descriptive for someone to
 easily tell which part of code was measured.

