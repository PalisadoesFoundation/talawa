import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';

/// Dialog widget for selecting members to add to a group chat.
class AddGroupChatMembersDialog extends StatefulWidget {
  const AddGroupChatMembersDialog({
    super.key,
    required this.availableMembers,
    required this.onMembersSelected,
  });

  /// List of organization members available to add.
  final List<User> availableMembers;

  /// Callback function when members are selected.
  final Function(List<User>) onMembersSelected;

  @override
  State<AddGroupChatMembersDialog> createState() =>
      _AddGroupChatMembersDialogState();
}

class _AddGroupChatMembersDialogState extends State<AddGroupChatMembersDialog> {
  final List<User> _selectedMembers = [];

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
                            member.firstName ?? 'Unknown',
                          ),
                          subtitle: Text(
                            member.email ?? 'Unavailable',
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
                              (member.firstName?.isNotEmpty == true)
                                  ? member.firstName![0].toUpperCase()
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
