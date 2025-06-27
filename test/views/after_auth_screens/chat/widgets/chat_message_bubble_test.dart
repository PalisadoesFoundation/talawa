import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_message_bubble.dart';

Widget createChatMessageBubble() {
  return MaterialApp(
    theme: TalawaTheme.darkTheme,
    home: Scaffold(
      body: Message(
        message: ChatMessage(
          id: "fake_id",
          sender: ChatUser(
            firstName: "ravidi",
            id: "chad",
            image: "amogus",
          ),
          messageContent: "fake_chat",
          receiver: ChatUser(
            firstName: "sheikh",
            id: "gaad",
            image: "amogus",
          ),
        ),
      ),
    ),
  );
}

const remoteMessageBorderRadius = BorderRadius.only(
  bottomRight: Radius.circular(15),
  topRight: Radius.circular(15),
  bottomLeft: Radius.circular(15),
);

const localMessageBorderRadius = BorderRadius.only(
  bottomRight: Radius.circular(15),
  topLeft: Radius.circular(15),
  bottomLeft: Radius.circular(15),
);

void main() {
  SizeConfig().test();
  setupLocator();

  group("Tests for chat_message_bubble.dart", () {
    testWidgets("Check if Message shows up", (tester) async {
      await tester.pumpWidget(createChatMessageBubble());
      await tester.pump();

      expect(find.byType(Message), findsOneWidget);
    });

    testWidgets("Check if chat text renders correctly", (tester) async {
      userConfig.currentUser.firstName = "undef";
      await tester.pumpWidget(createChatMessageBubble());
      await tester.pump();

      Finder chatTextBlack = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.data == "fake_chat" &&
            widget.style!.color ==
                TalawaTheme.darkTheme.textTheme.bodyLarge!.color,
        description: 'Text widget with color as black',
      );

      expect(chatTextBlack, findsOneWidget);

      userConfig.currentUser.firstName = "ravidi";
      await tester.pumpWidget(createChatMessageBubble());
      await tester.pump();

      // Now the text color should change to black
      chatTextBlack = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.data == "fake_chat" &&
            widget.style!.color == Colors.black,
        description: 'Text widget with color as black',
      );

      expect(chatTextBlack, findsOneWidget);
    });

    testWidgets("Check if remote chat aligns correctly", (tester) async {
      userConfig.currentUser.firstName = "undef";

      await tester.pumpWidget(createChatMessageBubble());
      await tester.pump();

      // Remote message should be on the left
      final chat = find.byWidgetPredicate(
        (widget) =>
            widget is Padding &&
            widget.child is Row &&
            (widget.child! as Row).mainAxisAlignment == MainAxisAlignment.start,
        description: 'A row aligned to left (remote message)',
      );

      expect(chat, findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (widget) {
            if (widget is! Padding) return false;
            final child = widget.child;
            if (child is! Row) return false;
            if (child.children.isEmpty) return false;
            final chatContainer = child.children[0];
            if (chatContainer is! Container) return false;
            final chatDecoration = chatContainer.decoration;
            if (chatDecoration is! BoxDecoration) return false;

            return chatDecoration.color == Colors.green &&
                chatDecoration.borderRadius == remoteMessageBorderRadius;
          },
          description: "Check if chat container is properly decorated",
        ),
        findsOneWidget,
      );
    });

    testWidgets("Check if local chat shows correctly", (tester) async {
      userConfig.currentUser.firstName = "ravidi";

      await tester.pumpWidget(createChatMessageBubble());
      await tester.pump();

      // Local message should be on the right
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Padding &&
              widget.child is Row &&
              (widget.child! as Row).mainAxisAlignment == MainAxisAlignment.end,
          description: 'A row aligned to right (local message)',
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) {
            if (widget is! Padding) return false;
            final child = widget.child;
            if (child is! Row) return false;
            if (child.children.isEmpty) return false;
            final chatContainer = child.children[0];
            if (chatContainer is! Container) return false;
            final chatDecoration = chatContainer.decoration;
            if (chatDecoration is! BoxDecoration) return false;

            return chatDecoration.color == Colors.white &&
                chatDecoration.borderRadius == localMessageBorderRadius;
          },
          description: "Check if chat container is properly decorated",
        ),
        findsOneWidget,
      );
    });
  });
}
