import 'package:flutter/material.dart';
import 'package:talawa/views/after_auth_screens/chat/direct_chats.dart';
import 'package:talawa/views/after_auth_screens/chat/event_chats.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Chats",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Direct",
              ),
              Tab(
                text: "Events",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DirectChats(),
            EventChats(),
          ],
        ),
      ),
    );
  }
}
