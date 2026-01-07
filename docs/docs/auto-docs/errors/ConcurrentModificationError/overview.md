# Overview for `ConcurrentModificationError`

## Description

Error occurring when a collection is modified during iteration.

 Some modifications may be allowed for some collections, so each collection
 ([Iterable] or similar collection of values) should declare which operations
 are allowed during an iteration.

## Dependencies

- Error

## Members

- **modifiedObject**: `Object?`
  The object that was modified in an incompatible way.

## Constructors

### Unnamed Constructor


