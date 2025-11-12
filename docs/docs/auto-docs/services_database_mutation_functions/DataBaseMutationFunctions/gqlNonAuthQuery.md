



menu

1.  [talawa](../../index.md)
2.  [services/database_mutation_functions.dart](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.md)
4.  gqlNonAuthQuery method


gqlNonAuthQuery


 dark_mode   light_mode 




<div>

# gqlNonAuthQuery method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
gqlNonAuthQuery(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    query, )



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
  String query, ) async 
```







1.  [talawa](../../index.md)
2.  [database_mutation_functions](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.md)
4.  gqlNonAuthQuery method

##### DataBaseMutationFunctions class









 talawa 1.0.0+1 
