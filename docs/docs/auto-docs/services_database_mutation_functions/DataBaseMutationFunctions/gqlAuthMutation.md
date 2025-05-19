
<div>

# gqlAuthMutation method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
gqlAuthMutation(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    mutation, )



This function is used to run the graph-ql mutation for authenticated
user.

**params**:

-   `mutation`: mutation is used to change/add/delete data in graphql,
    for more info read graphql docs
-   `variables`: variables to be passed with mutation

**returns**:

-   `Future<QueryResult<Object?>>`: it returns Future of dynamic



## Implementation

``` language-dart
Future<QueryResult<Object?>> gqlAuthMutation(
  String mutation, ) async 
```







1.  [talawa](../../index.md)
2.  [database_mutation_functions](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.md)
4.  gqlAuthMutation method

##### DataBaseMutationFunctions class







