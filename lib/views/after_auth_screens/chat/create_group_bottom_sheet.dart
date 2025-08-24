import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';

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
  final UserConfig _userConfig = locator<UserConfig>();
  final OrganizationService _organizationService =
      locator<OrganizationService>();

  bool _isLoading = false;
  List<User> _orgMembers = [];

  @override
  void initState() {
    super.initState();
    _loadOrganizationMembers();
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    _groupDescriptionController.dispose();
    super.dispose();
  }

  /// Loads the current organization members using OrganizationService.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _loadOrganizationMembers() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final currentOrgId = _userConfig.currentOrg.id;

      if (currentOrgId == null) {
        debugPrint('ERROR: Current organization ID is null');
        _orgMembers = [];
        return;
      }

      // Use OrganizationService to get complete member data
      final allMembers =
          await _organizationService.getOrgMembersList(currentOrgId);

      // Filter out the current user from the main list, but we'll add them separately
      final otherMembers = allMembers
          .where((member) => member.id != _userConfig.currentUser.id)
          .toList();

      // Add current user at the top of the list
      _orgMembers = [_userConfig.currentUser, ...otherMembers];

      debugPrint(
        'Total members count (including current user): ${_orgMembers.length}',
      );
    } catch (e) {
      debugPrint('Error loading organization members: $e');
      _orgMembers = [];
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
      _showError('Please enter a group name');
      return;
    }

    if (_selectedMembers.length < 2) {
      _showError(
        'Please select at least 2 other members (minimum 3 total including you)',
      );
      return;
    }

    if (_selectedMembers.length > 99) {
      _showError('Maximum 99 members allowed (100 including you)');
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
        _showError('Some selected members have invalid IDs. Please try again.');
        return;
      }

      // Create the group using GroupChatViewModel
      final groupChatViewModel = locator<GroupChatViewModel>();

      final chat = await groupChatViewModel.createGroupChat(
        groupName: _groupNameController.text.trim(),
        description: _groupDescriptionController.text.trim().isNotEmpty
            ? _groupDescriptionController.text.trim()
            : 'Group chat created on ${DateTime.now().toString().split(' ')[0]}',
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
        _showError('Failed to create group: Unknown error');
      }
    } catch (e) {
      debugPrint('EXCEPTION in _createGroup: $e');
      _showError('Failed to create group: $e');
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
  void _showError(String message) {
    navigationService.showTalawaErrorSnackBar(
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

          // Selected members count
          Text(
            '${AppLocalizations.of(context)!.strictTranslate("Selected Members")}: ${_selectedMembers.length + 1}/100 (You + ${_selectedMembers.length} others)',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),

          // Member selection
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _orgMembers.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.people_outline,
                              size: 64,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              AppLocalizations.of(context)!.strictTranslate(
                                'No organization members found',
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _orgMembers.length,
                        itemBuilder: (context, index) {
                          final member = _orgMembers[index];
                          final isCurrentUser =
                              member.id == _userConfig.currentUser.id;
                          final isSelected = isCurrentUser ||
                              _selectedMembers.contains(member);

                          return CheckboxListTile(
                            value: isSelected,
                            onChanged: isCurrentUser
                                ? null // Disable checkbox for current user
                                : (bool? value) {
                                    setState(() {
                                      if (value == true) {
                                        if (_selectedMembers.length < 99) {
                                          _selectedMembers.add(member);
                                        } else {
                                          _showError(
                                            'Maximum 99 members allowed',
                                          );
                                        }
                                      } else {
                                        _selectedMembers.remove(member);
                                      }
                                    });
                                  },
                            title: Text(
                              '${member.firstName ?? ''} ${member.lastName ?? ''}${isCurrentUser ? ' (You)' : ''}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              isCurrentUser
                                  ? 'Group Creator'
                                  : (member.email ?? ''),
                            ),
                            secondary: CircleAvatar(
                              backgroundColor: isCurrentUser
                                  ? Theme.of(context).primaryColor
                                  : null,
                              backgroundImage: member.image != null &&
                                      member.image!.isNotEmpty
                                  ? NetworkImage(member.image!)
                                  : null,
                              child: member.image == null ||
                                      member.image!.isEmpty
                                  ? Text(
                                      member.firstName?.isNotEmpty == true
                                          ? member.firstName![0].toUpperCase()
                                          : '?',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : null,
                            ),
                          );
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
