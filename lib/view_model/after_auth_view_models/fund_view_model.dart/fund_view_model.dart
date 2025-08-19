import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/page_info/page_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/fund_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// FundViewModel class helps to interact with model to serve data to view for fund management section.
///
/// Methods include:
/// * `initialise` : to initialize the view model and fetch initial data.
/// * `fetchFunds` : to fetch all funds in the organization.
/// * `fetchCampaigns` : to fetch campaigns for a specific fund.
/// * `fetchPledges` : to fetch pledges for a specific campaign.
/// * `createPledge` : to create a new pledge.
/// * `updatePledge` : to update an existing pledge.
/// * `deletePledge` : to delete a pledge.
/// * `selectFund` : to select a fund and fetch its campaigns.
/// * `selectCampaign` : to select a campaign and fetch its pledges.
class FundViewModel extends BaseModel {
  // Importing services.
  final FundService _fundService = locator<FundService>();

  // Local caching variables for a session.
  List<Fund> _funds = [];
  List<Fund> _filteredFunds = [];
  List<Campaign> _campaigns = [];
  List<Campaign> _filteredCampaigns = [];
  List<Pledge> _userPledges = [];

  PageInfo? _fundsPageInfo = PageInfo(
    hasNextPage: false,
    hasPreviousPage: false,
    startCursor: null,
    endCursor: null,
  );
  PageInfo? _campaignsPageInfo = PageInfo(
    hasNextPage: false,
    hasPreviousPage: false,
    startCursor: null,
    endCursor: null,
  );

  bool _isFetchingFunds = false;
  bool _isFetchingCampaigns = false;
  bool _isFetchingPledges = false;
  bool _isLoadingMoreFunds = false;
  bool _isLoadingMoreCampaigns = false;

  String _fundSortOption = 'createdAt_DESC';
  String _campaignSortOption = 'endDate_DESC';

  String _fundSearchQuery = '';
  String _campaignSearchQuery = '';

  /// used to identify the current fund id.
  late String parentFundId;

  /// used to identify the current campaign id.
  late String parentcampaignId;

  // Getters
  /// getter for the funds.
  List<Fund> get funds => _funds;

  /// List of organization members.
  late List<User> orgMembersList = [];

  /// getter for the filtered funds.
  List<Fund> get filteredFunds => _filteredFunds;

  /// getter for the funds page info.
  PageInfo? get fundsPageInfo => _fundsPageInfo;

  /// getter for the campaigns.
  List<Campaign> get campaigns => _campaigns;

  /// getter for the filtered campaigns.
  List<Campaign> get filteredCampaigns => _filteredCampaigns;

  /// getter for isFetchingFunds to show loading indicator.
  bool get isFetchingFunds => _isFetchingFunds;

  /// getter for isFetchingCampaigns to show loading indicator.
  bool get isFetchingCampaigns => _isFetchingCampaigns;

  /// getter for isFetchingPledges to show loading indicator.
  bool get isFetchingPledges => _isFetchingPledges;

  /// getter for isLoadingMoreFunds to show loading indicator for pagination.
  bool get isLoadingMoreFunds => _isLoadingMoreFunds;

  /// getter for isLoadingMoreCampaigns to show loading indicator for pagination.
  bool get isLoadingMoreCampaigns => _isLoadingMoreCampaigns;

  /// getter to check if there are more funds to load.
  bool get hasMoreFunds => _fundsPageInfo?.hasNextPage ?? false;

  /// getter to check if there are more campaigns to load.
  bool get hasMoreCampaigns => _campaignsPageInfo?.hasNextPage ?? false;

  /// getter for the campaigns page info.
  PageInfo? get campaignsPageInfo => _campaignsPageInfo;

  /// getter for funds sorting option.
  String get fundSortOption => _fundSortOption;

  /// getter for campaigns sorting option.
  String get campaignSortOption => _campaignSortOption;

  /// getter for user pledges.
  List<Pledge> get userPledges => _userPledges;

  /// Stream for current organisation.
  StreamSubscription? _currentOrganizationStreamSubscription;

