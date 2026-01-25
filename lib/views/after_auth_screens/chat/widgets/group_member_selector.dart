import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';

/// GroupMemberSelector is a widget for selecting organization members for group chat creation.
///
/// This widget handles:
/// - Loading organization members
/// - Displaying members with checkboxes
/// - Managing member selection state
/// - Validating selection limits
class GroupMemberSelector extends StatefulWidget {
  /// Creates a GroupMemberSelector widget.
  const GroupMemberSelector({
    super.key,
    required this.onMembersChanged,
    required this.selectedMembers,
  });

  /// Callback function called when selected members change.
  final Function(Set<User>) onMembersChanged;

  /// Currently selected members.
  final Set<User> selectedMembers;

  @override
  State<GroupMemberSelector> createState() => _GroupMemberSelectorState();
}

class _GroupMemberSelectorState extends State<GroupMemberSelector> {
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
    } catch (e) {
      _orgMembers = [];
    } finally {
      setState(() {
        _isLoading = false;
      });
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

  /// Handles member selection/deselection.
  ///
  /// **params**:
  /// * `member`: The user being selected/deselected
  /// * `isSelected`: Whether the user should be selected
  ///
  /// **returns**:
  ///   None
  void _handleMemberSelection(User member, bool isSelected) {
    setState(() {
      final newSelectedMembers = Set<User>.from(widget.selectedMembers);

      if (isSelected) {
        if (newSelectedMembers.length < 99) {
          newSelectedMembers.add(member);
        } else {
          _showError('Maximum 99 members allowed');
          return;
        }
      } else {
        newSelectedMembers.remove(member);
      }

      widget.onMembersChanged(newSelectedMembers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Selected members count
        Text(
          '${AppLocalizations.of(context)!.strictTranslate("Selected Members")}: ${widget.selectedMembers.length + 1}/100 (You + ${widget.selectedMembers.length} others)',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),

        // Member selection list
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
                            widget.selectedMembers.contains(member);

                        return CheckboxListTile(
                          value: isSelected,
                          onChanged: isCurrentUser
                              ? null // Disable checkbox for current user
                              : (bool? value) {
                                  _handleMemberSelection(
                                    member,
                                    value ?? false,
                                  );
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
                            backgroundImage:
                                member.image != null && member.image!.isNotEmpty
                                    ? NetworkImage(member.image!)
                                    : null,
                            child: member.image == null || member.image!.isEmpty
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
      ],
    );
  }
}
