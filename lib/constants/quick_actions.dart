import 'package:quick_actions/quick_actions.dart';

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

  static const testAction = ShortcutItem(
    type: "test_action",
    localizedTitle: "Test",
    icon: "test_icon",
  );
}
