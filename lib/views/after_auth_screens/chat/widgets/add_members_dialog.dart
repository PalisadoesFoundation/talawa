import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';

/// Dialog widget for selecting members to add to a group chat.
class AddMembersDialog extends StatefulWidget {
  const AddMembersDialog({
    super.key,
    required this.availableMembers,
    required this.onMembersSelected,
  });

  /// List of organization members available to add.
  final List<dynamic> availableMembers;

  /// Callback function when members are selected.
  final Function(List<dynamic>) onMembersSelected;

  @override
  State<AddMembersDialog> createState() => _AddMembersDialogState();
}

class _AddMembersDialogState extends State<AddMembersDialog> {
  final List<dynamic> _selectedMembers = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Members'),
      content: SizedBox(
        width: double.maxFinite,
        child: widget.availableMembers.isEmpty
            ? const Text('No members available to add')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select members to add to the group:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.availableMembers.length,
                      itemBuilder: (context, index) {
                        final member = widget.availableMembers[index];
                        final isSelected = _selectedMembers.contains(member);

                        return CheckboxListTile(
                          title: Text(
                            (member as dynamic).firstName as String? ??
                                'Unknown',
                          ),
                          subtitle: Text(
                            (member as dynamic).email as String? ??
                                'Unavailable',
                          ),
                          value: isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                _selectedMembers.add(member);
                              } else {
                                _selectedMembers.remove(member);
                              }
                            });
                          },
                          secondary: CircleAvatar(
                            child: Text(
                              (((member as dynamic).firstName as String?)
                                          ?.isNotEmpty ==
                                      true)
                                  ? ((member as dynamic).firstName as String)[0]
                                      .toUpperCase()
                                  : 'U',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
      actions: [
        TextButton(
          onPressed: () => navigationService.pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _selectedMembers.isEmpty
              ? null
              : () => widget.onMembersSelected(_selectedMembers),
          child: Text(
            'Add ${_selectedMembers.length} Member${_selectedMembers.length == 1 ? '' : 's'}',
          ),
        ),
      ],
    );
  }
}
