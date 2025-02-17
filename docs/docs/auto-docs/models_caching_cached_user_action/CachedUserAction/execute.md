
<div>

# execute method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]




Executes the cached user action based on its operation type.

**params**: None

**returns**:

-   `Future<QueryResult<Object?>>`: result.



## Implementation

``` language-dart
Future<QueryResult<Object?>>  async {
  switch (operationType) {
    case CachedOperationType.gqlAuthQuery:
      return await databaseFunctions.gqlAuthQuery(
        operation,
        variables: this.variables,
      );
    case CachedOperationType.gqlAuthMutation:
      return await databaseFunctions.gqlAuthMutation(
        operation,
        variables: this.variables,
      );
    case CachedOperationType.gqlNonAuthQuery:
      return await databaseFunctions.gqlNonAuthQuery(
        operation,
        variables: this.variables,
      );
    case CachedOperationType.gqlNonAuthMutation:
      return await databaseFunctions.gqlNonAuthMutation(
        operation,
        variables: this.variables,
      );
    default:
      return databaseFunctions.noData;
  }
}
```







1.  [talawa](../../index.html)
2.  [cached_user_action](../../models_caching_cached_user_action/)
3.  [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4.  execute method

##### CachedUserAction class







