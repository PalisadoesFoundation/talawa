




gqlNonAuthQuery method - DataBaseMutationFunctions class - database\_mutation\_functions library - Dart API







menu

1. [talawa](../../index.html)
2. [services/database\_mutation\_functions.dart](../../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. gqlNonAuthQuery method

gqlNonAuthQuery


dark\_mode

light\_mode




# gqlNonAuthQuery method


Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>
gqlNonAuthQuery(

1. String query, {
2. Map<String, dynamic>? variables,

})

This function is used to run the graph-ql query for the non signed-in user.

**params**:

* `query`: query is used to fetch data in graphql, for more info read graphql docs
* `variables`: variables to be passed with query

**returns**:

* `Future<QueryResult<Object?>>`: it returns Future of QueryResult, contains all data

## Implementation

```
Future<QueryResult<Object?>> gqlNonAuthQuery(
  String query, {
  Map<String, dynamic>? variables,
}) async {
  final queryOptions = QueryOptions(
    document: gql(query),
    variables: variables ?? <String, dynamic>{},
  );
  final response = await cacheService.executeOrCacheOperation(
    operation: query,
    variables: variables,
    operationType: CachedOperationType.gqlAuthQuery,
    whenOnline: () async {
      final result = await clientNonAuth.query(queryOptions);
      // if there is an error or exception in [result]
      if (result.hasException) {
        GraphqlExceptionResolver.encounteredExceptionOrError(
          result.exception!,
        );
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
4. gqlNonAuthQuery method

##### DataBaseMutationFunctions class





talawa
1.0.0+1






