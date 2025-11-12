



menu

1.  [talawa](../index.md)
2.  [services/fund_service.dart](../services_fund_service/)
3.  FundService class


FundService


 dark_mode   light_mode 




<div>

# FundService class

</div>


FundService class provides different services in the context of Funds,
Campaigns, and Pledges.



## Constructors

[FundService](../services_fund_service/FundService/FundService.md)

:   



## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[createPledge](../services_fund_service/FundService/createPledge.md)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]
:   This function is used to create a new pledge.

[[deletePledge](../services_fund_service/FundService/deletePledge.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] pledgeId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]
:   This function is used to delete a pledge.

[[getCampaigns](../services_fund_service/FundService/getCampaigns.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] fundId, ) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Pair](../utils_pair/Pair-class.md)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Campaign](../models_funds_fund_campaign/Campaign-class.md)]\>]], [[PageInfo](../models_page_info_page_info/PageInfo-class.md)]\>]]\>]] ]
:   This function is used to fetch all campaigns of a fund.

[[getFunds](../services_fund_service/FundService/getFunds.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Pair](../utils_pair/Pair-class.md)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Fund](../models_funds_fund/Fund-class.md)]\>]], [[PageInfo](../models_page_info_page_info/PageInfo-class.md)]\>]]\>]] ]
:   This function is used to fetch all funds of the organization.

[[getPledgesByCampaign](../services_fund_service/FundService/getPledgesByCampaign.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] campaignId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Pledge](../models_funds_fund_pledges/Pledge-class.md)]\>]]\>]] ]
:   This function is used to fetch pledges by campaign ID.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updatePledge](../services_fund_service/FundService/updatePledge.md)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] variables]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]
:   This function is used to update an existing pledge.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [fund_service](../services_fund_service/)
3.  FundService class

##### fund_service library









 talawa 1.0.0+1 
