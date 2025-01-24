




execute method - CachedUserAction class - cached\_user\_action library - Dart API







menu

1. [talawa](../../index.html)
2. [models/caching/cached\_user\_action.dart](../../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
3. [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4. execute method

execute


dark\_mode

light\_mode




# execute method


Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>
execute()

Executes the cached user action based on its operation type.

**params**:
None

**returns**:

* `Future<QueryResult<Object?>>`: result.

## Implementation

```
Future<QueryResult<Object?>> execute() async {
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

 


1. [talawa](../../index.html)
2. [cached\_user\_action](../../models_caching_cached_user_action/models_caching_cached_user_action-library.html)
3. [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4. execute method

##### CachedUserAction class





talawa
1.0.0+1






