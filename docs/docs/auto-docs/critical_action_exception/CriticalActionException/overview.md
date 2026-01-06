# Overview for `CriticalActionException`

## Description

Exception thrown for critical actions that require special handling.

 Extends [OperationException] to integrate with GraphQL error handling.

## Dependencies

- OperationException

## Members

- **actionError**: `String`
  The error message associated with this critical action.

## Constructors

### Unnamed Constructor
Constructor for [CriticalActionException].

 Takes a [actionError] message that describes the specific error encountered.

