import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model.dart/fund_view_model.dart';

/// A dialog widget for creating a pledge, allowing the user to input pledge details.
class AddPledgeDialog extends StatefulWidget {
  const AddPledgeDialog({
    super.key,
    required this.onSubmit,
    required this.model,
    required this.campaign,
  });

  /// Callback function that triggers when the form is submitted, passing the pledge data.
  final Function(Map<String, dynamic>) onSubmit;

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
  DateTime? _startDate;
  DateTime? _endDate;
  User? _selectedPledger;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Pledge'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Select Pledger:'),
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
                            ? const Text('No pledger selected')
                            : Chip(
                                avatar: CircleAvatar(
                                  backgroundImage: _selectedPledger!.image !=
                                          null
                                      ? NetworkImage(_selectedPledger!.image!)
                                      : null,
                                  backgroundColor:
                                      _selectedPledger!.image == null
                                          ? Colors.blue
                                          : Colors.transparent,
                                  child: _selectedPledger!.image == null
                                      ? const Icon(
                                          Icons.person_3,
                                          size: 18,
                                        )
                                      : null,
                                ),
                                label: Text(
                                  '${_selectedPledger!.firstName!} ${_selectedPledger!.lastName!}',
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
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.campaign.currency ?? 'USD',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          prefixText: widget.campaign.currency ?? 'USD',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an amount';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)),
                          );
                          if (picked != null) {
                            setState(() => _startDate = picked);
                          }
                        },
                        child: _startDate == null
                            ? const Text('Select Start date')
                            : Text(
                                'Start: ${DateFormat('MMM d, y').format(_startDate!)}',
                                style: const TextStyle(fontSize: 13),
                              ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate:
                                _endDate ?? (_startDate ?? DateTime.now()),
                            firstDate: _startDate ?? DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)),
                          );
                          if (picked != null) setState(() => _endDate = picked);
                        },
                        child: _endDate == null
                            ? const Text('Select End date')
                            : Text(
                                'End: ${DateFormat('MMM d, y').format(_endDate!)}',
                                style: const TextStyle(fontSize: 13),
                              ),
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
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate() &&
                _startDate != null &&
                _endDate != null &&
                _selectedPledger != null) {
              widget.onSubmit({
                'campaignId': widget.campaign.id,
                'amount': double.parse(_amountController.text),
                'startDate': DateFormat('yyyy-MM-dd').format(_startDate!),
                'endDate': DateFormat('yyyy-MM-dd').format(_endDate!),
                'pledgerId': _selectedPledger!.id,
                'currency': widget.campaign.currency ?? 'USD',
              });
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please fill all fields')),
              );
            }
          },
          child: const Text('Create'),
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
            Text('${user.firstName} ${user.lastName}'),
          ],
        ),
      ],
    );
  }
}
