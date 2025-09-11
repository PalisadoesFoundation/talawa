import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model.dart/fund_view_model.dart';
import 'package:talawa/views/after_auth_screens/funds/fund_pledges_screen.dart';
import 'package:talawa/views/base_view.dart';

/// The CampaignsScreen widget displays a list of campaigns associated with a specific fund.
class CampaignsScreen extends StatefulWidget {
  const CampaignsScreen({
    super.key,
    required this.fundId,
    required this.fundName,
  });

  /// The unique identifier for the fund whose campaigns are to be displayed.
  final String fundId;

  /// The name of the fund associated with the campaigns.
  final String fundName;

  @override
  State<CampaignsScreen> createState() => _CampaignsScreenState();
}

class _CampaignsScreenState extends State<CampaignsScreen> {
  late ScrollController _scrollController;
  FundViewModel? _model;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  /// Handle scroll events to implement pagination.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _onScroll() {
    final pos = _scrollController.position;
    if (_model == null) return;

    // Trigger pagination when user is within 200px of bottom
    // This provides better UX by loading content before reaching the very end
    if (pos.extentAfter < 200 &&
        _model!.hasMoreCampaigns &&
        !_model!.isLoadingMoreCampaigns &&
        !_model!.isFetchingCampaigns) {
      _model!.loadMoreCampaigns();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<FundViewModel>(
      onModelReady: (model) {
        _model = model;
        model.fetchCampaigns(widget.fundId);
      },
      builder: (context, model, child) {
        _model = model; // Update model reference on rebuilds
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.strictTranslate('Campaigns'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
            ),
            backgroundColor: Colors.green,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        onChanged: (value) => model.searchCampaigns(value),
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .strictTranslate('Search Campaigns'),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.green),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.green, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.green),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor:
                                const Color.fromARGB(255, 49, 49, 49),
                            isExpanded: true,
                            value: model.campaignSortOption,
                            icon: const Icon(Icons.sort, color: Colors.green),
                            items: const [
                              DropdownMenuItem(
                                value: 'endDate_DESC',
                                child: Text(
                                  'End Date (Latest)',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'endDate_ASC',
                                child: Text(
                                  'End Date (Earliest)',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'amount_DESC',
                                child: Text(
                                  'Amount (Highest)',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'amount_ASC',
                                child: Text(
                                  'Amount (Lowest)',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                model.sortCampaigns(newValue);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: model.isFetchingCampaigns
                    ? const Center(child: CircularProgressIndicator())
                    : RefreshIndicator(
                        onRefresh: () async =>
                            await model.fetchCampaigns(widget.fundId),
                        child: model.filteredCampaigns.isEmpty
                            ? const Center(
                                child: Text('No campaigns for this fund.'),
                              )
                            : ListView.builder(
                                controller: _scrollController,
                                itemCount: model.filteredCampaigns.length +
                                    (model.hasMoreCampaigns ? 1 : 0),
                                itemBuilder: (context, index) {
                                  if (index < model.filteredCampaigns.length) {
                                    final campaign =
                                        model.filteredCampaigns[index];
                                    return CampaignCard(campaign: campaign);
                                  } else {
                                    // Show loading indicator at the bottom
                                    return Container(
                                      padding: const EdgeInsets.all(16),
                                      alignment: Alignment.center,
                                      child: model.isLoadingMoreCampaigns
                                          ? const CircularProgressIndicator()
                                          : const SizedBox.shrink(),
                                    );
                                  }
                                },
                              ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// The CampaignCard widget displays details of a specific campaign.
class CampaignCard extends StatelessWidget {
  const CampaignCard({super.key, required this.campaign});

  /// The campaign data to display within this card.
  final Campaign campaign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final goalAmount = campaign.goalAmount ?? 0;
    final progress =
        goalAmount > 0 ? (campaign.pledgedAmount ?? 0) / goalAmount : 0.0;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(theme),
          _buildBody(
            theme,
            campaign.pledgedAmount,
            goalAmount,
            progress,
            context,
          ),
          _buildFooter(context, theme),
        ],
      ),
    );
  }

  /// Builds the header section of the campaign card.
  ///
  /// **params**:
  /// * `theme`: The current [ThemeData] for styling purposes.
  ///
  /// **returns**:
  /// * `Widget`: The constructed header widget containing campaign title and icon.
  Widget _buildHeader(ThemeData theme) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.campaign, color: Colors.white, size: 30),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              campaign.name ?? 'Unnamed Campaign',
              style: theme.textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the main body section of the campaign card, displaying progress and campaign details.
  ///
  /// **params**:
  /// * `theme`: The current [ThemeData] for styling purposes.
  /// * `raisedAmount`: The amount raised for the campaign.
  /// * `goalAmount`: The funding goal for the campaign.
  /// * `progress`: The percentage of the funding goal reached.
  /// * `context`: The [BuildContext] in which this widget is built.
  ///
  /// **returns**:
  /// * `Widget`: The constructed body widget containing campaign progress and details.
  Widget _buildBody(
    ThemeData theme,
    double? raisedAmount,
    double goalAmount,
    double progress,
    BuildContext context,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 37, 37, 37),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressIndicator(
            theme,
            raisedAmount,
            goalAmount,
            progress,
            context,
          ),
          const SizedBox(height: 16),
          _buildInfoGrid(theme),
        ],
      ),
    );
  }

  /// Constructs a progress indicator to show the campaign's funding progress.
  ///
  /// **params**:
  /// * `theme`: The current [ThemeData] for styling purposes.
  /// * `raisedAmount`: The amount raised for the campaign.
  /// * `goalAmount`: The funding goal for the campaign.
  /// * `progress`: The percentage of the funding goal reached.
  /// * `context`: The [BuildContext] in which this widget is built.
  ///
  /// **returns**:
  /// * `Widget`: The progress indicator widget showing the campaign's funding status.
  Widget _buildProgressIndicator(
    ThemeData theme,
    double? raisedAmount,
    double goalAmount,
    double progress,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 20,
              width: progress * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  '${(progress * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${campaign.currency ?? ''} ${(campaign.pledgedAmount ?? 0).toStringAsFixed(2)} raised',
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Goal: ${campaign.currency ?? ''} ${goalAmount.toStringAsFixed(2)}',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }

  /// Builds a widget with a specific theme, adding any necessary end punctuation.
  ///
  /// **params**:
  /// * `theme`: The [ThemeData] object, providing styling and theme-specific properties.
  ///
  /// **returns**:
  /// * `Widget`: The constructed widget styled according to the provided theme.
  Widget _buildInfoGrid(ThemeData theme) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 2.5,
      children: [
        _buildInfoItem(theme, 'Start Date', _formatDate(campaign.startDate)),
        _buildInfoItem(theme, 'End Date', _formatDate(campaign.endDate)),
        _buildInfoItem(theme, 'Status', _getCampaignStatus()),
      ],
    );
  }

