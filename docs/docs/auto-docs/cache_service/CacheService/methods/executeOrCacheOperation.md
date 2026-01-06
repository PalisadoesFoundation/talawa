# Method: `executeOrCacheOperation`

## Description

Executes a GraphQL operation or caches it for offline execution.

 This function checks internet connectivity. If online, it executes the
 provided `whenOnline` function and returns the result. If offline, it creates
 a `CachedUserAction` object representing the operation and stores it
 in the `offlineActionQueue`. It then returns null.

 **params**:
 * `operation`: The GraphQL operation string.
 * `variables`: Optional variables for the operation (`Map&lt;String, dynamic&gt;`).
 * `operationType`: The type of the GraphQL operation (from `CachedOperationType` enum).
 * `whenOnline`: A function that executes the operation online and returns the result (`Future<QueryResult<Object?>?>`).

 **returns**:
 * `Future<QueryResult<Object?>>`: Returns the result of the operation.

## Return Type
`Future<QueryResult<Object?>>`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
