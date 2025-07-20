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
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_input_field.dart';
import 'package:talawa/views/base_view.dart';

import '../../../../helpers/test_helpers.dart';
import '../../../../helpers/test_locator.dart';

final directChatViewModel = getAndRegisterDirectChatViewModel();
const testChatId = "test-chat-123";

Widget createChatInputField() {
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
          body: ChatInputField(
            chatId: testChatId,
            model: directChatViewModel,
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
    reset(directChatViewModel);
    when(directChatViewModel.sendMessageToDirectChat(testChatId, "Hello"))
        .thenAnswer((_) async {});
    when(directChatViewModel.sendMessageToDirectChat(testChatId, "Hello World"))
        .thenAnswer((_) async {});
    when(
      directChatViewModel.sendMessageToDirectChat(
        testChatId,
        "Test Message",
      ),
    ).thenAnswer((_) async => throw Exception('Failed to send'));
  });

  group('ChatInputField Tests', () {
    testWidgets("Input field shows up correctly", (tester) async {
      await tester.pumpWidget(createChatInputField());
      await tester.pumpAndSettle();

      // Check if the field exists
      expect(find.byType(ChatInputField), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);

      // Check placeholder text
      expect(find.text('Type a message'), findsOneWidget);

      // Enter text and verify
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'Hello');
      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('Send button works with valid message', (tester) async {
      await tester.pumpWidget(createChatInputField());
      await tester.pumpAndSettle();

      // Enter text
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'Hello');
      await tester.pumpAndSettle();

      // Tap send button
      await tester.tap(find.byKey(const Key('InputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify message was sent
      verify(directChatViewModel.sendMessageToDirectChat(testChatId, "Hello"))
          .called(1);

      // Check field was cleared
      final TextField field = tester.widget(textField);
      expect(field.controller!.text, '');
    });

    testWidgets('Empty message is not sent', (tester) async {
      await tester.pumpWidget(createChatInputField());
      await tester.pumpAndSettle();

      // Try to send empty message
      final textField = find.byType(TextField);
      await tester.enterText(textField, '');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('InputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify no message was sent
      verifyNever(directChatViewModel.sendMessageToDirectChat(testChatId, ""));
    });

    testWidgets('Whitespace message is not sent', (tester) async {
      await tester.pumpWidget(createChatInputField());
      await tester.pumpAndSettle();

      // Try to send whitespace message
      final textField = find.byType(TextField);
      await tester.enterText(textField, '   ');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('InputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify no message was sent
      verifyNever(
        directChatViewModel.sendMessageToDirectChat(testChatId, "   "),
      );

      // Check field still has whitespace
      final TextField field = tester.widget(textField);
      expect(field.controller!.text, '   ');
    });

    testWidgets('Message is trimmed before sending', (tester) async {
      await tester.pumpWidget(createChatInputField());
      await tester.pumpAndSettle();

      // Send message with extra spaces
      final textField = find.byType(TextField);
      await tester.enterText(textField, '  Hello World  ');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('InputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify trimmed message was sent
      verify(
        directChatViewModel.sendMessageToDirectChat(
          testChatId,
          "Hello World",
        ),
      ).called(1);

      // Check field was cleared
      final TextField field = tester.widget(textField);
      expect(field.controller!.text, '');
    });

    testWidgets('Handles send error gracefully', (tester) async {
      await tester.pumpWidget(createChatInputField());
      await tester.pumpAndSettle();

      // Try to send message that will fail
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'Test Message');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('InputFieldGestureKey')));
      await tester.pumpAndSettle();

      // Verify send was attempted
      verify(
        directChatViewModel.sendMessageToDirectChat(
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
          'Failed to send message: Exception: Failed to send',
          MessageType.error,
        ),
      ).called(1);
    });
  });
}
