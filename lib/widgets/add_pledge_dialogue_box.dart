import 'package:flutter/material.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model/fund_view_model.dart';

/// A dialog widget for creating a pledge, allowing the user to input pledge details.
class AddPledgeDialog extends StatefulWidget {
  const AddPledgeDialog({
    super.key,
    required this.model,
    required this.campaign,
  });

  /// ViewModel containing organization fund details and related methods.
  final FundViewModel model;

  /// Unique identifier for the campaign to which the pledge belongs.
  final Campaign campaign;

  @override
  _AddPledgeDialogState createState() => _AddPledgeDialogState();
}

class _AddPledgeDialogState extends State<AddPledgeDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  User? _selectedPledger;

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppLocalizations.of(context)!.strictTranslate('Create Pledge'),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!
                      .strictTranslate('Select Pledger:'),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _selectedPledger == null
                            ? Text(
                                AppLocalizations.of(context)!
                                    .strictTranslate('No pledger selected'),
                              )
                            : Chip(
                                avatar: CircleAvatar(
                                  backgroundImage: _selectedPledger?.image !=
                                          null
                                      ? NetworkImage(_selectedPledger!.image!)
                                      : null,
                                  backgroundColor:
                                      _selectedPledger?.image == null
                                          ? Colors.blue
                                          : Colors.transparent,
                                  child: _selectedPledger?.image == null
                                      ? const Icon(
                                          Icons.person_3,
                                          size: 18,
                                        )
                                      : null,
                                ),
                                label: Text(
                                  '${_selectedPledger?.firstName ?? ''} ${_selectedPledger?.lastName ?? ''}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                      ),
                      // PopupMenuButton for user selection
                      PopupMenuButton<User>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(color: Colors.grey),
                        ),
                        icon: const Icon(Icons.add),
                        onSelected: (User selectedUser) {
                          setState(() {
                            _selectedPledger = selectedUser;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return widget.model.orgMembersList.where((User user) {
                            return _selectedPledger == null ||
                                user.id != _selectedPledger!.id;
                          }).map((User user) {
                            return PopupMenuItem<User>(
                              value: user,
                              child: _buildPopupMenuItem(user),
                            );
                          }).toList();
                        },
                      ),
                    ],
                  ),
                ),

                // note form field
                TextFormField(
                  controller: _noteController,
                  decoration: InputDecoration(
                    labelText:
                        AppLocalizations.of(context)!.strictTranslate('Note'),
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!
                              .strictTranslate('Amount'),
                          prefixText: '${widget.campaign.currency ?? 'USD'} ',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!
                                .strictTranslate('Please enter an amount');
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            AppLocalizations.of(context)!.strictTranslate('Cancel'),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate() && _selectedPledger != null) {
              widget.model.createPledge({
                'amount': double.parse(_amountController.text),
                'campaignId': widget.campaign.id,
                'note': _noteController.text,
                'pledgerId': _selectedPledger?.id,
              });
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context)!
                        .strictTranslate('Please fill all fields'),
                  ),
                ),
              );
            }
          },
          child: Text(
            AppLocalizations.of(context)!.strictTranslate('Create'),
          ),
        ),
      ],
    );
  }

  /// Builds a menu item widget representing a user in the PopupMenuButton.
  ///
  /// **params**:
  /// * `user`: The user whose details are to be displayed in the menu item.
  ///
  /// **returns**:
  /// * `Widget`: A widget displaying the user’s avatar and name.
  Widget _buildPopupMenuItem(User user) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  user.image != null ? NetworkImage(user.image!) : null,
              backgroundColor:
                  user.image == null ? Colors.blue : Colors.transparent,
              child: user.image == null
                  ? const Icon(
                      Icons.person_3,
                      size: 18,
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              user.name ??
                  AppLocalizations.of(context)!.strictTranslate('Unknown Name'),
            ),
          ],
        ),
      ],
    );
  }
}
