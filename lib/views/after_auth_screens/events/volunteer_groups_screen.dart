import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';

/// A screen that displays the volunteer groups for a specific event.
class VolunteerGroupsScreen extends StatefulWidget {
  const VolunteerGroupsScreen({
    super.key,
    required this.event,
    required this.model,
  });

  /// The event for which volunteer groups are displayed.
  final Event event;

  /// The view model that manages the event information.
  final EventInfoViewModel model;

  @override
  State<VolunteerGroupsScreen> createState() => _VolunteerGroupsScreenState();
}

class _VolunteerGroupsScreenState extends State<VolunteerGroupsScreen> {
  /// Formats a date string into 'yyyy-MM-dd' format.
  ///
  /// **params**:
  /// * `dateStr`:The date string to format
  ///
  /// **returns**:
  /// * `String`:A formatted date string
  String _formatDate(String? dateStr) {
    if (dateStr == null) return 'N/A';

    try {
      final DateTime dateTime = DateTime.parse(dateStr);
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(dateTime);
    } catch (e) {
      return 'Invalid date';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchVolunteerGroupsAndDisplay();
  }

  /// method to fetch all volunteer groups.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _fetchVolunteerGroupsAndDisplay() async {
    await widget.model.fetchVolunteerGroups(widget.event.id!);

    // This will rebuild the widget with the updated volunteer groups.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: const Key("add_group_btn"),
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          _showCreateGroupDialog(context, widget.model);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Volunteer Groups',
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
            const SizedBox(height: 20),
            if (widget.model.volunteerGroups.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 10.0,
                ),
                margin: const EdgeInsets.only(bottom: 10.0),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Group Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Created At',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Manage',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: widget.model.volunteerGroups.isEmpty
                  ? const Center(
                      child: Text(
                        "There aren't any volunteer groups",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: widget.model.volunteerGroups.length,
                      itemBuilder: (context, index) {
                        final group = widget.model.volunteerGroups[index];
                        return Row(
                          key: const Key("group_data"),
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  group.name!,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  _formatDate(group.createdAt),
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.green),
                                onPressed: () {
                                  navigationService.pushScreen(
                                    "/manageVolunteerScreen",
                                    arguments: [
                                      widget.model.event,
                                      widget.model.volunteerGroups[index],
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  /// Displays a dialog for creating a new volunteer group.
  ///
  /// **params**:
  /// * `context`:  The build context where the dialog should be displayed
  /// * `model`:  The view model that manages event-related operations
  ///
  /// **returns**:
  ///   None
  void _showCreateGroupDialog(BuildContext context, EventInfoViewModel model) {
    final groupNameController = TextEditingController();
    final volunteersRequiredController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          key: const Key("add_grp_dialogue"),
          backgroundColor: const Color.fromARGB(255, 34, 34, 34),
          title: const Text('Create Volunteer Group'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                key: const Key("group_name_field"),
                controller: groupNameController,
                decoration: const InputDecoration(labelText: 'Group Name'),
              ),
              TextField(
                key: const Key("volunteers_required_field"),
                controller: volunteersRequiredController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Volunteers Required'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final groupName = groupNameController.text;
                final volunteersRequired =
                    int.tryParse(volunteersRequiredController.text) ?? 0;

                if (groupName.isNotEmpty && volunteersRequired > 0) {
                  final newGroup = await model.createVolunteerGroup(
                    widget.event,
                    groupName,
                    volunteersRequired,
                  );

                  if (newGroup != null) {
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      navigationService.pushScreen(
                        "/manageVolunteerScreen",
                        arguments: [widget.event, newGroup],
                      );
                    }
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Failed to create group')),
                      );
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter valid data')),
                  );
                }
              },
              child: const Text('Create Group'),
            ),
          ],
        );
      },
    );
  }
}
