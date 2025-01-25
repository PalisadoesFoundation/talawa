




build method - ManageGroupScreen class - manage\_volunteer\_group library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/events/manage\_volunteer\_group.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_manage_volunteer_group/)
3. [ManageGroupScreen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_manage_volunteer_group/ManageGroupScreen-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
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
            group.name!,
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
                              '${volunteer.user!.firstName} ${volunteer.user!.lastName}',
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
                                      volunteer.id!,
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
                          await model.deleteVolunteerGroup(group.id!);
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
```

 


1. [talawa](../../index.html)
2. [manage\_volunteer\_group](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_manage_volunteer_group/)
3. [ManageGroupScreen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_manage_volunteer_group/ManageGroupScreen-class.html)
4. build method

##### ManageGroupScreen class





talawa
1.0.0+1






