import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model.dart/fund_view_model.dart';
import 'package:talawa/views/after_auth_screens/funds/fundraising_campaigns_screen.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/fund_build_info_row.dart';

/// Screen to show the list of funds in the organization.
class FundScreen extends StatefulWidget {
  const FundScreen({super.key});

  @override
  State<FundScreen> createState() => _FundScreenState();
}

class _FundScreenState extends State<FundScreen> {
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
        _model!.hasMoreFunds &&
        !_model!.isLoadingMoreFunds &&
        !_model!.isFetchingFunds) {
      _model!.loadMoreFunds();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<FundViewModel>(
      onModelReady: (model) {
        _model = model;
        model.initialise();
      },
      builder: (context, model, child) {
        _model = model; // Update model reference on rebuilds
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
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
                          hintText: AppLocalizations.of(context)!
                              .strictTranslate('Search Funds'),
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
                        onRefresh: model.fetchFunds,
                        child: model.filteredFunds.isEmpty
                            ? Center(
                                child: Text(
                                  AppLocalizations.of(context)!.strictTranslate(
                                    'No funds in this organization.',
                                  ),
                                ),
                              )
                            : ListView.builder(
                                controller: _scrollController,
                                itemCount: model.filteredFunds.length +
                                    (model.hasMoreFunds ? 1 : 0),
                                itemBuilder: (context, index) {
                                  if (index < model.filteredFunds.length) {
                                    final fund = model.filteredFunds[index];
                                    return FundCard(fund: fund);
                                  } else {
                                    // Show loading indicator at the bottom
                                    return Container(
                                      padding: const EdgeInsets.all(16),
                                      alignment: Alignment.center,
                                      child: model.isLoadingMoreFunds
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

/// A card widget to display fund details.
class FundCard extends StatelessWidget {
  const FundCard({super.key, required this.fund});

  /// Fund details to display.
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
                      fund.name ??
                          AppLocalizations.of(context)!
                              .strictTranslate('Unnamed Fund'),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.02),
              FundBuildInfoRow(
                icon: Icons.person,
                label:
                    AppLocalizations.of(context)!.strictTranslate('Created by'),
                value:
                    '${fund.creator?.name ?? AppLocalizations.of(context)!.strictTranslate('Unknown Creator')} ',
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              FundBuildInfoRow(
                icon: Icons.calendar_today,
                label:
                    AppLocalizations.of(context)!.strictTranslate('Created on'),
                value: fund.createdAt != null
                    ? DateFormat.yMMMd().format(fund.createdAt!)
                    : AppLocalizations.of(context)!
                        .strictTranslate('Unknown Date'),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.02),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (fund.id == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppLocalizations.of(context)!
                                .strictTranslate('Fund ID is not available'),
                          ),
                        ),
                      );
                      return;
                    }
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
}
