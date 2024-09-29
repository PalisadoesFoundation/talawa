import 'package:flutter_test/flutter_test.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:talawa/constants/quick_actions.dart';

void main() {
  const eventAction = ShortcutItem(
    type: "events_action",
    localizedTitle: "Events",
    icon: "event_icon",
  );

  const feedAction = ShortcutItem(
    type: "feed_action",
    localizedTitle: "NewsFeed",
    icon: "newsfeed_icon",
  );

  const chatAction = ShortcutItem(
    type: "chat_action",
    localizedTitle: "Messages",
    icon: "chat_icon",
  );

  final desiredActions = <ShortcutItem>[
    eventAction,
    feedAction,
    chatAction,
  ];
  test('ShortcutMenu', () {
    expect(ShortCutMenu.quickActionsList, desiredActions);
  });
}