  /// Builds a widget with a label and value, styled according to the theme, and ending with punctuation.
  ///
  /// **params**:
  /// * `theme`: The [ThemeData] object, providing styling and theme-specific properties.
  /// * `label`: A [String] representing the label text displayed in the widget.
  /// * `value`: A [String] or [dynamic] type representing the associated value displayed in the widget.
  ///
  /// **returns**:
  /// * `Widget`: The constructed widget containing both the label and value.
  Widget _buildInfoItem(ThemeData theme, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall!.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style:
              theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  /// Constructs a widget that combines context-specific data with a theme for display.
  ///
  /// **params**:
  /// * `context`: The [BuildContext] in which the widget is built, providing access to the widget tree.
  /// * `theme`: The [ThemeData] object, defining styling for the widget.
  ///
  /// **returns**:
  /// * `Widget`: A widget styled with theme data and contextual details.
  Widget _buildFooter(BuildContext context, ThemeData theme) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 37, 37, 37),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.volunteer_activism),
          label: const Text('Pledge'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PledgesScreen(campaign: campaign),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

  /// Formats a date as a [String] with an ending punctuation, for consistent display in UI.
  ///
  /// **params**:
  /// * `date`: A [DateTime] object representing the date to be formatted.
  ///
  /// **returns**:
  /// * `String`: The formatted date as a string.
  String _formatDate(DateTime? date) {
    if (date == null) return 'Not set';
    return DateFormat('MMM d, y').format(date);
  }

  /// Retrieves a string representation with end punctuation for display purposes.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The formatted string with required punctuation.
  String _getCampaignStatus() {
    final now = DateTime.now();
    if (campaign.startDate == null || campaign.endDate == null) {
      return 'Unknown';
    }
    if (now.isBefore(campaign.startDate!)) return 'Upcoming';
    if (now.isAfter(campaign.endDate!)) return 'Ended';
    return 'Active';
  }
}
