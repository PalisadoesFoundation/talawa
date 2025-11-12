



menu

1.  [talawa](../../index.md)
2.  [services/fund_service.dart](../../services_fund_service/)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getPledgesByCampaign method


getPledgesByCampaign


 dark_mode   light_mode 




<div>

# getPledgesByCampaign method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Pledge](../../models_funds_fund_pledges/Pledge-class.md)]\>]]\>]]
getPledgesByCampaign(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    campaignId]

)



This function is used to fetch pledges by campaign ID.

**params**:

-   `campaignId`: ID of the campaign to fetch pledges for.

**returns**:

-   `Future<List<Pledge>>`: List of pledges.



## Implementation

``` language-dart
Future<List<Pledge>> getPledgesByCampaign(String campaignId) async 
```







1.  [talawa](../../index.md)
2.  [fund_service](../../services_fund_service/)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getPledgesByCampaign method

##### FundService class









 talawa 1.0.0+1 
