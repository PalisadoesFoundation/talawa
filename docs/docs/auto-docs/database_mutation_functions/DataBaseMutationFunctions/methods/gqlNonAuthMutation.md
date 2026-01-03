# Method: `gqlNonAuthMutation`

## Description

This function is used to run the graph-ql mutation to authenticate the non signed-in user.


 **params**:
 * `mutation`: mutation is used to change/add/delete data in graphql, for more info read graphql docs
 * `variables`: variables to be passed with mutation
 * `reCall`: when not first fetch call

 **returns**:
 * `Future<QueryResult<Object?>>`: it returns Future of dynamic

## Return Type
`Future<QueryResult<Object?>>`

## Parameters

- `mutation`: `String`
- ``: `dynamic`
- ``: `dynamic`
