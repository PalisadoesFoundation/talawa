import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/chat/create_group_bottom_sheet.dart';
import 'package:talawa/views/after_auth_screens/chat/direct_chats.dart';
import 'package:talawa/views/after_auth_screens/chat/group_chats.dart';

/// This returns a widget for the page to chat with the selected contact.
class ChatPage extends StatefulWidget {
  /// Creates a ChatPage widget.
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: "Direct",
            ),
            Tab(
              text: "Groups",
            ),
          ],
        ),
      ),
      // returns a tabs on the top for current user to switch between DirectChats and GroupChats.
      body: TabBarView(
        controller: _tabController,
        children: const [
          DirectChats(),
          GroupChats(),
        ],
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _tabController,
        builder: (context, child) {
          if (_tabController.index == 0) {
            // Direct chats tab - show contact selection FAB
            return FloatingActionButton.extended(
              heroTag: "chat_list_fab",
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
            );
          } else {
            // Groups tab - show group creation FAB
            return FloatingActionButton.extended(
              onPressed: () {
                _showCreateGroupDialog(context);
              },
              icon: const Icon(
                Icons.group_add,
                color: Colors.white,
              ),
              label: Text(
                AppLocalizations.of(context)!.strictTranslate("Create Group"),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            );
          }
        },
      ),
    );
  }

  /// Shows the create group dialog.
  ///
  /// **params**:
  /// * `context`: The build context for showing the dialog
  ///
  /// **returns**:
  ///   None
  void _showCreateGroupDialog(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CreateGroupBottomSheet(),
    );
  }
}
