import 'package:flutter/material.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/manage_volunteer_group_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// ManageGroupScreen handles the display and management of volunteers within a specific group.
///
/// This screen shows the list of volunteers, their current status (Accepted, Rejected, Pending),
/// and allows the user to add new volunteers, edit group details, or delete the group.
class ManageGroupScreen extends StatelessWidget {
  const ManageGroupScreen({
    super.key,
    required this.group,
    required this.event,
  });

  /// The volunteer group being managed.
  final EventVolunteerGroup group;

  /// The event to which the volunteer group belongs.
  final Event event;

  @override
  Widget build(BuildContext context) {
    return BaseView<ManageVolunteerGroupViewModel>(
      onModelReady: (model) => model.initialize(event, group),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              group.name ?? 'N/A',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (model.volunteers.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: const Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Volunteer',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            'Status',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: model.volunteers.isEmpty
                      ? Center(
                          child: Text(
                            'No volunteers yet',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: model.volunteers.length,
                          itemBuilder: (context, index) {
                            final volunteer = model.volunteers[index];
                            final response = volunteer.response;

                            String status;
                            Color statusColor;

                            switch (response) {
                              case 'YES':
                                status = 'Accepted';
                                statusColor = Colors.green;
                                break;
                              case 'NO':
                                status = 'Rejected';
                                statusColor = Colors.red;
                                break;
                              default:
                                status = 'Pending';
                                statusColor = Colors.grey;
                            }

                            return ListTile(
                              key: const Key("volunteers"),
                              title: Text(
                                '${volunteer.user?.firstName} ${volunteer.user?.lastName}',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 24),
                                    child: Text(
                                      status,
                                      style: TextStyle(
                                        color: statusColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    key: Key("delete_volunteer$index"),
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      model.removeVolunteerFromGroup(
                                        volunteer.id ?? '',
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Volunteer removed'),
                                          duration: Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                if (model.volunteers.isNotEmpty)
                  _buildVolunteerStatusSummary(model),
                SizedBox(height: SizeConfig.screenHeight! * 0.011),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _showAddVolunteerBottomSheet(context, model);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Add Volunteers',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.01),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _showEditGroupDialog(context, model);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        label: const Text(
                          'Edit Group',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth! * 0.02),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final bool? confirm = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                key: const Key("Delete_group_dialogue"),
                                title: const Text('Confirm Deletion'),
                                content: const Text(
                                  'Are you sure you want to delete this group?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (confirm == true) {
                            await model.deleteVolunteerGroup(group.id ?? '');
                            if (context.mounted) {
                              Navigator.pop(context, true);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        label: const Text(
                          'Delete Group',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Builds a summary of the volunteer statuses for the group..
  ///
  /// **params**:
  /// * `model`: The view model managing the group
  ///
  /// **returns**:
  /// * `Widget`: A [Widget] displaying the volunteer status summary
  Widget _buildVolunteerStatusSummary(ManageVolunteerGroupViewModel model) {
    final int accepted = model.volunteers
        .where((volunteer) => volunteer.response == 'YES')
        .length;
    final int pending = model.volunteers
        .where((volunteer) => volunteer.response == null)
        .length;
    final int needed = group.volunteersRequired != null
        ? (group.volunteersRequired! - accepted)
        : 0;

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Accepted Volunteers: $accepted',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            'Pending Volunteers: $pending',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            'Volunteers Still Needed: ${needed > 0 ? needed : 0}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  /// Shows a dialog allowing the user to edit the group's name and required volunteers.
  ///
  /// **params**:
  /// * `context`: [BuildContext] - The build context.
  /// * `model`: [ManageVolunteerGroupViewModel] - The view model managing the group.
  ///
  /// **returns**:
  ///   None
  void _showEditGroupDialog(
    BuildContext context,
    ManageVolunteerGroupViewModel model,
  ) {
    final TextEditingController nameController =
        TextEditingController(text: group.name);
    final TextEditingController volunteersRequiredController =
        TextEditingController(text: group.volunteersRequired.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Group'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                key: const Key('groupNameField'),
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Group Name',
                ),
              ),
              TextField(
                key: const Key('groupVolunteerRequiredField'),
                controller: volunteersRequiredController,
                decoration: const InputDecoration(
                  labelText: 'Volunteers Required',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final String newName = nameController.text.trim();
                final int newVolunteersRequired =
                    int.tryParse(volunteersRequiredController.text.trim())!;

                if (newName.isNotEmpty && newVolunteersRequired > 0) {
                  await model.updateVolunteerGroup(
                    group,
                    event.id ?? '',
                    newName,
                    newVolunteersRequired,
                  );

                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  /// Shows the bottom sheet for adding a new volunteer to the group.
  ///
  /// **params**:
  /// * `context`: [BuildContext] - The build context.
  /// * `model`: [ManageVolunteerGroupViewModel] - The view model managing the group.
  ///
  /// **returns**:
  ///   None
  void _showAddVolunteerBottomSheet(
    BuildContext context,
    ManageVolunteerGroupViewModel model,
  ) {
    model.getCurrentOrgUsersList().then((members) {
      if (context.mounted) {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          isScrollControlled: true,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    key: const Key("bottomSheetContainer"),
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text(
                            'Add Volunteers',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () async {
                              for (final member
                                  in model.memberCheckedMap.entries) {
                                if (member.value) {
                                  await model.addVolunteerToGroup(
                                    member.key,
                                    event.id ?? '',
                                    group.id ?? '',
                                  );
                                }
                              }
                              if (context.mounted) {
                                model.memberCheckedMap.clear();
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Done'),
                          ),
                          const Divider(),
                          members.isEmpty
                              ? const Center(
                                  child: Text(
                                    "There aren't any members in this organization.",
                                  ),
                                )
                              : Flexible(
                                  child: ListView.builder(
                                    key: const Key("members_list_key"),
                                    shrinkWrap: true,
                                    itemCount: members.length,
                                    itemBuilder: (context, index) {
                                      return CheckboxListTile(
                                        key: Key("checkBox$index"),
                                        checkColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        activeColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        title: Text(
                                          "${members[index].firstName} ${members[index].lastName}",
                                        ),
                                        value: model.memberCheckedMap[
                                            members[index].id],
                                        onChanged: (val) {
                                          setState(() {
                                            final memberId = members[index].id;
                                            if (memberId != null) {
                                              model.memberCheckedMap[memberId] =
                                                  val ?? false;
                                            }
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      }
    });
  }
}
