




gqlAuthQuery method - DataBaseMutationFunctions class - database\_mutation\_functions library - Dart API







menu

1. [talawa](../../index.html)
2. [services/database\_mutation\_functions.dart](../../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. gqlAuthQuery method

gqlAuthQuery


dark\_mode

light\_mode




# gqlAuthQuery method


Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>
gqlAuthQuery(

1. String query, {
2. Map<String, dynamic>? variables,

})

This function is used to run the graph-ql query for authentication.

**params**:

* `query`: query is used to fetch data in graphql, for more info read graphql docs
* `variables`: variables to be passed with query

**returns**:

* `Future<QueryResult<Object?>>`: it returns Future of dynamic

## Implementation

```
Future<QueryResult<Object?>> gqlAuthQuery(
  String query, {
  Map<String, dynamic>? variables,
}) async {
  final QueryOptions options = QueryOptions(
    document: gql(query),
    variables: variables ?? <String, dynamic>{},
    fetchPolicy: FetchPolicy.networkOnly,
  );
  final response = await cacheService.executeOrCacheOperation(
    operation: query,
    variables: variables,
    operationType: CachedOperationType.gqlAuthQuery,
    whenOnline: () async {
      final QueryResult result = await clientAuth.query(options);
      // if there is an error or exception in [result]
      if (result.hasException) {
        final exception =
            GraphqlExceptionResolver.encounteredExceptionOrError(
          result.exception!,
        );
        if (exception!) {
          return await gqlAuthQuery(query, variables: variables);
        }
      } else if (result.data != null && result.isConcrete) {
        // coverage:ignore-start
        traverseAndConvertDates(
          result.data ?? <String, dynamic>{},
          convertUTCToLocal,
          splitDateTimeLocal,
        );
        // coverage:ignore-end
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
4. gqlAuthQuery method

##### DataBaseMutationFunctions class





talawa
1.0.0+1






