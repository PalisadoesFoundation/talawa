<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/fund_view_model/fund_view_model.dart](../view_model_after_auth_view_models_fund_view_model_fund_view_model/view_model_after_auth_view_models_fund_view_model_fund_view_model-library.md)
3.  FundViewModel class

<div class="self-name">

FundViewModel

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_fund_view_model_fund_view_model/view_model_after_auth_view_models_fund_view_model_fund_view_model-library-sidebar.html"
below-sidebar="view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel-class-sidebar.html">

<div>

# <span class="kind-class">FundViewModel</span> class

</div>

<div class="section desc markdown">

FundViewModel class helps to interact with model to serve data to view
for fund management section.

Methods include:

- `initialise` : to initialize the view model and fetch initial data.
- `fetchFunds` : to fetch all funds in the organization.
- `fetchCampaigns` : to fetch campaigns for a specific fund.
- `fetchPledges` : to fetch pledges for a specific campaign.
- `createPledge` : to create a new pledge.
- `updatePledge` : to update an existing pledge.
- `deletePledge` : to delete a pledge.
- `selectFund` : to select a fund and fetch its campaigns.
- `selectCampaign` : to select a campaign and fetch its pledges.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- FundViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[FundViewModel](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/FundViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[campaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/campaigns.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Campaign](../models_funds_fund_campaign/Campaign-class.md)</span>\></span></span>  
getter for the campaigns.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[campaignSortOption](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/campaignSortOption.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
getter for campaigns sorting option.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[campaignsPageInfo](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/campaignsPageInfo.md)</span> <span class="signature">→ [PageInfo](../models_page_info_page_info/PageInfo-class.md)?</span>  
getter for the campaigns page info.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[filteredCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/filteredCampaigns.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Campaign](../models_funds_fund_campaign/Campaign-class.md)</span>\></span></span>  
getter for the filtered campaigns.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[filteredFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/filteredFunds.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Fund](../models_funds_fund/Fund-class.md)</span>\></span></span>  
getter for the filtered funds.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[funds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/funds.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Fund](../models_funds_fund/Fund-class.md)</span>\></span></span>  
getter for the funds.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[fundSortOption](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/fundSortOption.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
getter for funds sorting option.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[fundsPageInfo](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/fundsPageInfo.md)</span> <span class="signature">→ [PageInfo](../models_page_info_page_info/PageInfo-class.md)?</span>  
getter for the funds page info.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasListeners](../view_model_base_view_model/BaseModel/hasListeners.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether any listeners are currently registered.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasMoreCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/hasMoreCampaigns.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
getter to check if there are more campaigns to load.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[hasMoreFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/hasMoreFunds.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
getter to check if there are more funds to load.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isFetchingCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/isFetchingCampaigns.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
getter for isFetchingCampaigns to show loading indicator.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[isFetchingFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/isFetchingFunds.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
getter for isFetchingFunds to show loading indicator.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[isFetchingPledges](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/isFetchingPledges.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
getter for isFetchingPledges to show loading indicator.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[isLoadingMoreCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/isLoadingMoreCampaigns.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
getter for isLoadingMoreCampaigns to show loading indicator for
pagination.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[isLoadingMoreFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/isLoadingMoreFunds.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
getter for isLoadingMoreFunds to show loading indicator for pagination.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[orgMembersList](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/orgMembersList.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[User](../models_user_user_info/User-class.md)</span>\></span></span>  
List of organization members.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[parentcampaignId](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/parentcampaignId.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
used to identify the current campaign id.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[parentFundId](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/parentFundId.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
used to identify the current fund id.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[userPledges](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/userPledges.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Pledge](../models_funds_fund_pledges/Pledge-class.md)</span>\></span></span>  
getter for user pledges.

<div class="features">

<span class="feature">no setter</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](../view_model_base_view_model/BaseModel/addListener.md)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[createPledge](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/createPledge.md)</span><span class="signature">(<span id="createPledge-param-pledgeData" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">pledgeData</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function creates a new pledge.

<span class="name">[deletePledge](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/deletePledge.md)</span><span class="signature">(<span id="deletePledge-param-pledgeId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">pledgeId</span>, </span><span id="deletePledge-param-campaignId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">campaignId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function deletes a pledge.

<span class="name">[dispose](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](../view_model_base_view_model/BaseModel/addListener.md)
will throw after the object is disposed).

<span class="name">[fetchCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/fetchCampaigns.md)</span><span class="signature">(<span id="fetchCampaigns-param-fundId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">fundId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function fetches campaigns for a specific fund.

<span class="name">[fetchFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/fetchFunds.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function fetches all funds in the organization.

<span class="name">[fetchPledges](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/fetchPledges.md)</span><span class="signature">(<span id="fetchPledges-param-campaignId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">campaignId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function fetches pledges for a specific campaign.

<span class="name">[getCurrentOrgUsersList](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/getCurrentOrgUsersList.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Method to get list of all members in the org.

<span class="name">[initialise](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/initialise.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
To initialize the view model.

<span class="name">[loadMoreCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/loadMoreCampaigns.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function loads more campaigns for pagination.

<span class="name">[loadMoreFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/loadMoreFunds.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function loads more funds for pagination.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[notifyListeners](../view_model_base_view_model/BaseModel/notifyListeners.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Call all the registered listeners.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[refreshFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/refreshFunds.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This method refreshes funds when organisation changes.

<span class="name">[removeListener](../view_model_base_view_model/BaseModel/removeListener.md)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
are notified when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[searchCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/searchCampaigns.md)</span><span class="signature">(<span id="searchCampaigns-param-query" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">query</span></span>) <span class="returntype parameter">→ void</span> </span>  
methoud to search Campaigns.

<span class="name">[searchFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/searchFunds.md)</span><span class="signature">(<span id="searchFunds-param-query" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">query</span></span>) <span class="returntype parameter">→ void</span> </span>  
methoud to search Funds.

<span class="name">[selectCampaign](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/selectCampaign.md)</span><span class="signature">(<span id="selectCampaign-param-campaignId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">campaignId</span></span>) <span class="returntype parameter">→ void</span> </span>  
This function selects a campaign and fetches its pledges.

<span class="name">[selectFund](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/selectFund.md)</span><span class="signature">(<span id="selectFund-param-fundId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">fundId</span></span>) <span class="returntype parameter">→ void</span> </span>  
This function selects a fund and fetches its campaigns.

<span class="name">[setState](../view_model_base_view_model/BaseModel/setState.md)</span><span class="signature">(<span id="setState-param-viewState" class="parameter"><span class="type-annotation">[ViewState](../enums_enums/ViewState.md)</span> <span class="parameter-name">viewState</span></span>) <span class="returntype parameter">→ void</span> </span>  
<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[sortCampaigns](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/sortCampaigns.md)</span><span class="signature">(<span id="sortCampaigns-param-option" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">option</span></span>) <span class="returntype parameter">→ void</span> </span>  
methoud to sort Campaigns.

<span class="name">[sortFunds](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/sortFunds.md)</span><span class="signature">(<span id="sortFunds-param-option" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">option</span></span>) <span class="returntype parameter">→ void</span> </span>  
methoud to sort funds.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[updatePledge](../view_model_after_auth_view_models_fund_view_model_fund_view_model/FundViewModel/updatePledge.md)</span><span class="signature">(<span id="updatePledge-param-updatedPledgeData" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">updatedPledgeData</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function updates an existing pledge.

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [fund_view_model](../view_model_after_auth_view_models_fund_view_model_fund_view_model/view_model_after_auth_view_models_fund_view_model_fund_view_model-library.md)
3.  FundViewModel class

##### fund_view_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
