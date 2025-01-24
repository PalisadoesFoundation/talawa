




refreshAccessToken method - DataBaseMutationFunctions class - database\_mutation\_functions library - Dart API







menu

1. [talawa](../../index.html)
2. [services/database\_mutation\_functions.dart](../../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. refreshAccessToken method

refreshAccessToken


dark\_mode

light\_mode




# refreshAccessToken method


Future<bool>
refreshAccessToken(

1. String refreshToken

)

This function is used to refresh the Authenication token to access the application.

**params**:

* `refreshToken`: Needed for authentication

**returns**:

* `Future<bool>`: it returns Future of dynamic

## Implementation

```
Future<bool> refreshAccessToken(String refreshToken) async {
  // run the graphQL mutation
  final QueryResult result = await clientNonAuth.mutate(
    MutationOptions(
      document: gql(
        _query.refreshToken(refreshToken),
      ),
    ),
  );
  // if there is an error or exception in [result]
  if (result.hasException) {
    final exception = GraphqlExceptionResolver.encounteredExceptionOrError(
      result.exception!,
    );
    if (exception!) {
      refreshAccessToken(refreshToken);
    } else {
      navigationService.pop();
    }
  } else if (result.data != null && result.isConcrete) {
    userConfig.updateAccessToken(
      refreshToken: (result.data!['refreshToken']
              as Map<String, dynamic>)['refreshToken']
          .toString(),
      accessToken: (result.data!['refreshToken']
              as Map<String, dynamic>)['accessToken']
          .toString(),
    );
    databaseFunctions.init();
    return true;
  }
  return false;
}
```

 


1. [talawa](../../index.html)
2. [database\_mutation\_functions](../../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. refreshAccessToken method

##### DataBaseMutationFunctions class





talawa
1.0.0+1






