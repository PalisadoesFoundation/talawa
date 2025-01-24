




noData property - DataBaseMutationFunctions class - database\_mutation\_functions library - Dart API







menu

1. [talawa](../../index.html)
2. [services/database\_mutation\_functions.dart](../../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. noData property

noData


dark\_mode

light\_mode




# noData property


[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>
noData
getter/setter pair

when result has no data and null.


## Implementation

```
QueryResult noData = QueryResult(
  options: QueryOptions(
    document: gql(
      PostQueries().addLike(),
    ),
  ),
  data: null,
  source: QueryResultSource.network,
);
```

 


1. [talawa](../../index.html)
2. [database\_mutation\_functions](../../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4. noData property

##### DataBaseMutationFunctions class





talawa
1.0.0+1






