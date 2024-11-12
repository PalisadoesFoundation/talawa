import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/after_auth_view_models/funds_view_models/fund_view_model.dart';

/// Displays a dialog to update the pledge details, including amount, dates, and pledgers.
class UpdatePledgeDialog extends StatefulWidget {
  const UpdatePledgeDialog({
    super.key,
    required this.pledge,
    required this.onSubmit,
    required this.model,
  });

  /// The pledge object containing current pledge details.
  final Pledge pledge;

  /// Callback function to submit updated pledge details.
  final Function(Map<String, dynamic>) onSubmit;

  /// ViewModel object to handle fund-related operations.
  final FundViewModel model;

  @override
  _UpdatePledgeDialogState createState() => _UpdatePledgeDialogState();
}

class _UpdatePledgeDialogState extends State<UpdatePledgeDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _amountController;
  DateTime? _startDate;
  DateTime? _endDate;
  List<User> _selectedPledgers = [];

  late double _originalAmount;
  late String _originalCurrency;
  late List<User> _originalPledgers;
  DateTime? _originalStartDate;
  DateTime? _originalEndDate;

  @override
  void initState() {
    super.initState();
    _amountController =
        TextEditingController(text: widget.pledge.amount?.toString() ?? '');
    _startDate = widget.pledge.startDate;
    _endDate = widget.pledge.endDate;
    _selectedPledgers = widget.pledge.pledgers ?? [];

    // Initialize original values
    _originalAmount = (widget.pledge.amount ?? 0).toDouble();
    _originalCurrency = widget.model.donationCurrency;
    _originalPledgers = List.from(_selectedPledgers);
    _originalStartDate = widget.pledge.startDate;
    _originalEndDate = widget.pledge.endDate;
  }

  /// Checks if there are any changes in the current pledge details compared to the original values.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `bool`: `true` if any detail has changed, `false` otherwise.
  bool _hasChanges() {
    return _originalAmount != double.parse(_amountController.text) ||
        _originalCurrency != widget.model.donationCurrency ||
        _originalPledgers.length != _selectedPledgers.length ||
        _selectedPledgers.any((user) => !_originalPledgers.contains(user)) ||
        _startDate != _originalStartDate ||
        _endDate != _originalEndDate;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Pledge'),
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
                        child: Wrap(
                          spacing: 2.0,
                          children: _selectedPledgers.map((User pledger) {
                            return Chip(
                              avatar: CircleAvatar(
                                backgroundImage: pledger.image != null
                                    ? NetworkImage(pledger.image!)
                                    : null,
                                backgroundColor: pledger.image == null
                                    ? Colors.blue
                                    : Colors.transparent,
                                child: pledger.image == null
                                    ? const Icon(
                                        Icons.person_3,
                                        size: 18,
                                      )
                                    : null,
                              ),
                              label: Text(
                                '${pledger.firstName!} ${pledger.lastName!}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              onDeleted: () {
                                setState(() {
                                  _selectedPledgers.remove(pledger);
                                });
                              },
                            );
                          }).toList(),
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
                            _selectedPledgers.add(selectedUser);
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return widget.model.orgMembersList.where((User user) {
                            return !_selectedPledgers.contains(user);
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
                    GestureDetector(
                      onTap: () {
                        widget.model.changeCurrency(context, setState);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.model.donationCurrency,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Icon(Icons.arrow_drop_down_circle_outlined),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          prefixText: widget.model.donationCurrencySymbol,
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
                            initialDate: _startDate ?? DateTime.now(),
                            firstDate: _startDate ?? DateTime.now(),
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
          onPressed: _hasChanges()
              ? () {
                  if (_formKey.currentState!.validate() &&
                      _startDate != null &&
                      _endDate != null &&
                      _selectedPledgers.isNotEmpty) {
                    widget.onSubmit({
                      'id': widget.pledge.id,
                      'amount': double.parse(_amountController.text),
                      'startDate': DateFormat('yyyy-MM-dd').format(_startDate!),
                      'endDate': DateFormat('yyyy-MM-dd').format(_endDate!),
                      'users':
                          _selectedPledgers.map((user) => user.id).toList(),
                      'currency': widget.model.donationCurrency,
                    });
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')),
                    );
                  }
                }
              : null,
          child: const Text('Update'),
        ),
      ],
    );
  }

  /// Builds a popup menu item widget displaying the user’s name and image.
  ///
  /// **params**:
  /// * `user`: The user object to display in the popup menu.
  ///
  /// **returns**:
  /// * `Widget`: A widget representing the popup menu item with user's name and avatar.
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
