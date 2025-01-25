




initClientNonAuth method - DataBaseMutationFunctions class - database\_mutation\_functions library - Dart API







menu

1. [talawa](../../index.html)
2. [services/database\_mutation\_functions.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/)
3. [DataBaseMutationFunctions](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. initClientNonAuth method

initClientNonAuth


dark\_mode

light\_mode




# initClientNonAuth method


void
initClientNonAuth()

Initializes [clientNonAuth](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.html) function.

**params**:
None

**returns**:
None


## Implementation

```
void initClientNonAuth() {
  graphqlConfig.getOrgUrl();
  clientNonAuth = graphqlConfig.clientToQuery();
  _query = Queries();
}
```

 


1. [talawa](../../index.html)
2. [database\_mutation\_functions](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/)
3. [DataBaseMutationFunctions](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. initClientNonAuth method

##### DataBaseMutationFunctions class





talawa
1.0.0+1






