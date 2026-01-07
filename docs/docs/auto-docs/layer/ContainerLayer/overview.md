# Overview for `ContainerLayer`

## Description

A composited layer that has a list of children.

 A [ContainerLayer] instance merely takes a list of children and inserts them
 into the composited rendering in order. There are subclasses of
 [ContainerLayer] which apply more elaborate effects in the process.

## Dependencies

- Layer

## Members

- **_firstChild**: `Layer?`
- **_lastChild**: `Layer?`
