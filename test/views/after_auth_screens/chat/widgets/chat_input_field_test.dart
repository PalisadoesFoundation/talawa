// ignore_for_file: talawa_api_doc

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_input_field.dart';
import 'package:talawa/views/base_view.dart';

import '../../../../helpers/test_helpers.dart';
import '../../../../helpers/test_locator.dart';

/// DirectChatViewModel mock.
final directChatViewModel = getAndRegisterDirectChatViewModel();

/// Function creates chatInputField.
///
/// **params**:
///   None
///
/// **returns**:
/// * `Widget`: The actual chatInputField to test
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
            chatId: "XYZ",
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
  SizeConfig().test();
  testSetupLocator();
  registerServices();
  testWidgets("Check if chat input field shows up", (tester) async {
    await tester.pumpWidget(createChatInputField());
    await tester.pumpAndSettle();

    expect(find.byType(ChatInputField), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);

    final textFieldWidget = find.byType(TextField);
    await tester.enterText(textFieldWidget, 'Something');

    final TextField textField = tester.widget(textFieldWidget);
    expect(textField.controller!.text, 'Something');

    expect(find.text('Type a message'), findsOneWidget);

    expect(find.text('Something'), findsOneWidget);
  });
  testWidgets('Check if sending messages work', (tester) async {
    await tester.pumpWidget(createChatInputField());
    await tester.pumpAndSettle();

    final textFieldWidget = find.byType(TextField);
    await tester.enterText(textFieldWidget, 'Something');
    await tester.pumpAndSettle();
    expect(find.text('Something'), findsOneWidget);
    await tester.pump();
    final sendMessageButton = find.byKey(const Key('InputFieldGestureKey'));
    await tester.tap(sendMessageButton);

    expect(directChatViewModel.chatMessagesByUser['XYZ']?.length, 2);

    final TextField textField = tester.widget(textFieldWidget);
    expect(textField.controller!.text, '');
  });
}
