import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/views/after_auth_screens/chat/event_chats.dart';

Widget createEventChats() {
  return const EventChats();
}

void main() {
  group('Tests for event chats', () {
    testWidgets('Check whether EventChats shows up', (tester) async {
      await tester.pumpWidget(createEventChats());
      await tester.pump();

      expect(find.byType(EventChats), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });
  });
}
