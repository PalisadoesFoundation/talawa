import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/chat/direct_chats.dart';

/// ChatPage returns a stateless widget.
///
/// That renders a list of users with whom the current user has chatted.
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Chats",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Direct",
              ),
            ],
          ),
        ),
        // returns a tabs on the top for current user to switch between DirectChats and OrganizationChats.
        body: const TabBarView(
          children: [
            DirectChats(),
            // Organization chats will be implemented later.
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "chat_list_fab",
          // onPressed to FloatingActionButton renders SelectContact Widget to chat with other users in the connection.
          onPressed: () {
            navigationService.pushScreen(
              Routes.selectContact,
            );
          },
          icon: const Icon(
            Icons.contacts,
            color: Colors.white,
          ),
          label: Text(
            AppLocalizations.of(context)!.strictTranslate("Chat"),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}
