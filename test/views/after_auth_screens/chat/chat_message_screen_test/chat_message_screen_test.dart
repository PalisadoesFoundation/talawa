// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_message_screen.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/chat_input_field.dart';
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
  SizeConfig().test();
  testSetupLocator();
  registerServices();

  testWidgets('Check if Chat Message Screen page shows up', (tester) async {
    await showChatMessageScreen(tester);
    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('Check if Back page button is working', (tester) async {
    await showChatMessageScreen(tester);
    await tester.tap(find.byIcon(Icons.arrow_back));

    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('Check if the Chat Input Field is in the widget tree',
      (tester) async {
    await showChatMessageScreen(tester);

    expect(find.byType(ChatInputField), findsOneWidget);
  });

  testWidgets(
    'Check if the circular progress indicator shows up on the loading state',
    (tester) async {
      when(directChatViewModel.chatState).thenReturn(ChatState.loading);
      await tester.pumpWidget(createApp());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );
}
