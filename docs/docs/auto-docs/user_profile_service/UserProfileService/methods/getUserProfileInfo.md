# Method: `getUserProfileInfo`

## Description

Retrieves user profile information using a GraphQL query.

 **params**:
 * `user`: An instance of `User` representing the user whose profile information is to be fetched.
   The user's ID is used as a variable for the GraphQL query.

 **returns**:
 * `Future<QueryResult<Object?>>`: which contains the result of the GraphQL query.

## Return Type
`Future<QueryResult<Object?>>`

## Parameters

- `user`: `User`
