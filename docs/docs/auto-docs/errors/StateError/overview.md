# Overview for `StateError`

## Description

The operation was not allowed by the current state of the object.

 Should be used when this particular object is currently in a state
 which doesn't support the requested operation, but other similar
 objects might, or the object itself can later change its state
 to one which supports the operation.

 Example: Asking for `list.first` on a currently empty list.
 If the operation is never supported by this object or class,
 consider using [UnsupportedError] instead.

 This is a generic error used for a variety of different erroneous
 actions. The message should be descriptive.

## Dependencies

- Error

## Members

- **message**: `String`
## Constructors

### Unnamed Constructor


