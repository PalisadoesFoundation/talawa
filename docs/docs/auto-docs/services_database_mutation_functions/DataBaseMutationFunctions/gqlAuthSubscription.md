



menu

1.  [talawa](../../index.md)
2.  [services/database_mutation_functions.dart](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.md)
4.  gqlAuthSubscription method


gqlAuthSubscription


 dark_mode   light_mode 




<div>

# gqlAuthSubscription method

</div>


[[Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
gqlAuthSubscription(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    subscription,
    )



This function is used to run the graph-ql subscription for authenticated
user.

**params**:

-   `subscription`: subscription query string for real-time data
-   `variables`: variables to be passed with subscription

**returns**:

-   `Stream<QueryResult<Object?>>`: Stream of subscription results



## Implementation

``` language-dart
Stream<QueryResult<Object?>> gqlAuthSubscription(
  String subscription, ) async* 
```







1.  [talawa](../../index.md)
2.  [database_mutation_functions](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.md)
4.  gqlAuthSubscription method

##### DataBaseMutationFunctions class









 talawa 1.0.0+1 
