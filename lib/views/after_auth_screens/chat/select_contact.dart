import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// SelectContact returns a widget that has mutable state _SelectContactState.
class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  _SelectContactState createState() => _SelectContactState();
}

/// _SelectContactState returns a widget that renders the list of the users that current user can chat with.
class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            navigationService.pop();
          },
        ),
        title: Text(
          "Select Contacts",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
      ),
      body: BaseView<SelectContactViewModel>(
        onModelReady: (model) async {
          model.initialise();
          await model.getCurrentOrgUsersList();
        },
        builder: (context, model, child) {
          if (model.isBusy) {
            return const Center(
              child: CustomProgressDialog(
                key: Key("Select Contacts"),
              ),
            );
          }

          if (model.orgMembersList.isEmpty) {
            return const Center(
              child: Text('No users found in this organization'),
            );
          }

          return ListView.builder(
            itemCount: model.orgMembersList.length,
            itemBuilder: (context, index) {
              final user = model.orgMembersList[index];
              return GestureDetector(
                key: Key('select_contact_gesture_$index'),
                onTap: () {
                  // TODO: Navigate to chat screen with selected user
                  debugPrint('Selected user: ${user.firstName} (${user.id})');
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            user.image != null && user.image!.isNotEmpty
                                ? NetworkImage(user.image!)
                                : null,
                        child: user.image == null || user.image!.isEmpty
                            ? Text(
                                user.firstName?.isNotEmpty == true
                                    ? user.firstName![0].toUpperCase()
                                    : user.name?.isNotEmpty == true
                                        ? user.name![0].toUpperCase()
                                        : '?',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            : null,
                      ),
                      title: Text(
                        user.firstName ?? user.name ?? 'Unknown User',
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
