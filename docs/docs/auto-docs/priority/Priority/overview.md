# Overview for `Priority`

## Description

A task priority, as passed to [SchedulerBinding.scheduleTask].

## Members

- **_value**: `int`
- **idle**: `Priority`
  A task to run after all other tasks, when no animations are running.

- **animation**: `Priority`
  A task to run even when animations are running.

- **touch**: `Priority`
  A task to run even when the user is interacting with the device.

- **kMaxOffset**: `int`
  Maximum offset by which to clamp relative priorities.

 It is still possible to have priorities that are offset by more
 than this amount by repeatedly taking relative offsets, but that
 is generally discouraged.

## Constructors

### _


#### Parameters

- `_value`: `dynamic`
