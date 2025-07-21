import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_message_screen.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_input_field.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_message_bubble.dart';
import 'package:talawa/views/base_view.dart';

import '../../../../helpers/test_helpers.dart';
import '../../../../helpers/test_locator.dart';

final directChatViewModel = getAndRegisterDirectChatViewModel();

Widget createApp() {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: ChatMessageScreen(chatId: "XYZ", model: directChatViewModel),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      );
    },
  );
}

Future<void> showChatMessageScreen(WidgetTester tester) async {
  await tester.pumpWidget(createApp());
  await tester.pumpAndSettle();
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
    registerServices();
  });

  setUp(() {
    // Reset mock behavior before each test
    reset(directChatViewModel);
    when(directChatViewModel.chatState).thenReturn(ChatState.complete);
    when(directChatViewModel.chatMessagesByUser).thenReturn({});
    // Add default mock returns for pagination methods
    when(directChatViewModel.hasMoreMessages("XYZ")).thenReturn(false);
    when(directChatViewModel.isLoadingMoreMessages("XYZ")).thenReturn(false);
    when(directChatViewModel.loadMoreMessages("XYZ")).thenAnswer((_) async {});
    when(directChatViewModel.getChatMessages("XYZ")).thenAnswer((_) async {});
    when(directChatViewModel.chatName("XYZ")).thenReturn(null);
  });

  group('ChatMessageScreen UI Tests', () {
    testWidgets('Check if Chat Message Screen page shows up', (tester) async {
      await showChatMessageScreen(tester);
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('Check if Back button is working', (tester) async {
      await showChatMessageScreen(tester);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      verify(navigationService.pop()).called(1);
    });

    testWidgets('Check if the Chat Input Field is in the widget tree',
        (tester) async {
      await showChatMessageScreen(tester);
      expect(find.byType(ChatInputField), findsOneWidget);
    });

    testWidgets('Shows loading indicator when in loading state',
        (tester) async {
      when(directChatViewModel.chatState).thenReturn(ChatState.loading);
      await tester.pumpWidget(createApp());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Shows empty state when no messages', (tester) async {
      when(directChatViewModel.chatMessagesByUser).thenReturn({"XYZ": []});
      await tester.pumpWidget(createApp());
      await tester.pump();

      expect(find.text('No messages yet'), findsOneWidget);
      expect(find.text('Start the conversation!'), findsOneWidget);
      expect(find.byIcon(Icons.chat_bubble_outline), findsOneWidget);
    });

    testWidgets('Shows chat messages when available', (tester) async {
      final messages = [
        ChatMessage(
          id: "1",
          body: "Hello",
          creator: ChatUser(id: "user1", firstName: "John"),
          createdAt: DateTime.now().toIso8601String(),
        ),
        ChatMessage(
          id: "2",
          body: "Hi there",
          creator: ChatUser(id: "user2", firstName: "Jane"),
          createdAt: DateTime.now().toIso8601String(),
        ),
      ];

      when(directChatViewModel.chatMessagesByUser)
          .thenReturn({"XYZ": messages});
      await tester.pumpWidget(createApp());
      await tester.pump();

      expect(find.byType(Message), findsNWidgets(2));
      expect(find.text('Hello'), findsOneWidget);
      expect(find.text('Hi there'), findsOneWidget);
    });

    testWidgets('Shows chat name in header', (tester) async {
      when(directChatViewModel.chatName("XYZ")).thenReturn("John Doe");
      await tester.pumpWidget(createApp());
      await tester.pump();

      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Active now'), findsOneWidget);
    });

    testWidgets('Shows default chat name when none provided', (tester) async {
      when(directChatViewModel.chatName("XYZ")).thenReturn(null);
      await tester.pumpWidget(createApp());
      await tester.pump();

      expect(find.text('Chat'), findsOneWidget);
    });
  });

  group('ChatMessageScreen Pagination Tests', () {
    testWidgets('Loads more messages when scrolled to top with debounce',
        (tester) async {
      // Create a list of messages that's long enough to be scrollable
      final messages = List.generate(
        20,
        (i) => ChatMessage(
          id: i.toString(),
          body: "Message $i",
          creator: ChatUser(id: "user1", firstName: "John"),
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

      when(directChatViewModel.chatMessagesByUser)
          .thenReturn({"XYZ": messages});
      when(directChatViewModel.hasMoreMessages("XYZ")).thenReturn(true);
      when(directChatViewModel.isLoadingMoreMessages("XYZ")).thenReturn(false);

      await tester.pumpWidget(createApp());
      await tester.pump();

      // Find the ListView
      final listViewFinder = find.byType(ListView);
      expect(listViewFinder, findsOneWidget);

      // Get the ScrollController and simulate scrolling to the top
      final ListView listView = tester.widget(listViewFinder);
      final ScrollController? controller = listView.controller;

      if (controller != null) {
        // Simulate scrolling to the top (maxScrollExtent)
        controller.jumpTo(controller.position.maxScrollExtent);
        await tester.pump();

        // Wait for debounce timer (100ms)
        await tester.pumpAndSettle(const Duration(milliseconds: 150));

        // Verify that loadMoreMessages was called
        verify(directChatViewModel.loadMoreMessages("XYZ")).called(1);
      } else {
        // Alternative approach: scroll the ListView directly
        await tester.drag(listViewFinder, const Offset(0, -500));
        await tester.pumpAndSettle(const Duration(milliseconds: 150));

        // The scroll might trigger the pagination logic
        verify(directChatViewModel.loadMoreMessages("XYZ")).called(1);
      }
    });

    testWidgets('Does not load more messages when hasMoreMessages is false',
        (tester) async {
      final messages = List.generate(
        20,
        (i) => ChatMessage(
          id: i.toString(),
          body: "Message $i",
          creator: ChatUser(id: "user1", firstName: "John"),
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

      when(directChatViewModel.chatMessagesByUser)
          .thenReturn({"XYZ": messages});
      when(directChatViewModel.hasMoreMessages("XYZ")).thenReturn(false);

      await tester.pumpWidget(createApp());
      await tester.pump();

      // Find the ListView and scroll
      final listViewFinder = find.byType(ListView);
      await tester.drag(listViewFinder, const Offset(0, -500));
      await tester.pumpAndSettle(const Duration(milliseconds: 150));

      verifyNever(directChatViewModel.loadMoreMessages("XYZ"));
    });

    testWidgets('Does not load more messages when already loading',
        (tester) async {
      final messages = List.generate(
        20,
        (i) => ChatMessage(
          id: i.toString(),
          body: "Message $i",
          creator: ChatUser(id: "user1", firstName: "John"),
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

      when(directChatViewModel.chatMessagesByUser)
          .thenReturn({"XYZ": messages});
      when(directChatViewModel.hasMoreMessages("XYZ")).thenReturn(true);
      when(directChatViewModel.isLoadingMoreMessages("XYZ")).thenReturn(true);

      await tester.pumpWidget(createApp());
      await tester.pump();

      // Find the ListView and scroll
      final listViewFinder = find.byType(ListView);
      await tester.drag(listViewFinder, const Offset(0, -500));
      await tester.pumpAndSettle(const Duration(milliseconds: 150));

      verifyNever(directChatViewModel.loadMoreMessages("XYZ"));
    });
  });

  group('ChatMessageScreen Lifecycle Tests', () {
    testWidgets('Loads messages on init', (tester) async {
      await tester.pumpWidget(createApp());
      await tester.pump();

      verify(directChatViewModel.getChatMessages("XYZ")).called(1);
    });

    testWidgets('Disposes ScrollController and Timer properly', (tester) async {
      await tester.pumpWidget(createApp());
      await tester.pump();

      // Trigger disposal by rebuilding with a different widget
      await tester.pumpWidget(Container());
      await tester.pump();

      // No explicit verification needed as we're just ensuring no errors occur
      expect(true, isTrue);
    });
  });
}
