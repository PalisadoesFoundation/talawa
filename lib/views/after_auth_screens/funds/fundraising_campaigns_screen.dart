// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/funds_view_models/organisation_fund_view_model.dart';
import 'package:talawa/views/after_auth_screens/funds/fund_pledges_screen.dart';
import 'package:talawa/views/base_view.dart';

class CampaignsScreen extends StatefulWidget {
  const CampaignsScreen({
    super.key,
    required this.fundId,
    required this.fundName,
  });
  final String fundId;
  final String fundName;

  @override
  State<CampaignsScreen> createState() => _CampaignsScreenState();
}

class _CampaignsScreenState extends State<CampaignsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<FundViewModel>(
      onModelReady: (model) => model.fetchCampaigns(widget.fundId),
      builder: (context, model, child) {
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
                          hintText: 'Search Campaigns',
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
                            model.fetchCampaigns(widget.fundId),
                        child: model.filteredCampaigns.isEmpty
                            ? const Center(
                                child: Text('No campaigns for this fund.'),
                              )
                            : ListView.builder(
                                itemCount: model.filteredCampaigns.length,
                                itemBuilder: (context, index) {
                                  final campaign =
                                      model.filteredCampaigns[index];
                                  return CampaignCard(campaign: campaign);
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

class CampaignCard extends StatelessWidget {
  const CampaignCard({super.key, required this.campaign});
  final Campaign campaign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final raisedAmount = _fetchRaisedAmount(campaign);
    final goalAmount = campaign.fundingGoal ?? 0;
    final progress = goalAmount > 0 ? raisedAmount / goalAmount : 0.0;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(theme),
          _buildBody(theme, raisedAmount, goalAmount, progress),
          _buildFooter(context, theme),
        ],
      ),
    );
  }

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

  Widget _buildBody(
    ThemeData theme,
    double raisedAmount,
    double goalAmount,
    double progress,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 37, 37, 37),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressIndicator(theme, raisedAmount, goalAmount, progress),
          const SizedBox(height: 16),
          _buildInfoGrid(theme),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(
    ThemeData theme,
    double raisedAmount,
    double goalAmount,
    double progress,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearPercentIndicator(
          lineHeight: 20,
          percent: progress,
          progressColor: Colors.green,
          backgroundColor: Colors.grey[300],
          animation: true,
          animationDuration: 1000,
          center: Text(
            '${(progress * 100).toStringAsFixed(1)}%',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          barRadius: const Radius.circular(10),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${campaign.currency ?? ''} ${raisedAmount.toStringAsFixed(2)} raised',
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton.icon(
            icon: const Icon(Icons.info_outline),
            label: const Text('Details'),
            onPressed: () {
              // Navigate to campaign details
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.green,
              side: const BorderSide(color: Colors.green),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.volunteer_activism),
            label: const Text('Donate'),
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
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Not set';
    return DateFormat('MMM d, y').format(date);
  }

  String _getCampaignStatus() {
    final now = DateTime.now();
    if (campaign.startDate == null || campaign.endDate == null) {
      return 'Unknown';
    }
    if (now.isBefore(campaign.startDate!)) return 'Upcoming';
    if (now.isAfter(campaign.endDate!)) return 'Ended';
    return 'Active';
  }

  double _fetchRaisedAmount(Campaign campaign) {
    return 10.0;
  }
}
