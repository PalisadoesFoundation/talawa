import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_list_screen.dart';
import 'package:talawa/views/after_auth_screens/chat/select_contact.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/main.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockSelectContactViewModel extends Mock
    implements SelectContactViewModel {}

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

Widget createTextSelectContact() {
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

Future<void> showSelectContactScreen(WidgetTester tester) async {
  await tester.pumpWidget(createApp());
  await tester.pump();
  await tester.tap(find.textContaining('Ayush'));
  await tester.pumpAndSettle();
}

Future<void> showSelectContactScreenByChatPage(WidgetTester tester) async {
  await tester.pumpWidget(createChatListScreen());
  await tester.pump();
  await tester.tap(find.byIcon(Icons.add));
  await tester.pumpAndSettle();
}

Future<void> showSelectContactText(WidgetTester tester) async {
  await tester.pumpWidget(createTextSelectContact());
  await tester.pump();
  await tester.tap(find.text('Select Contacts'));
  await tester.pumpAndSettle();
}

void main() {
  SizeConfig().test();
  // testSetupLocator();
  registerServices();
  registerViewModels();
  final model = SelectContactViewModel();
  model.initialise();
  final User user1 = User(id: "fakeUser1", firstName: "John");
  final User user2 = User(id: "fakeUser2", firstName: "Jane");
  final List<User> users = [user1, user2];
  late MockSelectContactViewModel mockViewModel;

  setUp(() {
    mockViewModel = MockSelectContactViewModel();
  });

  when(organizationService.getOrgMembersList("XYZ"))
      .thenAnswer((realInvocation) async {
    return users;
  });

  // when(() => organizationService.getOrgMembersList("XYZ")).thenAnswer(
  //     (_) async {
  //       await Future.delayed(const Duration(seconds: 2));
  //       return users;
  //     },
  //   );

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

  testWidgets('Select Contacts text is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(createApp());
    await tester.pump();
    expect(find.byType(Scaffold), findsOneWidget);

    await showSelectContactScreenByChatPage(tester);
    expect(find.text('Select Contacts'), findsOneWidget);
  });

  // testWidgets('renders app bar title correctly', (WidgetTester tester) async {
  //   // when(viewModel.orgMembersList).thenReturn(<User>[
  //   //   User(firstName: 'John', id: '1', image: 'avatar.png'),
  //   // ]);
  //   await tester.pumpWidget(MaterialApp(home: SelectContact()));

  //   final titleFinder = find.text('Select Contacts');
  //   expect(titleFinder, findsOneWidget);
  // });

  testWidgets('Displays app bar correctly', (WidgetTester tester) async {
    // when(viewModel.orgMembersList).thenReturn(<User>[
    //   User(firstName: 'John', id: '1', image: 'avatar.png'),
    // ]);
    await tester.pumpWidget(MaterialApp(home: SelectContact()));

    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
  });

  // testWidgets('renders list tiles correctly', (WidgetTester tester) async {
  //   // when(viewModel.orgMembersList).thenReturn(<>[
  //   //   User(firstName: 'John', id: '1', image: 'avatar.png'),
  //   //   User(firstName: 'Jane', id: '2', image: 'avatar.png'),
  //   // ]);

  //   await tester.pumpWidget(MaterialApp(home: SelectContact()));

  //   final firstTileFinder = find.text('John');
  //   expect(firstTileFinder, findsOneWidget);

  //   final secondTileFinder = find.text('Jane');
  //   expect(secondTileFinder, findsOneWidget);

  //   final avatarFinder = find.byType(CircleAvatar);
  //   expect(avatarFinder, findsNWidgets(2));
  // });

  // testWidgets(
  //     'should call initialise and getCurrentOrgUsersList on model ready',
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BaseView<SelectContactViewModel>(
  //         onModelReady: (model) {
  //           model.initialise();
  //           model.getCurrentOrgUsersList();
  //           mockViewModel;
  //         },
  //         //viewModel: mockViewModel,
  //         builder: (context, model, child) => SelectContact(),
  //       ),
  //     ),
  //   );

  //   verify(mockViewModel.initialise()).called(1);
  //   verify(mockViewModel.getCurrentOrgUsersList()).called(1);
  // });

  // testWidgets('should display a list of users', (WidgetTester tester) async {
  //   final users = [
  //     User(id: '1', firstName: 'John', image: 'image1'),
  //     User(id: '2', firstName: 'Jane', image: 'image2'),
  //   ];
  //   when(organizationService.getOrgMembersList("XYZ"))
  //       .thenAnswer((realInvocation) async {
  //     return users;
  //   });
  //   await tester.pumpWidget(createApp());
  //   await tester.pump();
  //   expect(find.byType(Scaffold), findsOneWidget);

  //   await showSelectContactScreenByChatPage(tester);
  //   expect(find.text('Select Contacts'), findsOneWidget);

  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: SelectContact(),
  //     ),
  //   );

  //   final user1 = find.text("John");
  //   final user2 = find.text("Jane");

  //   expect(user1, findsOneWidget);
  //   expect(user2, findsOneWidget);
  // });
}
