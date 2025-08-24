import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
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
          // Filter out current user
          final currentUserId = userConfig.currentUser.id;
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
              return GestureDetector(
                key: Key('select_contact_gesture_$index'),
                onTap: () async {
                  try {
                    // Create chat with selected user
                    final chatId = await model.createChatWithUser(user);

                    log('Chat created with ID: $chatId');

                    // Close loading dialog
                    navigationService.pop();

                    if (chatId != null) {
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
                    // Close loading dialog
                    navigationService.pop();

                    // Show error message using navigation service
                    navigationService.showTalawaErrorSnackBar(
                      'Error: $e',
                      MessageType.error,
                    );
                  }
                },
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
