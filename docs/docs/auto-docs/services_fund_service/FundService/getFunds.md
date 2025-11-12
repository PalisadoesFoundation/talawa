



menu

1.  [talawa](../../index.md)
2.  [services/fund_service.dart](../../services_fund_service/)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getFunds method


getFunds


 dark_mode   light_mode 




<div>

# getFunds method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Pair](../../utils_pair/Pair-class.md)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Fund](../../models_funds_fund/Fund-class.md)]\>]],
[[PageInfo](../../models_page_info_page_info/PageInfo-class.md)]\>]]\>]]




This function is used to fetch all funds of the organization.

**params**:

-   `first`: Number of funds to fetch from the beginning (pagination).
-   `last`: Number of funds to fetch from the end (pagination).
-   `after`: Cursor for pagination (fetch records after this cursor).
-   `before`: Cursor for pagination (fetch records before this cursor).

**returns**:

-   `Future<Pair<List<Fund>, PageInfo>>`: A pair containing the list of
    funds and pagination info.



## Implementation

``` language-dart
Future<Pair<List<Fund>, PageInfo>>  async 
```







1.  [talawa](../../index.md)
2.  [fund_service](../../services_fund_service/)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getFunds method

##### FundService class









 talawa 1.0.0+1 
