# Method: `getFunds`

## Description

This function is used to fetch all funds of the organization.

 **params**:
 * `first`: Number of funds to fetch from the beginning (pagination).
 * `last`: Number of funds to fetch from the end (pagination).
 * `after`: Cursor for pagination (fetch records after this cursor).
 * `before`: Cursor for pagination (fetch records before this cursor).

 **returns**:
 * `Future<Pair<List<Fund>, PageInfo>>`: A pair containing the list of funds and pagination info.

## Return Type
`Future<Pair<List<Fund>, PageInfo>>`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
