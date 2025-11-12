



menu

1.  [talawa](../../index.md)
2.  [services/fund_service.dart](../../services_fund_service/)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getCampaigns method


getCampaigns


 dark_mode   light_mode 




<div>

# getCampaigns method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Pair](../../utils_pair/Pair-class.md)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Campaign](../../models_funds_fund_campaign/Campaign-class.md)]\>]],
[[PageInfo](../../models_page_info_page_info/PageInfo-class.md)]\>]]\>]]
getCampaigns(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    fundId, )



This function is used to fetch all campaigns of a fund.

**params**:

-   `fundId`: id of a fund.
-   `first`: Number of campaigns to fetch from the beginning
    (pagination).
-   `last`: Number of campaigns to fetch from the end (pagination).
-   `after`: Cursor for pagination (fetch records after this cursor).
-   `before`: Cursor for pagination (fetch records before this cursor).

**returns**:

-   `Future<Pair<List<Campaign>, PageInfo>>`: A pair containing the list
    of campaigns and pagination info.



## Implementation

``` language-dart
Future<Pair<List<Campaign>, PageInfo>> getCampaigns(
  String fundId, ) async 
```







1.  [talawa](../../index.md)
2.  [fund_service](../../services_fund_service/)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getCampaigns method

##### FundService class









 talawa 1.0.0+1 
