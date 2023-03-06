// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:quick_actions/quick_actions.dart';

///This file contains the shortcuts by which user can manage and interact with the
///application. quick_actions package is used for this purpose.
class ShortCutMenu {
  static final quickActionsList = <ShortcutItem>[
    eventAction,
    feedAction,
    chatAction
  ];

  static const eventAction = ShortcutItem(
    type: "events_action",
    localizedTitle: "Events",
    icon: "event_icon",
  );

  static const feedAction = ShortcutItem(
    type: "feed_action",
    localizedTitle: "NewsFeed",
    icon: "newsfeed_icon",
  );

  static const chatAction = ShortcutItem(
    type: "chat_action",
    localizedTitle: "Messages",
    icon: "chat_icon",
  );
}
