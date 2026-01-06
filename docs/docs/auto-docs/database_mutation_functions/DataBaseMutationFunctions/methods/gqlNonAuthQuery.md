# Method: `gqlNonAuthQuery`

## Description

This function is used to run the graph-ql query for the non signed-in user.

 **params**:
 * `query`: query is used to fetch data in graphql, for more info read graphql docs
 * `variables`: variables to be passed with query

 **returns**:
 * `Future<QueryResult<Object?>>`: it returns Future of QueryResult, contains all data

## Return Type
`Future<QueryResult<Object?>>`

## Parameters

- `query`: `String`
- ``: `dynamic`
