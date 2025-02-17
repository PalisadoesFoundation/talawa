
<div>

# gqlNonAuthQuery method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
gqlNonAuthQuery(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    query, {]
2.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]?]
    variables, ]

})



This function is used to run the graph-ql query for the non signed-in
user.

**params**:

-   `query`: query is used to fetch data in graphql, for more info read
    graphql docs
-   `variables`: variables to be passed with query

**returns**:

-   `Future<QueryResult<Object?>>`: it returns Future of QueryResult,
    contains all data



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [database_mutation_functions](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.md)
4.  gqlNonAuthQuery method

##### DataBaseMutationFunctions class







