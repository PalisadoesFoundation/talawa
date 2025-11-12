



menu

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/fund_view_model/fund_view_model.dart](../view_model_after_auth_view_models_fund_view_model_fund_view_model/)
3.  FundViewModel class


FundViewModel


 dark_mode   light_mode 




<div>

# FundViewModel class

</div>


FundViewModel class helps to interact with model to serve data to view
for fund management section.

Methods include:

-   `initialise` : to initialize the view model and fetch initial data.
-   `fetchFunds` : to fetch all funds in the organization.
-   `fetchCampaigns` : to fetch campaigns for a specific fund.
-   `fetchPledges` : to fetch pledges for a specific campaign.
-   `createPledge` : to create a new pledge.
-   `updatePledge` : to update an existing pledge.
-   `deletePledge` : to delete a pledge.
-   `selectFund` : to select a fund and fetch its campaigns.
-   `selectCampaign` : to select a campaign and fetch its pledges.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   FundViewModel



## Constructors

[FundViewModel](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/FundViewModel.md)

:   



## Properties

[[campaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/campaigns.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Campaign](../models_funds_fund_campaign/Campaign-class.md)]\>]]
:   getter for the campaigns.
    ::: features
    no setter
    :::

[[campaignSortOption](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/campaignSortOption.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   getter for campaigns sorting option.
    ::: features
    no setter
    :::

[[campaignsPageInfo](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/campaignsPageInfo.md)] [→ [PageInfo](../models_page_info_page_info/PageInfo-class.md)?]
:   getter for the campaigns page info.
    ::: features
    no setter
    :::

[[filteredCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/filteredCampaigns.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Campaign](../models_funds_fund_campaign/Campaign-class.md)]\>]]
:   getter for the filtered campaigns.
    ::: features
    no setter
    :::

[[filteredFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/filteredFunds.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Fund](../models_funds_fund/Fund-class.md)]\>]]
:   getter for the filtered funds.
    ::: features
    no setter
    :::

[[funds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/funds.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Fund](../models_funds_fund/Fund-class.md)]\>]]
:   getter for the funds.
    ::: features
    no setter
    :::

[[fundSortOption](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/fundSortOption.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   getter for funds sorting option.
    ::: features
    no setter
    :::

[[fundsPageInfo](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/fundsPageInfo.md)] [→ [PageInfo](../models_page_info_page_info/PageInfo-class.md)?]
:   getter for the funds page info.
    ::: features
    no setter
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether any listeners are currently registered.
    ::: features
    no setterinherited
    :::

[[hasMoreCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/hasMoreCampaigns.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   getter to check if there are more campaigns to load.
    ::: features
    no setter
    :::

[[hasMoreFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/hasMoreFunds.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   getter to check if there are more funds to load.
    ::: features
    no setter
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[isFetchingCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/isFetchingCampaigns.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   getter for isFetchingCampaigns to show loading indicator.
    ::: features
    no setter
    :::

[[isFetchingFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/isFetchingFunds.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   getter for isFetchingFunds to show loading indicator.
    ::: features
    no setter
    :::

[[isFetchingPledges](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/isFetchingPledges.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   getter for isFetchingPledges to show loading indicator.
    ::: features
    no setter
    :::

[[isLoadingMoreCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/isLoadingMoreCampaigns.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   getter for isLoadingMoreCampaigns to show loading indicator for
    pagination.
    ::: features
    no setter
    :::

[[isLoadingMoreFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/isLoadingMoreFunds.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   getter for isLoadingMoreFunds to show loading indicator for
    pagination.
    ::: features
    no setter
    :::

[[orgMembersList](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/orgMembersList.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.md)]\>]]
:   List of organization members.
    ::: features
    getter/setter pair
    :::

[[parentcampaignId](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/parentcampaignId.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   used to identify the current campaign id.
    ::: features
    getter/setter pair
    :::

[[parentFundId](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/parentFundId.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   used to identify the current fund id.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[userPledges](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/userPledges.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Pledge](../models_funds_fund_pledges/Pledge-class.md)]\>]]
:   getter for user pledges.
    ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[createPledge](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/createPledge.md)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] pledgeData]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function creates a new pledge.

[[deletePledge](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/deletePledge.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] pledgeId, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] campaignId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function deletes a pledge.

[dispose](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/dispose.md) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    override
    :::

[[fetchCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/fetchCampaigns.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] fundId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function fetches campaigns for a specific fund.

[[fetchFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/fetchFunds.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function fetches all funds in the organization.

[[fetchPledges](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/fetchPledges.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] campaignId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function fetches pledges for a specific campaign.

[[getCurrentOrgUsersList](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/getCurrentOrgUsersList.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to get list of all members in the org.

[initialise](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/initialise.md) [→ void ]
:   To initialize the view model.

[[loadMoreCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/loadMoreCampaigns.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function loads more campaigns for pagination.

[[loadMoreFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/loadMoreFunds.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function loads more funds for pagination.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[refreshFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/refreshFunds.md) [→ void ]
:   This method refreshes funds when organisation changes.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[searchCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/searchCampaigns.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] query]) → void ]
:   methoud to search Campaigns.

[[searchFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/searchFunds.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] query]) → void ]
:   methoud to search Funds.

[[selectCampaign](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/selectCampaign.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] campaignId]) → void ]
:   This function selects a campaign and fetches its pledges.

[[selectFund](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/selectFund.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] fundId]) → void ]
:   This function selects a fund and fetches its campaigns.

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[sortCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/sortCampaigns.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] option]) → void ]
:   methoud to sort Campaigns.

[[sortFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/sortFunds.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] option]) → void ]
:   methoud to sort funds.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updatePledge](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/updatePledge.md)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] updatedPledgeData]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function updates an existing pledge.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [fund_view_model](../view_model_after_auth_view_models_fund_view_model_fund_view_model/)
3.  FundViewModel class

##### fund_view_model library









 talawa 1.0.0+1 
