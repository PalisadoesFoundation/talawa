import 'package:flutter/material.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model.dart/fund_view_model.dart';

/// Displays a dialog to update the pledge details, including amount, dates, and pledgers.
class UpdatePledgeDialog extends StatefulWidget {
  const UpdatePledgeDialog({
    super.key,
    required this.pledge,
    required this.model,
  });

  /// The pledge object containing current pledge details.
  final Pledge pledge;

  /// ViewModel object to handle fund-related operations.
  final FundViewModel model;

  @override
  _UpdatePledgeDialogState createState() => _UpdatePledgeDialogState();
}

class _UpdatePledgeDialogState extends State<UpdatePledgeDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.pledge.amount?.toString() ?? '';
    _noteController.text = widget.pledge.note ?? '';
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
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
                TextFormField(
                  controller: _noteController,
                  decoration: const InputDecoration(
                    labelText: 'Note',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          prefixText:
                              '${widget.pledge.campaign?.currency ?? 'USD'} ',
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
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              Navigator.of(context).pop();
              await widget.model.updatePledge({
                'id': widget.pledge.id,
                'amount': double.parse(_amountController.text),
                'note': _noteController.text,
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please fill all fields')),
              );
            }
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
