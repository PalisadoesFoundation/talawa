



menu

1.  [talawa](../../index.md)
2.  [services/fund_service.dart](../../services_fund_service/)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  updatePledge method


updatePledge


 dark_mode   light_mode 




<div>

# updatePledge method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
updatePledge(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    variables]

)



This function is used to update an existing pledge.

**params**:

-   `variables`: A map of key-value pairs representing the variables
    required for the GraphQL mutation.

**returns**:

-   `Future<QueryResult<Object?>>`: which contains the result of the
    GraphQL mutation.



## Implementation

``` language-dart
Future<QueryResult<Object?>> updatePledge(
  Map<String, dynamic> variables,
) async 
```







1.  [talawa](../../index.md)
2.  [fund_service](../../services_fund_service/)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  updatePledge method

##### FundService class









 talawa 1.0.0+1 