  /// To initialize the view model.
  ///
  /// This method sets up the initial state and triggers the fetch of funds.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialise() {
    _isFetchingFunds = true;
    _isFetchingCampaigns = true;
    _isFetchingPledges = true;
    _currentOrganizationStreamSubscription = userConfig.currentOrgInfoStream
        .listen((updatedOrganization) => refreshFunds());
    notifyListeners();
    getCurrentOrgUsersList();
    fetchFunds();
  }

  /// This method refreshes funds when organisation changes.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void refreshFunds() {
    debugPrint('Refreshing funds...${userConfig.currentOrg.name}');
    _isFetchingFunds = true;
    _isFetchingCampaigns = true;
    _isFetchingPledges = true;
    _funds.clear();
    _filteredFunds.clear();
    _campaigns.clear();
    _filteredCampaigns.clear();
    _userPledges.clear();
    _fundsPageInfo = PageInfo(
      hasNextPage: false,
      hasPreviousPage: false,
      startCursor: null,
      endCursor: null,
    );
    _campaignsPageInfo = PageInfo(
      hasNextPage: false,
      hasPreviousPage: false,
      startCursor: null,
      endCursor: null,
    );

    print('Refreshing funds... sdf');

    getCurrentOrgUsersList();
    fetchFunds();
    print("Fetched funds");
    notifyListeners();
  }

  /// This function fetches all funds in the organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> fetchFunds() async {
    _isFetchingFunds = true;
    notifyListeners();
    try {
      final result = await _fundService.getFunds();
      _funds = result.first;
      _fundsPageInfo = result.second;
      _applyFundFilters();
      _isFetchingFunds = false;
      notifyListeners();
    } catch (e) {
      _isFetchingFunds = false;
      notifyListeners();
    }
  }

  /// This function loads more funds for pagination.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> loadMoreFunds() async {
    if (_isLoadingMoreFunds || !hasMoreFunds) return;

    _isLoadingMoreFunds = true;
    notifyListeners();

    try {
      final result = await _fundService.getFunds(
        after: _fundsPageInfo?.endCursor,
      );

      _funds.addAll(result.first);
      _fundsPageInfo = result.second;
      _applyFundFilters();
      _isLoadingMoreFunds = false;
      notifyListeners();
    } catch (e) {
      print('Error loading more funds: $e');
      _isLoadingMoreFunds = false;
      notifyListeners();
    }
  }

  /// This function fetches campaigns for a specific fund.
  ///
  /// **params**:
  /// * `fundId`: id of the fund
  ///
  /// **returns**:
  ///   None
  Future<void> fetchCampaigns(String fundId) async {
    _isFetchingCampaigns = true;
    parentFundId = fundId;
    notifyListeners();

    try {
      final result = await _fundService.getCampaigns(fundId);
      _campaigns = result.first;
      _campaignsPageInfo = result.second;
      _applyCampaignFilters();
      _isFetchingCampaigns = false;
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching campaigns: $e');
      _isFetchingCampaigns = false;
      notifyListeners();
    }
  }

  /// This function loads more campaigns for pagination.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> loadMoreCampaigns() async {
    if (_isLoadingMoreCampaigns || !hasMoreCampaigns) return;

    _isLoadingMoreCampaigns = true;
    notifyListeners();

    try {
      final result = await _fundService.getCampaigns(
        parentFundId,
        after: _campaignsPageInfo?.endCursor,
      );

      _campaigns.addAll(result.first);
      _campaignsPageInfo = result.second;
      _applyCampaignFilters();
      _isLoadingMoreCampaigns = false;
      notifyListeners();
    } catch (e) {
      _isLoadingMoreCampaigns = false;
      notifyListeners();
    }
  }

  /// methoud to sort funds.
  ///
  /// **params**:
  /// * `option`: sorting option to sort.
  ///
  /// **returns**:
  ///   None
  void sortFunds(String option) {
    if (option != _fundSortOption) {
      _fundSortOption = option;
      fetchFunds();
    }
  }

  /// methoud to sort Campaigns.
  ///
  /// **params**:
  /// * `option`: sorting option to sort.
  ///
  /// **returns**:
  ///   None
  void sortCampaigns(String option) {
    if (option != _campaignSortOption) {
      _campaignSortOption = option;
      if (_campaigns.isNotEmpty) {
        fetchCampaigns(parentFundId);
      }
    }
  }

  /// methoud to search Funds.
  ///
  /// **params**:
  /// * `query`: query to search for Funds.
  ///
  /// **returns**:
  ///   None
  void searchFunds(String query) {
    _fundSearchQuery = query.toLowerCase();
    _applyFundFilters();
    notifyListeners();
  }

  /// methoud to search Campaigns.
  ///
  /// **params**:
  /// * `query`: query to search for Funds.
  ///
  /// **returns**:
  ///   None
  void searchCampaigns(String query) {
    _campaignSearchQuery = query.toLowerCase();
    _applyCampaignFilters();
    notifyListeners();
  }

  /// methoud to apply the filtering logic for funds.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _applyFundFilters() {
    _filteredFunds = _funds.where((fund) {
      return fund.name?.toLowerCase().contains(_fundSearchQuery) ?? false;
    }).toList();
  }

  /// methoud to apply the filtering logic for Campaigns.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _applyCampaignFilters() {
    _filteredCampaigns = _campaigns.where((campaign) {
      return campaign.name?.toLowerCase().contains(_campaignSearchQuery) ??
          false;
    }).toList();
  }

  /// This function fetches pledges for a specific campaign.
  ///
  /// **params**:
  /// * `campaignId`: id of the campaign
  ///
  /// **returns**:
  ///   None
  Future<void> fetchPledges(String campaignId) async {
    _isFetchingPledges = true;
    parentcampaignId = campaignId;
    notifyListeners();
    try {
      final result = await _fundService.getPledgesByCampaign(
        campaignId,
      );
      _userPledges = result;

      _isFetchingPledges = false;
    } catch (e) {
      _isFetchingPledges = false;
    } finally {
      notifyListeners();
    }
  }

  /// Method to get list of all members in the org.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> getCurrentOrgUsersList() async {
    orgMembersList =
        await organizationService.getOrgMembersList(userConfig.currentOrg.id!);
  }

  /// This function creates a new pledge.
  ///
  /// **params**:
  /// * `pledgeData`: Map containing the data for the new pledge
  ///
  /// **returns**:
  ///   None
  Future<void> createPledge(Map<String, dynamic> pledgeData) async {
    try {
      await _fundService.createPledge(pledgeData);
      await fetchPledges(parentcampaignId);
    } catch (e) {
      debugPrint('Error creating pledge: $e');
    }
  }

  /// This function updates an existing pledge.
  ///
  /// **params**:
  /// * `updatedPledgeData`: Map containing the updated data for the pledge
  ///
  /// **returns**:
  ///   None
  Future<void> updatePledge(
    Map<String, dynamic> updatedPledgeData,
  ) async {
    try {
      print('Updating pledge with data: $updatedPledgeData');
      await _fundService.updatePledge(updatedPledgeData);
      print('Pledge updated successfully');
      await fetchPledges(parentcampaignId);
      print('Fetched pledges after update');
    } catch (e) {
      debugPrint('Error updating pledge: $e');
    }
  }

  /// This function deletes a pledge.
  ///
  /// **params**:
  /// * `pledgeId`: id of the pledge to be deleted
  /// * `campaignId`: id of the campaign the pledge belongs to
  ///
  /// **returns**:
  ///   None
  Future<void> deletePledge(String pledgeId, String campaignId) async {
    try {
      await _fundService.deletePledge(pledgeId);
      await fetchPledges(campaignId);
    } catch (e) {
      debugPrint('Error deleting pledge: $e');
    }
  }

  /// This function selects a fund and fetches its campaigns.
  ///
  /// **params**:
  /// * `fundId`: id of the selected fund
  ///
  /// **returns**:
  ///   None
  void selectFund(String fundId) {
    fetchCampaigns(fundId);
  }

  /// This function selects a campaign and fetches its pledges.
  ///
  /// **params**:
  /// * `campaignId`: id of the selected campaign
  ///
  /// **returns**:
  ///   None
  void selectCampaign(String campaignId) {
    fetchPledges(campaignId);
  }

  @override
  void dispose() {
    _currentOrganizationStreamSubscription?.cancel();
    super.dispose();
  }
}
