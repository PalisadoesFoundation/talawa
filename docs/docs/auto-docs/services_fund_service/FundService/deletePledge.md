



menu

1.  [talawa](../../index.md)
2.  [services/fund_service.dart](../../services_fund_service/)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  deletePledge method


deletePledge


 dark_mode   light_mode 




<div>

# deletePledge method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
deletePledge(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    pledgeId]

)



This function is used to delete a pledge.

**params**:

-   `pledgeId`: id of the pledge to be deleted.

**returns**:

-   `Future<QueryResult<Object?>>`: which contains the result of the
    GraphQL mutation.



## Implementation

``` language-dart
Future<QueryResult<Object?>> deletePledge(String pledgeId) async 
```







1.  [talawa](../../index.md)
2.  [fund_service](../../services_fund_service/)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  deletePledge method

##### FundService class









 talawa 1.0.0+1 
