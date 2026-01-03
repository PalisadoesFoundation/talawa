# Method: `getCampaigns`

## Description

This function is used to fetch all campaigns of a fund.

 **params**:
 * `fundId`: id of a fund.
 * `first`: Number of campaigns to fetch from the beginning (pagination).
 * `last`: Number of campaigns to fetch from the end (pagination).
 * `after`: Cursor for pagination (fetch records after this cursor).
 * `before`: Cursor for pagination (fetch records before this cursor).

 **returns**:
 * `Future<Pair<List<Campaign>, PageInfo>>`: A pair containing the list of campaigns and pagination info.

## Return Type
`Future<Pair<List<Campaign>, PageInfo>>`

## Parameters

- `fundId`: `String`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
