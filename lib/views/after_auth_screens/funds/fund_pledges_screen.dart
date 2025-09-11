import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model/fund_view_model.dart';
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
              '${AppLocalizations.of(context)!.strictTranslate('Pledges for')} ${widget.campaign.name}',
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
    if (model.userPledges.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context)!
              .strictTranslate('There are no pledges you are part of'),
          style: const TextStyle(fontSize: 18),
        ),
      );
    }
    return ListView.builder(
      itemCount: model.userPledges.length,
      itemBuilder: (context, index) {
        final pledge = model.userPledges[index];
        return PledgeCard(
          pledge: pledge,
          onUpdate: () => _showUpdatePledgeDialog(context, model, pledge),
          onDelete: () => _showDeleteConfirmationDialog(context, model, pledge),
        );
      },
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
      navigationService.showTalawaErrorSnackBar(
        AppLocalizations.of(context)!
            .strictTranslate('Cannot add pledge after campaign end date'),
        MessageType.error,
      );
      return;
    }
    if (widget.campaign.startDate != null &&
        DateTime.now().isBefore(widget.campaign.startDate!)) {
      navigationService.showTalawaErrorSnackBar(
        AppLocalizations.of(context)!
            .strictTranslate('Cannot add pledge before campaign start date'),
        MessageType.error,
      );
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AddPledgeDialog(
        campaign: widget.campaign,
        model: model,
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
        title: Text(
          AppLocalizations.of(context)!.strictTranslate("Delete Pledge"),
        ),
        content: Text(
          AppLocalizations.of(context)!.strictTranslate(
            "Are you sure you want to delete this pledge?",
          ),
        ),
        actions: [
          TextButton(
            onPressed: navigationService.pop,
            child:
                Text(AppLocalizations.of(context)!.strictTranslate("Cancel")),
          ),
          TextButton(
            onPressed: () {
              model.deletePledge(pledge.id!, widget.campaign.id!);
              navigationService.pop();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child:
                Text(AppLocalizations.of(context)!.strictTranslate("Delete")),
          ),
        ],
      ),
    );
  }
}
