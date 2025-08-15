import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model.dart/fund_view_model.dart';

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
  User? _selectedPledger;

  late double _originalAmount;
  late String _originalCurrency;
  User? _originalPledger;
  DateTime? _originalStartDate;
  DateTime? _originalEndDate;

  @override
  void initState() {
    super.initState();
    _amountController =
        TextEditingController(text: widget.pledge.amount?.toString() ?? '');
    _amountController.addListener(_onAmountChanged);
    _startDate = widget.pledge.startDate;
    _endDate = widget.pledge.endDate;
    _selectedPledger = widget.pledge.pledger;

    // Initialize original values
    _originalAmount = (widget.pledge.amount ?? 0).toDouble();
    _originalCurrency = widget.model. ?? 'USD';
    _originalPledger = widget.pledge.pledger;
    _originalStartDate = widget.pledge.startDate;
    _originalEndDate = widget.pledge.endDate;
  }

  /// Changes state if amout is changed.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _onAmountChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _amountController.removeListener(_onAmountChanged);
    _amountController.dispose();
    super.dispose();
  }

  /// Checks if there are any changes in the current pledge details compared to the original values.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `bool`: `true` if any detail has changed, `false` otherwise.
  bool _hasChanges() {
    double currentAmount = _originalAmount;
    if (_amountController.text.isNotEmpty) {
      try {
        currentAmount = double.tryParse(_amountController.text) ?? 0;
      } catch (e) {
        // Handle invalid input gracefully if necessary
      }
    }

    return currentAmount != _originalAmount ||
        _originalCurrency != widget.model.campaignCurrencyCode ||
        _originalPledger?.id != _selectedPledger?.id ||
        _startDate != _originalStartDate ||
        _endDate != _originalEndDate;
  }

  /// Method to get fields that are updated.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: Object which include fields which are changed.
  Map<String, dynamic> _getChangedFields() {
    final Map<String, dynamic> changes = {'id': widget.pledge.id};
    try {
      final double currentAmount = double.tryParse(_amountController.text) ?? 0;
      if (currentAmount != _originalAmount) {
        changes['amount'] = currentAmount;
      }
    } catch (e) {
      // Handle parse error if needed
    }
    if (widget.model.campaignCurrencyCode != _originalCurrency) {
      changes['currency'] = widget.model.campaignCurrencyCode;
    }
    if (_startDate != _originalStartDate && _startDate != null) {
      changes['startDate'] = DateFormat('yyyy-MM-dd').format(_startDate!);
    }
    if (_endDate != _originalEndDate && _endDate != null) {
      changes['endDate'] = DateFormat('yyyy-MM-dd').format(_endDate!);
    }
    if (_selectedPledger?.id != _originalPledger?.id) {
      changes['pledgerId'] = _selectedPledger?.id;
    }
    return changes;
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
                        child: _selectedPledger != null
                            ? Chip(
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
                                onDeleted: () {
                                  setState(() {
                                    _selectedPledger = null;
                                  });
                                },
                              )
                            : const Text('No pledger selected'),
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
                            return _selectedPledger?.id != user.id;
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
                              widget.model.campaignCurrencyCode ?? 'USD',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Icon(Icons.arrow_drop_down_circle_outlined),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        key: const Key('amount_field'),
                        controller: _amountController,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          prefixText: widget.model.campaignCurrencyCode ?? 'USD',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an amount';
                          }
                          final parsedValue = double.tryParse(value);
                          if (parsedValue == null) {
                            return 'Amount must be a number';
                          }
                          if (parsedValue <= 0) {
                            return 'Amount must be greater than zero';
                          }

                          return null; // Input is valid
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
          key: const Key('update_btn'),
          onPressed: _hasChanges()
              ? () {
                  if (_formKey.currentState!.validate() &&
                      _startDate != null &&
                      _endDate != null &&
                      _selectedPledger != null) {
                    widget.onSubmit(_getChangedFields());
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
