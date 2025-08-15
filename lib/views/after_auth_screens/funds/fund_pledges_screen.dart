import 'package:flutter/material.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model.dart/fund_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/add_pledge_dialogue_box.dart';
import 'package:talawa/widgets/pledge_card.dart';
import 'package:talawa/widgets/update_pledge_dialogue_box.dart';

/// Screen to show the pledges associated to the campaign.
class PledgesScreen extends StatefulWidget {
  const PledgesScreen({
    super.key,
    required this.campaign,
  });

  /// Instance of the parent campaign.
  final Campaign campaign;

  @override
  _PledgesScreenState createState() => _PledgesScreenState();
}

class _PledgesScreenState extends State<PledgesScreen> {
  bool _showPledged = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Handles the scroll event to load more pledges when reaching the bottom.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _onScroll() {
    final model = FundViewModel();
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (model.hasMorePledges && !model.isLoadingMorePledges) {
        model.fetchNextPledges();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<FundViewModel>(
      onModelReady: (model) {
        model.fetchPledges(widget.campaign.id!);
        model.getCurrentOrgUsersList();
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Pledges for ${widget.campaign.name}',
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
              _buildTabButtons(),
              _buildProgressIndicator(model),
              _buildSearchAndSortBar(model),
              Expanded(
                child: _buildPledgesList(model),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddPledgeDialog(context, model),
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  /// Builds the tab buttons to toggle between "Pledged" and "Raised".
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Widget`: the widget displaying tab buttons for toggling views.
  Widget _buildTabButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabButton('Pledged', _showPledged),
          _buildTabButton('Raised', !_showPledged),
        ],
      ),
    );
  }

  /// Creates an individual tab button with styling.
  ///
  /// **params**:
  /// * `label`: the text label displayed on the button.
  /// * `isSelected`: whether the button is currently selected.
  ///
  /// **returns**:
  /// * `Widget`: a styled button for toggling views.
  Widget _buildTabButton(String label, bool isSelected) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.horizontal(
          left: label == 'Pledged' ? const Radius.circular(8.0) : Radius.zero,
          right: label == 'Raised' ? const Radius.circular(8.0) : Radius.zero,
        ),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            _showPledged = label == 'Pledged';
          });
        },
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  /// Displays the progress indicator bar showing the campaign's funding status.
  ///
  /// **params**:
  /// * `model`: the data model containing pledge and funding data.
  ///
  /// **returns**:
  /// * `Widget`: a progress bar widget showing the funding progress.
  /// Displays the progress indicator bar showing the campaign's funding status.
  ///
  /// **params**:
  /// * `model`: the data model containing pledge and funding data.
  ///
  /// **returns**:
  /// * `Widget`: a custom progress bar widget showing the funding progress.
  Widget _buildProgressIndicator(FundViewModel model) {
    final totalPledged = model.allPledges.fold(0, (int sum, pledge) {
      final amount = pledge.amount ?? 0;
      return sum + amount;
    });

    final goalAmount = widget.campaign.goalAmount ?? -1;
    final totalRaised = model.allPledges.fold(0, (int sum, pledge) {
      const amountDonated = 0;
      return sum + amountDonated;
    });

    final double progress =
        _showPledged ? (totalPledged / goalAmount) : (totalRaised / goalAmount);
    final double progressValue = progress > 1.0 ? 1.0 : progress;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
                width: progressValue * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    '${(progressValue * 100).toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _showPledged
                    ? 'Pledged: ${widget.campaign.currency} ${totalPledged.toStringAsFixed(2)}'
                    : 'Raised: ${widget.campaign.currency} ${totalRaised.toStringAsFixed(2)}',
              ),
              Text(
                'Goal: ${widget.campaign.currency} ${goalAmount.toStringAsFixed(2)}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds the search and sort bar above the pledges list.
  ///
  /// **params**:
  /// * `model`: the data model for handling search and sorting actions.
  ///
  /// **returns**:
  /// * `Widget`: a widget with search and sorting functionalities.
  Widget _buildSearchAndSortBar(FundViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              onChanged: (value) => model.searchPledgers(value),
              decoration: InputDecoration(
                hintText: 'Search by Pledgers',
                prefixIcon: const Icon(Icons.search, color: Colors.green),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.green),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.green, width: 2),
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
                  dropdownColor: const Color.fromARGB(255, 49, 49, 49),
                  isExpanded: true,
                  value: model.pledgeSortOption,
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
                      model.sortPledges(newValue);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the list of pledges as a ListView.
  ///
  /// **params**:
  /// * `model`: the data model containing pledge details.
  ///
  /// **returns**:
  /// * `Widget`: a list view of all pledges.
  Widget _buildPledgesList(FundViewModel model) {
    if (model.isFetchingPledges) {
      return const Center(child: CircularProgressIndicator());
    }
    if (model.allPledges.isEmpty) {
      return const Center(
        child: Text(
          'No pledges found.',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
    if (model.userPledges.isEmpty) {
      return const Center(
        child: Text(
          'There are no pledges you are part of',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >=
            scrollInfo.metrics.maxScrollExtent - 200) {
          if (model.hasMorePledges && !model.isLoadingMorePledges) {
            model.fetchNextPledges();
          }
        }
        return false;
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount:
            model.filteredPledges.length + (model.isLoadingMorePledges ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < model.filteredPledges.length) {
            final pledge = model.filteredPledges[index];
            return PledgeCard(
              pledge: pledge,
              onUpdate: () => _showUpdatePledgeDialog(context, model, pledge),
              onDelete: () =>
                  _showDeleteConfirmationDialog(context, model, pledge),
            );
          } else {
            // Show loading indicator at the end
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }

  /// Shows the dialog for adding a new pledge.
  ///
  /// **params**:
  /// * `context`: the build context.
  /// * `model`: the data model to add pledge data.
  ///
  /// **returns**:
  ///   None
  void _showAddPledgeDialog(BuildContext context, FundViewModel model) {
    if (widget.campaign.endDate != null &&
        DateTime.now().isAfter(widget.campaign.endDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot add pledge after campaign end date'),
        ),
      );
      return;
    }
    if (widget.campaign.startDate != null &&
        DateTime.now().isBefore(widget.campaign.startDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot add pledge before campaign start date'),
        ),
      );
      return;
    }
    if (widget.campaign.id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Campaign ID is not available')),
      );
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AddPledgeDialog(
        campaign: widget.campaign,
        model: model,
        onSubmit: (pledgeData) {
          model.createPledge(pledgeData);
        },
      ),
    );
  }

  /// Shows the dialog to update an existing pledge.
  ///
  /// **params**:
  /// * `context`: the build context.
  /// * `model`: the data model to add pledge data.
  /// * `pledge`: the pledge being updated.
  ///
  /// **returns**:
  ///   None
  void _showUpdatePledgeDialog(
    BuildContext context,
    FundViewModel model,
    Pledge pledge,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) => UpdatePledgeDialog(
        model: model,
        pledge: pledge,
        onSubmit: (updatedPledgeData) {
          model.updatePledge(updatedPledgeData);
          Navigator.of(context).pop();
        },
      ),
    );
  }

  /// Show the confirmation dialogue to delete the pldege.
  ///
  /// **params**:
  /// * `context`: the build context.
  /// * `model`: the data model to add pledge data.
  /// * `pledge`: the pledge being deleted.
  ///
  /// **returns**:
  ///   None
  void _showDeleteConfirmationDialog(
    BuildContext context,
    FundViewModel model,
    Pledge pledge,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Pledge'),
        content: const Text('Are you sure you want to delete this pledge?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              model.deletePledge(pledge.id!, widget.campaign.id!);
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
