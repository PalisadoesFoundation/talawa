import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_chat_input_field.dart';
import 'package:talawa/views/base_view.dart';

import '../../../../helpers/test_helpers.dart';
import '../../../../helpers/test_locator.dart';

final groupChatViewModel = getAndRegisterGroupChatViewModel();
const testChatId = "test-group-chat-123";

Widget createGroupChatInputField() {
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
        theme: TalawaTheme.darkTheme,
        home: Scaffold(
          body: GroupChatInputField(
            chatId: testChatId,
            model: groupChatViewModel,
          ),
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      );
    },
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
    registerServices();
  });

  setUp(() {
    reset(groupChatViewModel);
    when(groupChatViewModel.sendMessageToGroupChat(testChatId, "Hello"))
        .thenAnswer((_) async {});
    when(groupChatViewModel.sendMessageToGroupChat(testChatId, "Hello World"))
        .thenAnswer((_) async {});
    when(
      groupChatViewModel.sendMessageToGroupChat(
        testChatId,
        "Test Message",
      ),
    ).thenAnswer((_) async => throw Exception('Failed to send'));
  });

  group('GroupChatInputField Tests', () {
    testWidgets("Input field shows up correctly", (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Check if the field exists
      expect(find.byType(GroupChatInputField), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);

      // Check placeholder text
      expect(find.text('Type a message'), findsOneWidget);

      // Enter text and verify
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'Hello');
      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('Send button works with valid message', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Enter text
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'Hello');
      await tester.pumpAndSettle();

      // Tap send button
      await tester.tap(find.byKey(const Key('GroupInputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify message was sent
      verify(groupChatViewModel.sendMessageToGroupChat(testChatId, "Hello"))
          .called(1);

      // Check field was cleared
      final TextField field = tester.widget(textField);
      expect(field.controller!.text, '');
    });

    testWidgets('Empty message is not sent', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Try to send empty message
      final textField = find.byType(TextField);
      await tester.enterText(textField, '');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('GroupInputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify no message was sent
      verifyNever(groupChatViewModel.sendMessageToGroupChat(testChatId, ""));
    });

    testWidgets('Whitespace message is not sent', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Try to send whitespace message
      final textField = find.byType(TextField);
      await tester.enterText(textField, '   ');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('GroupInputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify no message was sent
      verifyNever(
        groupChatViewModel.sendMessageToGroupChat(testChatId, "   "),
      );

      // Check field still has whitespace
      final TextField field = tester.widget(textField);
      expect(field.controller!.text, '   ');
    });

    testWidgets('Message is trimmed before sending', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Send message with extra spaces
      final textField = find.byType(TextField);
      await tester.enterText(textField, '  Hello World  ');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('GroupInputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify trimmed message was sent
      verify(
        groupChatViewModel.sendMessageToGroupChat(
          testChatId,
          "Hello World",
        ),
      ).called(1);

      // Check field was cleared
      final TextField field = tester.widget(textField);
      expect(field.controller!.text, '');
    });

    testWidgets('Handles send error gracefully', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Try to send message that will fail
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'Test Message');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('GroupInputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify send was attempted
      verify(
        groupChatViewModel.sendMessageToGroupChat(
          testChatId,
          "Test Message",
        ),
      ).called(1);

      // Check field was restored with original message after error
      final TextField field = tester.widget(textField);
      expect(field.controller!.text, 'Test Message');

      // Verify error snackbar is shown
      verify(
        navigationService.showTalawaErrorDialog(
          'Failed to send message. Please try again.',
          MessageType.error,
        ),
      ).called(1);
    });

    testWidgets('TextField is properly styled and configured', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      final textField = find.byType(TextField);
      final TextField textFieldWidget = tester.widget(textField);

      // Check key
      expect(textFieldWidget.key, const Key('GroupInputFieldKey'));

      // Check decoration
      expect(textFieldWidget.decoration!.hintText, 'Type a message');
      expect(textFieldWidget.decoration!.border, InputBorder.none);
      expect(textFieldWidget.decoration!.enabledBorder, InputBorder.none);
      expect(textFieldWidget.decoration!.disabledBorder, InputBorder.none);
      expect(textFieldWidget.decoration!.focusedBorder, InputBorder.none);

      // Check suffixIcon exists
      expect(textFieldWidget.decoration!.suffixIcon, isNotNull);
      expect(textFieldWidget.decoration!.suffixIcon, isA<GestureDetector>());

      // Verify GestureDetector has correct key
      final gestureDetector =
          textFieldWidget.decoration!.suffixIcon! as GestureDetector;
      expect(gestureDetector.key, const Key('GroupInputFieldGestureKey'));
    });

    testWidgets('Send icon is properly displayed', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Find the send icon
      final sendIcon = find.byIcon(Icons.send);
      expect(sendIcon, findsOneWidget);

      // Verify it's wrapped in a GestureDetector
      final gestureDetector =
          find.byKey(const Key('GroupInputFieldGestureKey'));
      expect(gestureDetector, findsOneWidget);
    });

    testWidgets('Container styling is applied correctly', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Find the main container
      final containers = find.byType(Container);
      expect(containers, findsWidgets);

      // There should be multiple containers (outer container and inner container)
      expect(containers.evaluate().length, greaterThan(1));
    });

    testWidgets('Row layout is structured correctly', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Find the Row widgets
      final rows = find.byType(Row);
      expect(rows, findsWidgets);

      // Should have at least one Row for the main layout
      expect(rows.evaluate().length, greaterThan(0));
    });

    testWidgets('Expanded widgets are used for proper layout', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Find Expanded widgets
      final expanded = find.byType(Expanded);
      expect(expanded, findsWidgets);

      // Should have Expanded widgets for proper flex layout
      expect(expanded.evaluate().length, greaterThan(0));
    });

    testWidgets('SizedBox is used for spacing', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Find SizedBox widgets used for spacing
      final sizedBoxes = find.byType(SizedBox);
      expect(sizedBoxes, findsWidgets);
    });

    testWidgets('Multiple rapid taps do not cause issues', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      // Enter text
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'Rapid test');
      await tester.pumpAndSettle();

      // Tap send button multiple times rapidly
      final sendButton = find.byKey(const Key('GroupInputFieldGestureKey'));
      await tester.tap(sendButton);
      await tester.tap(sendButton);
      await tester.tap(sendButton);
      await tester.pumpAndSettle();

      // Verify message was sent at least once (due to rapid tapping, some calls might be ignored)
      verify(
        groupChatViewModel.sendMessageToGroupChat(testChatId, "Rapid test"),
      ).called(greaterThan(0));
    });

    testWidgets('Long message can be entered and sent', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      const longMessage =
          'This is a very long message that tests how the input field handles longer text content. It should be able to handle this without any issues and send it properly when the send button is tapped.';

      // Enter long text
      final textField = find.byType(TextField);
      await tester.enterText(textField, longMessage);
      await tester.pumpAndSettle();

      // Set up mock for the long message
      when(groupChatViewModel.sendMessageToGroupChat(testChatId, longMessage))
          .thenAnswer((_) async {});

      // Tap send button
      await tester.tap(find.byKey(const Key('GroupInputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify long message was sent
      verify(groupChatViewModel.sendMessageToGroupChat(testChatId, longMessage))
          .called(1);

      // Check field was cleared
      final TextField field = tester.widget(textField);
      expect(field.controller!.text, '');
    });

    testWidgets('Special characters in message are handled correctly',
        (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      const specialMessage =
          '🎉 Hello! @user #hashtag 💬 "quotes" & symbols: ±×÷=';

      // Enter special characters
      final textField = find.byType(TextField);
      await tester.enterText(textField, specialMessage);
      await tester.pumpAndSettle();

      // Set up mock for the special message
      when(
        groupChatViewModel.sendMessageToGroupChat(
          testChatId,
          specialMessage,
        ),
      ).thenAnswer((_) async {});

      // Tap send button
      await tester.tap(find.byKey(const Key('GroupInputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify special message was sent
      verify(
        groupChatViewModel.sendMessageToGroupChat(
          testChatId,
          specialMessage,
        ),
      ).called(1);

      // Check field was cleared
      final TextField field = tester.widget(textField);
      expect(field.controller!.text, '');
    });

    testWidgets('Input field maintains focus state correctly', (tester) async {
      await tester.pumpWidget(createGroupChatInputField());
      await tester.pumpAndSettle();

      final textField = find.byType(TextField);

      // Tap to focus
      await tester.tap(textField);
      await tester.pumpAndSettle();

      // Enter text
      await tester.enterText(textField, 'Focus test');
      expect(find.text('Focus test'), findsOneWidget);

      // Field should still be usable after focus changes
      await tester.enterText(textField, 'Updated text');
      expect(find.text('Updated text'), findsOneWidget);
    });
  });
}
