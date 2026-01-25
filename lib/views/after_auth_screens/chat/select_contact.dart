<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/views/base_view.dart';
=======
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';
>>>>>>> upstream/develop

/// SelectContact returns a widget that has mutable state _SelectContactState.
class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  _SelectContactState createState() => _SelectContactState();
}

/// _SelectContactState returns a widget that renders the list of the users that current user can chat with.
class _SelectContactState extends State<SelectContact> {
<<<<<<< HEAD
=======
  bool _creating = false;
>>>>>>> upstream/develop
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
<<<<<<< HEAD
          return ListView.builder(
            itemCount: model.orgMembersList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                key: Key('select_contact_gesture_$index'),
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatMessageScreen(chat: ChatListTileDataModel(ChatUser(model.orgMembersList[index].firstName,model.orgMembersList[index].id,model.orgMembersList[index].image),null,0))));
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 25,
                      ),
                      title: Text(
                        model.orgMembersList[index].firstName.toString(),
                      ),
                    ),
                  ),
=======
          // Filter out current user
          final currentUserId = locator<UserConfig>().currentUser.id;
          final contacts = model.orgMembersList
              .where((user) => user.id != currentUserId)
              .toList();
          if (model.isBusy) {
            return const Center(
              child: CustomProgressDialog(
                key: Key("Select Contacts"),
              ),
            );
          }

          if (contacts.isEmpty) {
            return const Center(
              child: Text('No users found in this organization'),
            );
          }

          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final user = contacts[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  enabled: !_creating,
                  key: Key('select_contact_gesture_$index'),
                  onTap: () async {
                    if (_creating) return;
                    setState(() {
                      _creating = true;
                    });
                    try {
                      // Create chat with selected user
                      final chatId = await model.createChatWithUser(user);

                      if (chatId != null) {
                        log('Chat created with ID: $chatId');
                        // Get the DirectChatViewModel instance and ensure it's initialized
                        final directChatViewModel =
                            locator<DirectChatViewModel>();

                        // Initialize the DirectChatViewModel before navigation
                        await directChatViewModel.initialise();

                        // Navigate to chat screen
                        navigationService.pushScreen(
                          Routes.chatMessageScreen,
                          arguments: [chatId, directChatViewModel],
                        );
                      } else {
                        // Show error message using navigation service
                        navigationService.showTalawaErrorSnackBar(
                          'Failed to create chat',
                          MessageType.error,
                        );
                      }
                    } catch (e) {
                      // Show error message using navigation service
                      navigationService.showTalawaErrorSnackBar(
                        'Error: $e',
                        MessageType.error,
                      );
                    } finally {
                      if (mounted) {
                        setState(() {
                          _creating = false;
                        });
                      }
                    }
                  },
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
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                  title: Text(
                    user.firstName ??
                        user.lastName ??
                        user.name ??
                        'Unknown User',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    user.email ?? 'Not available',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chat,
                    color: Colors.blue,
                  ),
>>>>>>> upstream/develop
                ),
              );
            },
          );
        },
      ),
    );
  }
}
