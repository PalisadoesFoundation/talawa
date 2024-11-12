import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/funds_view_models/fund_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/funds/fundraising_campaigns_screen.dart';
import 'package:talawa/views/base_view.dart';

/// a_line_ending_with_end_punctuation.
class FundScreen extends StatefulWidget {
  const FundScreen({super.key});

  @override
  State<FundScreen> createState() => _FundScreenState();
}

class _FundScreenState extends State<FundScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<FundViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                MainScreenViewModel.scaffoldKey.currentState!.openDrawer();
              },
            ),
            title: Text(
              AppLocalizations.of(context)!.strictTranslate('Funds'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
            ),
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
                        onChanged: (value) => model.searchFunds(value),
                        decoration: InputDecoration(
                          hintText: 'Search Funds',
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
                            value: model.fundSortOption,
                            icon: const Icon(Icons.sort, color: Colors.green),
                            items: const [
                              DropdownMenuItem(
                                value: 'createdAt_DESC',
                                child: Text('Newest'),
                              ),
                              DropdownMenuItem(
                                value: 'createdAt_ASC',
                                child: Text('Oldest'),
                              ),
                            ],
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                model.sortFunds(newValue);
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
                child: model.isFetchingFunds
                    ? const Center(child: CircularProgressIndicator())
                    : RefreshIndicator(
                        onRefresh: () async => model.fetchFunds(),
                        child: model.filteredFunds.isEmpty
                            ? const Center(
                                child: Text('No funds in this organization.'),
                              )
                            : ListView.builder(
                                itemCount: model.filteredFunds.length,
                                itemBuilder: (context, index) {
                                  final fund = model.filteredFunds[index];
                                  return FundCard(fund: fund);
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

/// a_line_ending_with_end_punctuation.
class FundCard extends StatelessWidget {
  const FundCard({super.key, required this.fund});

  /// a_line_ending_with_end_punctuation.
  final Fund fund;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(SizeConfig.screenWidth! * 0.03),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 43, 62, 44),
              Color.fromARGB(255, 25, 121, 29),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.screenWidth! * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      fund.name ?? 'Unnamed Fund',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                    ),
                  ),
                  _buildStatusChip(context),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.02),
              _buildInfoRow(
                context,
                Icons.person,
                'Created by',
                '${fund.creator!.firstName} ${fund.creator!.lastName}',
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              _buildInfoRow(
                context,
                Icons.calendar_today,
                'Created on',
                _formatDate(fund.createdAt),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.02),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CampaignsScreen(
                          fundId: fund.id!,
                          fundName: fund.name!,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.campaign, color: Colors.green),
                  label: Text(
                    AppLocalizations.of(context)!
                        .strictTranslate('View Campaigns'),
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth! * 0.05,
                      vertical: SizeConfig.screenHeight! * 0.015,
                    ),
                    backgroundColor: const Color.fromARGB(255, 235, 235, 235),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// a_line_ending_with_end_punctuation.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `context`: define_the_param
  /// * `icon`: define_the_param
  /// * `label`: define_the_param
  /// * `value`: define_the_param
  ///
  /// **returns**:
  /// * `Widget`: define_the_return
  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: SizeConfig.screenHeight! * 0.025,
          color: Colors.white70,
        ),
        SizedBox(width: SizeConfig.screenWidth! * 0.02),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  /// a_line_ending_with_end_punctuation.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `context`: define_the_param
  ///
  /// **returns**:
  /// * `Widget`: define_the_return
  Widget _buildStatusChip(BuildContext context) {
    final bool isActive = !(fund.isArchived ?? false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromARGB(255, 60, 155, 65)
            : const Color.fromARGB(255, 144, 59, 59),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'Active' : 'Inactive',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  /// a_line_ending_with_end_punctuation.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `date`: define_the_param
  ///
  /// **returns**:
  /// * `String`: define_the_return
  String _formatDate(DateTime? date) {
    if (date == null) return 'Unknown';
    return DateFormat('MMM d, yyyy').format(date);
  }
}
