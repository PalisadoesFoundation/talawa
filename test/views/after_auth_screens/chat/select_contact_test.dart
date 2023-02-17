import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_list_screen.dart';
import 'package:talawa/views/after_auth_screens/chat/select_contact.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

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
        home: const SelectContact(),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      );
    },
  );
}

Widget createChatListScreen() {
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
        home: const ChatPage(),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      );
    },
  );
}

Future<void> showSelectContactScreen(tester) async {
  await tester.pumpWidget(createApp());
  await tester.pump();
  await tester.tap(find.textContaining('Ayush'));
  await tester.pumpAndSettle();
}

Future<void> showSelectContactScreenByChatPage(tester) async {
  await tester.pumpWidget(createChatListScreen());
  await tester.pump();
  await tester.tap(find.byIcon(Icons.add));
  await tester.pumpAndSettle();
}

void main() {
  SizeConfig().test();
  // testSetupLocator();
  registerServices();
  registerViewModels();
  final model = SelectContactViewModel();
  model.initialise();
  final User user1 = User(id: "fakeUser1");
  final User user2 = User(id: "fakeUser2");
  final List<User> users = [user1, user2];

  when(organizationService.getOrgMembersList("XYZ"))
      .thenAnswer((realInvocation) async {
    return users;
  });

  testWidgets('Check if Select Contacts page shows up', (tester) async {
    await tester.pumpWidget(createApp());
    await tester.pump();
    expect(find.byType(Scaffold), findsOneWidget);

    await showSelectContactScreenByChatPage(tester);
    expect(find.byType(Scaffold), findsOneWidget);
  });
  testWidgets('Check if Back page button is working', (tester) async {
    await showSelectContactScreenByChatPage(tester);
    await tester.tap(find.byIcon(Icons.arrow_back));

    expect(find.byType(Scaffold), findsOneWidget);
  });
  testWidgets(
      'Check if Select contact comes up when prompted fromm chat list screen',
      (tester) async {
    await showSelectContactScreenByChatPage(tester);
    await tester.pump();

    expect(find.byType(Scaffold), findsOneWidget);
  });
}
