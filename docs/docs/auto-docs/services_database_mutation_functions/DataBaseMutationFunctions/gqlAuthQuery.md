
<div>

# gqlAuthQuery method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
gqlAuthQuery(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    query, )



This function is used to run the graph-ql query for authentication.

**params**:

-   `query`: query is used to fetch data in graphql, for more info read
    graphql docs
-   `variables`: variables to be passed with query

**returns**:

-   `Future<QueryResult<Object?>>`: it returns Future of dynamic



## Implementation

``` language-dart
Future<QueryResult<Object?>> gqlAuthQuery(
  String query, ) async 
```







1.  [talawa](../../index.md)
2.  [database_mutation_functions](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.md)
4.  gqlAuthQuery method

##### DataBaseMutationFunctions class







