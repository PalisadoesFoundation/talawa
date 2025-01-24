




gqlNonAuthMutation method - DataBaseMutationFunctions class - database\_mutation\_functions library - Dart API







menu

1. [talawa](../../index.html)
2. [services/database\_mutation\_functions.dart](../../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. gqlNonAuthMutation method

gqlNonAuthMutation


dark\_mode

light\_mode




# gqlNonAuthMutation method


Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>
gqlNonAuthMutation(

1. String mutation, {
2. Map<String, dynamic>? variables,
3. bool reCall = true,

})

This function is used to run the graph-ql mutation to authenticate the non signed-in user.

**params**:

* `mutation`: mutation is used to change/add/delete data in graphql, for more info read graphql docs
* `variables`: variables to be passed with mutation
* `reCall`: when not first fetch call

**returns**:

* `Future<QueryResult<Object?>>`: it returns Future of dynamic

## Implementation

```
Future<QueryResult<Object?>> gqlNonAuthMutation(
  String mutation, {
  Map<String, dynamic>? variables,
  bool reCall = true,
}) async {
  // coverage:ignore-start
  if (variables != null) {
    traverseAndConvertDates(variables, convertLocalToUTC, splitDateTimeUTC);
  }
  // coverage:ignore-end
  final MutationOptions options = MutationOptions(
    document: gql(mutation),
    variables: variables ?? <String, dynamic>{},
  );
  final response = await cacheService.executeOrCacheOperation(
    operation: mutation,
    variables: variables,
    operationType: CachedOperationType.gqlNonAuthMutation,
    whenOnline: () async {
      final QueryResult result = await clientNonAuth.mutate(options);
      // if there is an error or exception in [result]
      if (result.hasException) {
        GraphqlExceptionResolver.encounteredExceptionOrError(
          result.exception!,
        );
      } else if (result.data != null && result.isConcrete) {
        return result;
      }
      return noData;
    },
  );
  return response;
}
```

 


1. [talawa](../../index.html)
2. [database\_mutation\_functions](../../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. gqlNonAuthMutation method

##### DataBaseMutationFunctions class





talawa
1.0.0+1






