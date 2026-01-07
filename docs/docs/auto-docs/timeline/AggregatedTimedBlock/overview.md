# Overview for `AggregatedTimedBlock`

## Description

Aggregates multiple [TimedBlock] objects that share a [name].

 It is common for the same block of code to be executed multiple times within
 a frame. It is useful to combine multiple executions and report the total
 amount of time attributed to that block of code.

## Members

- **name**: `String`
  A readable label for a block of code that was measured.

 This field should be sufficiently unique and descriptive for someone to
 easily tell which part of code was measured.

- **duration**: `double`
  The sum of [TimedBlock.duration] values of aggregated blocks.

- **count**: `int`
  The number of [TimedBlock] objects aggregated.

## Constructors

### Unnamed Constructor
Creates a timed block of code from a [name] and [duration].

 The [name] should be sufficiently unique and descriptive for someone to
 easily tell which part of code was measured.

