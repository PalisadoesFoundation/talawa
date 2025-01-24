




init method - DataBaseMutationFunctions class - database\_mutation\_functions library - Dart API







menu

1. [talawa](../../index.html)
2. [services/database\_mutation\_functions.dart](../../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. init method

init


dark\_mode

light\_mode




# init method


void
init()

Initialization function.

**params**:
None

**returns**:
None


## Implementation

```
void init() {
  clientNonAuth = graphqlConfig.clientToQuery();
  clientAuth = graphqlConfig.authClient();
  _query = Queries();
}
```

 


1. [talawa](../../index.html)
2. [database\_mutation\_functions](../../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. init method

##### DataBaseMutationFunctions class





talawa
1.0.0+1






