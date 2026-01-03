# Overview for `CachedUserAction`

## Description

CachedUserAction class represents a user action that is cached for offline use.

 This class provides the following functionalities:
 * `toJson` : converts a CachedUserAction to a JSON-compatible map.
 * `fromJson` : creates a CachedUserAction from a JSON-compatible map.
 * `execute` : executes the cached user action based on its operation type.

## Dependencies

- HiveObject

## Members

- **id**: `String`
  The unique identifier for the cached user action.

- **operation**: `String`
  The operation to be performed for the cached user action.

- **variables**: `Map<String, dynamic>?`
  The variables required for the operation, if any.

- **timeStamp**: `DateTime`
  The timestamp when the action was cached.

- **status**: `CachedUserActionStatus`
  The status of the cached user action.

- **metaData**: `Map<String, dynamic>?`
  Any additional metadata related to the cached user action.

- **operationType**: `CachedOperationType`
  The type of operation for the cached user action.

- **expiry**: `DateTime`
  The expiry date and time for the cached user action.

## Constructors

### Unnamed Constructor


### fromJson
Creates a CachedUserAction from a JSON-compatible map.

 **params**:
 * `json` : a map representing the CachedUserAction.

 **returns**:
 * `CachedUserAction` : a new instance of CachedUserAction.

#### Parameters

- `json`: `Map<String, dynamic>`
