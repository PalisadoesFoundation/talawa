import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_message_bubble.dart';

Widget createChatMessageBubble() {
  return MaterialApp(
    home: Scaffold(
      body: Message(
        message: ChatMessage(
          id: "fake_id",
          creator: ChatUser(
            firstName: "ravidi",
            id: "chad",
            image: "https://example.com/avatar.jpg",
          ),
          body: "fake_chat",
          createdAt: DateTime.now().toIso8601String(),
        ),
      ),
    ),
  );
}

void main() {
  SizeConfig().test();
  setupLocator();

  // Add new test group for formatTime method
  group('formatTime Tests', () {
    late Message messageWidget;

    setUp(() {
      messageWidget = Message(
        message: ChatMessage(
          id: "test_id",
          creator: ChatUser(
            firstName: "test",
            id: "test_id",
            image: "https://example.com/avatar.jpg",
          ),
          body: "test message",
          createdAt: DateTime.now().toIso8601String(),
        ),
      );
    });

    test('should return "now" for messages less than a minute old', () {
      final now = DateTime.now();
      final result =
          messageWidget.formatTime(now.subtract(const Duration(seconds: 30)));
      expect(result, 'now');
    });

    test('should return "Xm ago" for messages less than an hour old', () {
      final now = DateTime.now();
      final result =
          messageWidget.formatTime(now.subtract(const Duration(minutes: 5)));
      expect(result, '5m ago');
    });

    test('should return "HH:mm" format for messages less than a day old', () {
      final now = DateTime.now();
      final threeHoursAgo = now.subtract(const Duration(hours: 3));
      final result = messageWidget.formatTime(threeHoursAgo);
      final expected =
          '${threeHoursAgo.hour}:${threeHoursAgo.minute.toString().padLeft(2, '0')}';
      expect(result, expected);
    });

    test('should return "dd/mm" format for messages more than a day old', () {
      final now = DateTime.now();
      final threeDaysAgo = now.subtract(const Duration(days: 3));
      final result = messageWidget.formatTime(threeDaysAgo);
      final expected = '${threeDaysAgo.day}/${threeDaysAgo.month}';
      expect(result, expected);
    });

    test('should handle edge cases for time transitions', () {
      final now = DateTime.now();

      // Test exactly 1 minute ago
      final oneMinuteAgo = now.subtract(const Duration(minutes: 1));
      expect(messageWidget.formatTime(oneMinuteAgo), '1m ago');

      // Test exactly 1 hour ago
      final oneHourAgo = now.subtract(const Duration(hours: 1));
      final expectedHourFormat =
          '${oneHourAgo.hour}:${oneHourAgo.minute.toString().padLeft(2, '0')}';
      expect(messageWidget.formatTime(oneHourAgo), expectedHourFormat);

      // Test exactly 1 day ago
      final oneDayAgo = now.subtract(const Duration(days: 1));
      final expectedDayFormat = '${oneDayAgo.day}/${oneDayAgo.month}';
      expect(messageWidget.formatTime(oneDayAgo), expectedDayFormat);
    });
  });

  group("Tests for chat_message_bubble.dart", () {
    testWidgets("Check if Message shows up", (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createChatMessageBubble());
        await tester.pump();

        expect(find.byType(Message), findsOneWidget);
      });
    });

    testWidgets("Check if chat text renders correctly", (tester) async {
      await mockNetworkImagesFor(() async {
        userConfig.currentUser.id = "other_id";
        await tester.pumpWidget(createChatMessageBubble());
        await tester.pump();

        // Message from other user should be black
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Text &&
                widget.data == "fake_chat" &&
                widget.style?.color == Colors.black87,
            description:
                'Text widget with color as black for other user message',
          ),
          findsOneWidget,
        );

        userConfig.currentUser.id = "chad";
        await tester.pumpWidget(createChatMessageBubble());
        await tester.pump();

        // Message from current user should be white
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Text &&
                widget.data == "fake_chat" &&
                widget.style?.color == Colors.white,
            description:
                'Text widget with color as white for current user message',
          ),
          findsOneWidget,
        );
      });
    });

    testWidgets("Check if remote chat aligns correctly", (tester) async {
      await mockNetworkImagesFor(() async {
        userConfig.currentUser.id = "other_id";

        await tester.pumpWidget(createChatMessageBubble());
        await tester.pump();

        // Remote message should be on the left
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Row &&
                widget.mainAxisAlignment == MainAxisAlignment.start,
            description: 'A row aligned to left (remote message)',
          ),
          findsOneWidget,
        );

        // Check if avatar is displayed for remote message
        expect(
          find.byType(CircleAvatar),
          findsOneWidget,
        );

        // Check if sender name is displayed
        expect(find.text("ravidi"), findsOneWidget);
      });
    });

    testWidgets("Check if local chat aligns correctly", (tester) async {
      await mockNetworkImagesFor(() async {
        userConfig.currentUser.id = "chad";

        await tester.pumpWidget(createChatMessageBubble());
        await tester.pump();

        // Local message should be on the right
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Row &&
                widget.mainAxisAlignment == MainAxisAlignment.end,
            description: 'A row aligned to right (local message)',
          ),
          findsOneWidget,
        );

        // Check if avatar is displayed for local message
        expect(
          find.byType(CircleAvatar),
          findsOneWidget,
        );

        // Sender name should not be displayed for local messages
        expect(find.text("ravidi"), findsNothing);
      });
    });

    testWidgets("Check if time is displayed correctly", (tester) async {
      await mockNetworkImagesFor(() async {
        final now = DateTime.now();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Message(
                message: ChatMessage(
                  id: "fake_id",
                  creator: ChatUser(
                    firstName: "ravidi",
                    id: "chad",
                    image: "https://example.com/avatar.jpg",
                  ),
                  body: "fake_chat",
                  createdAt: now
                      .subtract(const Duration(minutes: 5))
                      .toIso8601String(),
                ),
              ),
            ),
          ),
        );
        await tester.pump();

        // Should show "5m ago"
        expect(find.text("5m ago"), findsOneWidget);

        // Test for messages from different times
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Message(
                message: ChatMessage(
                  id: "fake_id",
                  creator: ChatUser(
                    firstName: "ravidi",
                    id: "chad",
                    image: "https://example.com/avatar.jpg",
                  ),
                  body: "fake_chat",
                  createdAt:
                      now.subtract(const Duration(days: 1)).toIso8601String(),
                ),
              ),
            ),
          ),
        );
        await tester.pump();

        // Should show date in dd/mm format
        final expectedDate =
            "${now.subtract(const Duration(days: 1)).day}/${now.subtract(const Duration(days: 1)).month}";
        expect(find.text(expectedDate), findsOneWidget);
      });
    });
  });
}
