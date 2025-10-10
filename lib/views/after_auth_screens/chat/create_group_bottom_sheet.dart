import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_member_selector.dart';

/// CreateGroupBottomSheet is a bottom sheet widget for creating new group chats.
///
/// This widget allows users to:
/// - Enter a group name (required)
/// - Add a group description (optional)
/// - Select members from current organization (min 3, max 100)
/// - Create the group chat
class CreateGroupBottomSheet extends StatefulWidget {
  /// Creates a CreateGroupBottomSheet widget.
  const CreateGroupBottomSheet({super.key});

  @override
  State<CreateGroupBottomSheet> createState() => _CreateGroupBottomSheetState();
}

class _CreateGroupBottomSheetState extends State<CreateGroupBottomSheet> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupDescriptionController =
      TextEditingController();
  final Set<User> _selectedMembers = {};

  bool _isLoading = false;

  @override
  void dispose() {
    _groupNameController.dispose();
    _groupDescriptionController.dispose();
    super.dispose();
  }

  /// Creates the group chat using GroupChatViewModel.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _createGroup() async {
    if (_groupNameController.text.trim().isEmpty) {
      showError('Please enter a group name');
      return;
    }

    if (_selectedMembers.length < 2) {
      showError(
        'Please select at least 2 other members (minimum 3 total including you)',
      );
      return;
    }

    if (_selectedMembers.length > 99) {
      showError('Maximum 99 members allowed (100 including you)');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final memberIds = _selectedMembers
          .where((user) => user.id != null) // Filter out null IDs
          .map((user) => user.id!)
          .toList();

      if (memberIds.length != _selectedMembers.length) {
        showError('Some selected members have invalid IDs. Please try again.');
        return;
      }

      // Create the group using GroupChatViewModel
      final dateLabel = DateFormat.yMMMd().format(DateTime.now());
      final groupChatViewModel = locator<GroupChatViewModel>();

      final chat = await groupChatViewModel.createGroupChat(
        groupName: _groupNameController.text.trim(),
        description: _groupDescriptionController.text.trim().isNotEmpty
            ? _groupDescriptionController.text.trim()
            : 'Group chat created on $dateLabel',
        memberIds: memberIds,
      );

      if (chat != null) {
        debugPrint('SUCCESS: Group created with ID: ${chat.id}');

        // Refresh the group chats to show the new group
        await groupChatViewModel.initialise();

        // Close the bottom sheet on success
        if (mounted) {
          navigationService.pop();
        }
      } else {
        debugPrint('ERROR: Chat is null');
        showError('Failed to create group: Unknown error');
      }
    } catch (e) {
      debugPrint('EXCEPTION in _createGroup: $e');
      showError('Failed to create group: Please try again.');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  /// Shows an error message.
  ///
  /// **params**:
  /// * `message`: The error message to display
  ///
  /// **returns**:
  ///   None
  void showError(String message) {
    navigationService.showTalawaErrorDialog(
      message,
      MessageType.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.strictTranslate('Create Group'),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => navigationService.pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Group name input
          TextField(
            controller: _groupNameController,
            decoration: InputDecoration(
              labelText:
                  AppLocalizations.of(context)!.strictTranslate('Group Name'),
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.group),
            ),
            maxLength: 50,
          ),
          const SizedBox(height: 16),

          // Group description input
          TextField(
            controller: _groupDescriptionController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!
                  .strictTranslate('Group Description'),
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.description),
            ),
            maxLength: 200,
          ),
          const SizedBox(height: 16),

          // Member selection
          Expanded(
            child: GroupMemberSelector(
              selectedMembers: _selectedMembers,
              onMembersChanged: (newSelectedMembers) {
                setState(() {
                  _selectedMembers.clear();
                  _selectedMembers.addAll(newSelectedMembers);
                });
              },
            ),
          ),

          // Create button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: _isLoading ? null : _createGroup,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      AppLocalizations.of(context)!
                          .strictTranslate('Create Group'),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
