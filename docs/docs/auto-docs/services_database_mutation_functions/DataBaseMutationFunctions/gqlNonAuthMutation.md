
<div>

# gqlNonAuthMutation method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
gqlNonAuthMutation(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    mutation, {]
2.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]?]
    variables, ]
3.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
    reCall = true,
    ]

})



This function is used to run the graph-ql mutation to authenticate the
non signed-in user.

**params**:

-   `mutation`: mutation is used to change/add/delete data in graphql,
    for more info read graphql docs
-   `variables`: variables to be passed with mutation
-   `reCall`: when not first fetch call

**returns**:

-   `Future<QueryResult<Object?>>`: it returns Future of dynamic



## Implementation

``` language-dart
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







1.  [talawa](../../index.html)
2.  [database_mutation_functions](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4.  gqlNonAuthMutation method

##### DataBaseMutationFunctions class







