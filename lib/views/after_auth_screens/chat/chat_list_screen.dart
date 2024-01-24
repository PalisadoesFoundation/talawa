import 'package:flutter/material.dart';
import 'package:talawa/views/after_auth_screens/chat/direct_chats.dart';
import 'package:talawa/views/after_auth_screens/chat/select_contact.dart';

/// ChatPage returns a stateless widget for current user Chat Page which renders.
///
/// the list of all the users that the current user has chat with.
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
        // returns a tabs on the top for current user to switch between DirectChats and EventChats.
        body: const TabBarView(
          children: [
            DirectChats(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // onPressed to FloatingActionButton renders SelectContact Widget to chat with other users in the connection.
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SelectContact()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
