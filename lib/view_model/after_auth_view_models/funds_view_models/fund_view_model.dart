import 'dart:async';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
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
  List<Pledge> _allPledges = [];
  List<Pledge> _userPledges = [];
  List<Pledge> _filteredPledges = [];

  bool _isFetchingFunds = false;
  bool _isFetchingCampaigns = false;
  bool _isFetchingPledges = false;

  String _fundSortOption = 'createdAt_DESC';
  String _campaignSortOption = 'endDate_DESC';
  String _pledgeSortOption = 'endDate_DESC';

  String _fundSearchQuery = '';
  String _campaignSearchQuery = '';
  String _pledgerSearchQuery = '';

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

  /// getter for the campaigns.
  List<Campaign> get campaigns => _campaigns;

  /// getter for the filtered campaigns.
  List<Campaign> get filteredCampaigns => _filteredCampaigns;

  /// getter for the all pledges.
  List<Pledge> get allPledges => _allPledges;

  /// getter for the user pledges.
  List<Pledge> get userPledges => _userPledges;

  /// getter for the filtered Pledges.
  List<Pledge> get filteredPledges => _filteredPledges;

  /// getter for isFetchingFunds to show loading indicator.
  bool get isFetchingFunds => _isFetchingFunds;

  /// getter for isFetchingCampaigns to show loading indicator.
  bool get isFetchingCampaigns => _isFetchingCampaigns;

  /// getter for isFetchingPledges to show loading indicator.
  bool get isFetchingPledges => _isFetchingPledges;

  /// getter for funds sorting option.
  String get fundSortOption => _fundSortOption;

  /// getter for campaigns sorting option.
  String get campaignSortOption => _campaignSortOption;

  /// getter for pldeges sorting option.
  String get pledgeSortOption => _pledgeSortOption;

  /// donationCurrency.
  String donationCurrency = "USD";

  /// Currency Symbol.
  String donationCurrencySymbol = "\$";

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
    notifyListeners();
    getCurrentOrgUsersList();
    fetchFunds();
    // Note: We'll fetch campaigns and pledges after selecting a specific fund and campaign
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
      _funds = await _fundService.getFunds(orderBy: _fundSortOption);
      _applyFundFilters();
      _isFetchingFunds = false;
      notifyListeners();
    } catch (e) {
      print('Error fetching funds: $e');
      _isFetchingFunds = false;
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
      _campaigns =
          await _fundService.getCampaigns(fundId, orderBy: _campaignSortOption);
      _applyCampaignFilters();
      _isFetchingCampaigns = false;
      notifyListeners();
    } catch (e) {
      print('Error fetching campaigns: $e');
      _isFetchingCampaigns = false;
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

  /// methoud to sort Pledges.
  ///
  /// **params**:
  /// * `option`: sorting option to sort.
  ///
  /// **returns**:
  ///   None
  void sortPledges(String option) {
    if (option != _pledgeSortOption) {
      _pledgeSortOption = option;
      if (_userPledges.isNotEmpty) {
        fetchPledges(parentcampaignId);
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

  /// Method to search pledges by pledger.
  ///
  /// **params**:
  /// * `query`: query to search for pledger.
  ///
  /// **returns**:
  ///   None
  void searchPledgers(String query) {
    _pledgerSearchQuery = query.toLowerCase();
    _filteredPledges = _userPledges.where((pledge) {
      return pledge.pledgers!.any(
        (user) => user.firstName!.toLowerCase().contains(_pledgerSearchQuery),
      );
    }).toList();
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
      return fund.name!.toLowerCase().contains(_fundSearchQuery);
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
      return campaign.name!.toLowerCase().contains(_campaignSearchQuery);
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
      _allPledges = await _fundService.getPledgesByCampaign(
        campaignId,
        orderBy: _pledgeSortOption,
      );
      _userPledges = _allPledges
          .where(
            (pledge) => pledge.pledgers!
                .any((pledger) => pledger.id == userConfig.currentUser.id),
          )
          .toList();
      _filteredPledges = List.from(_userPledges);
      _isFetchingPledges = false;
      notifyListeners();
    } catch (e) {
      _isFetchingPledges = false;
      notifyListeners();
    }
  }

  /// This method changes the currency of the user for donation purpose.
  ///
  /// **params**:
  /// * `context`: BuildContext of the widget
  /// * `setter`: Setter Function
  ///
  /// **returns**:
  ///   None
  void changeCurrency(
    BuildContext context,
    void Function(void Function()) setter,
  ) {
    showCurrencyPicker(
      context: context,
      currencyFilter: supportedCurrencies,
      onSelect: (Currency currency) {
        setter(() {
          donationCurrency = currency.code;
          donationCurrencySymbol = currency.symbol;
        });
      },
    );
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
      print('Error creating pledge: $e');
    }
  }

  /// This function updates an existing pledge.
  ///
  /// **params**:
  /// * `updatedPledgeData`: Map containing the updated data for the pledge
  ///
  /// **returns**:
  ///   None
  Future<void> updatePledge(Map<String, dynamic> updatedPledgeData) async {
    try {
      await _fundService.updatePledge(updatedPledgeData);
      await fetchPledges(parentcampaignId);
    } catch (e) {
      print('Error updating pledge: $e');
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
      // Refresh pledges after deleting
      await fetchPledges(campaignId);
    } catch (e) {
      print('Error updating pledge: $e');
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
    // Clean up any resources if needed
    super.dispose();
  }
}
