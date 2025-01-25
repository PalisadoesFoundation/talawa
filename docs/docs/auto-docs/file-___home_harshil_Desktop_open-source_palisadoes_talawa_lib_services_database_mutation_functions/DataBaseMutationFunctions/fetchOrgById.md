




fetchOrgById method - DataBaseMutationFunctions class - database\_mutation\_functions library - Dart API







menu

1. [talawa](../../index.html)
2. [services/database\_mutation\_functions.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/)
3. [DataBaseMutationFunctions](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. fetchOrgById method

fetchOrgById


dark\_mode

light\_mode




# fetchOrgById method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
fetchOrgById(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) id

)

This function fetch the organization using the `id` passed.

**params**:

* `id`: id that identifies a particular org

**returns**:

* `Future<dynamic>`: it returns Future of dynamic

## Implementation

```
Future<dynamic> fetchOrgById(String id) async {
  print(id);
  print(id);
  final QueryResult result = await clientNonAuth
      .mutate(MutationOptions(document: gql(_query.fetchOrgById(id))));
  // if there is an error or exception in [result]
  if (result.hasException) {
    final exception = GraphqlExceptionResolver.encounteredExceptionOrError(
      result.exception!,
    );
    if (exception!) {
      fetchOrgById(id);
    }
  } else if (result.data != null && result.isConcrete) {
    print(result.data!['organizations']);
    return OrgInfo.fromJson(
      // ignore: collection_methods_unrelated_type
      (result.data!['organizations'] as List<Map<String, dynamic>>)[0],
    );
  }
  return false;
}
```

 


1. [talawa](../../index.html)
2. [database\_mutation\_functions](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/)
3. [DataBaseMutationFunctions](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. fetchOrgById method

##### DataBaseMutationFunctions class





talawa
1.0.0+1






