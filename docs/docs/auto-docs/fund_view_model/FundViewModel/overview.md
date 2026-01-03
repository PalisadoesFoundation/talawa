# Overview for `FundViewModel`

## Description

FundViewModel class helps to interact with model to serve data to view for fund management section.

 Methods include:
 * `initialise` : to initialize the view model and fetch initial data.
 * `fetchFunds` : to fetch all funds in the organization.
 * `fetchCampaigns` : to fetch campaigns for a specific fund.
 * `fetchPledges` : to fetch pledges for a specific campaign.
 * `createPledge` : to create a new pledge.
 * `updatePledge` : to update an existing pledge.
 * `deletePledge` : to delete a pledge.
 * `selectFund` : to select a fund and fetch its campaigns.
 * `selectCampaign` : to select a campaign and fetch its pledges.

## Dependencies

- BaseModel

## Members

- **_fundService**: `FundService`
- **_funds**: `List<Fund>`
- **_filteredFunds**: `List<Fund>`
- **_campaigns**: `List<Campaign>`
- **_filteredCampaigns**: `List<Campaign>`
- **_userPledges**: `List<Pledge>`
- **_fundsPageInfo**: `PageInfo?`
- **_campaignsPageInfo**: `PageInfo?`
- **_isFetchingFunds**: `bool`
- **_isFetchingCampaigns**: `bool`
- **_isFetchingPledges**: `bool`
- **_isLoadingMoreFunds**: `bool`
- **_isLoadingMoreCampaigns**: `bool`
- **_fundSortOption**: `String`
- **_campaignSortOption**: `String`
- **_fundSearchQuery**: `String`
- **_campaignSearchQuery**: `String`
- **parentFundId**: `String`
  used to identify the current fund id.

- **parentcampaignId**: `String`
  used to identify the current campaign id.

- **orgMembersList**: `List<User>`
  List of organization members.

- **_currentOrganizationStreamSubscription**: `StreamSubscription?`
  Stream for current organisation.

