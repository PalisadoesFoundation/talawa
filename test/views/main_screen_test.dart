// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
// import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
// import 'package:talawa/views/after_auth_screens/add_post_page.dart';
// import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
// import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
// import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/views/main_screen.dart';
// import 'package:talawa/widgets/custom_drawer.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

Widget createMainScreen() {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return BaseView<AppTheme>(
        onModelReady: (model) => model.initialize(),
        builder: (context, themeModel, child) {
          return MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: [
              const AppLocalizationsDelegate(isTest: true),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            key: const Key('Root'),
            theme: Provider.of<AppTheme>(context, listen: true).isdarkTheme
                ? TalawaTheme.darkTheme
                : TalawaTheme.lightTheme,
            home: Scaffold(
              body: MainScreen(
                mainScreenArgs: MainScreenArgs(
                  fromSignUp: false,
                  mainScreenIndex: 0,
                ),
              ),
            ),
            navigatorKey: locator<NavigationService>().navigatorKey,
            onGenerateRoute: router.generateRoute,
          );
        },
      );
    },
  );
}

void main() async {
  testSetupLocator();
  registerServices();

  TestWidgetsFlutterBinding.ensureInitialized();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();

  final Directory dir = Directory('temporaryPath');
  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());

  await Hive.openBox<User>('currentUser');
  await Hive.openBox<OrgInfo>('currentOrg');

  await Hive.openBox('pluginBox');
  await Hive.openBox('url');

  late GraphQLClient graphQLClient;

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();

    graphQLClient = locator<GraphQLClient>();
    when(
      graphQLClient.query(
        QueryOptions(
          document: gql(queries.getPluginsList()),
        ),
      ),
    ).thenAnswer(
      (realInvocation) async {
        return QueryResult.internal(
          source: QueryResultSource.network,
          parserFn: (data) => {},
          data: {
            "getPlugins": [],
          },
        );
      },
    );
  });

  tearDown(() {
    unregisterServices();
  });

  group("Test for main_screen.dart", () {
    // testWidgets("Check if MainScreen shows up", (tester) async {
    //   await tester.pumpWidget(createMainScreen());
    //   await tester.pump();
    //
    //   // Don't call pumpAndSettle as the BottomNavigationBar
    //   // of this widget builds itself repeatedly, causing an infinite
    //   // loop; making the test never stop
    //
    //   // await tester.pumpAndSettle();
    //
    //   expect(find.byType(MainScreen), findsOneWidget);
    // });
    //
    // testWidgets("Check if all children shows up", (tester) async {
    //   // This stub shows its effect in the next test
    //
    //   when(
    //     graphQLClient.query(
    //       QueryOptions(
    //         document: gql(queries.getPluginsList()),
    //       ),
    //     ),
    //   ).thenAnswer(
    //     (realInvocation) async {
    //       return QueryResult.internal(
    //         source: QueryResultSource.network,
    //         parserFn: (data) => {},
    //         data: {
    //           "getPlugins": null,
    //         },
    //       );
    //     },
    //   );
    //
    //   await tester.pumpWidget(createMainScreen());
    //   await tester.pump();
    //
    //   expect(
    //     find.byWidgetPredicate(
    //       (widget) =>
    //           widget is Scaffold &&
    //           widget.drawer is CustomDrawer &&
    //           widget.body is IndexedStack &&
    //           widget.bottomNavigationBar is BottomNavigationBar,
    //     ),
    //     findsOneWidget,
    //   );
    //
    //   expect(find.byIcon(Icons.home), findsOneWidget);
    //   expect(find.byIcon(Icons.event_note), findsOneWidget);
    //   expect(find.byIcon(Icons.add_box), findsOneWidget);
    //   expect(find.byIcon(Icons.chat_outlined), findsOneWidget);
    //   expect(find.byIcon(Icons.account_circle), findsOneWidget);
    //
    //   expect(find.byType(OrganizationFeed), findsOneWidget);
    //   expect(find.byType(ExploreEvents), findsOneWidget);
    //   expect(find.byType(AddPost), findsOneWidget);
    //   expect(find.byType(ProfilePage), findsOneWidget);
    // });
    //
    // testWidgets("Check if plugin loading works", (tester) async {
    //   mockNetworkImages(() async {
    //     await tester.pumpWidget(createMainScreen());
    //     await tester.pump();
    //
    //     expect(find.byIcon(Icons.home), findsOneWidget);
    //     expect(find.byIcon(Icons.event_note), findsOneWidget);
    //     expect(find.byIcon(Icons.add_box), findsOneWidget);
    //     expect(find.byIcon(Icons.chat_outlined), findsOneWidget);
    //     expect(find.byIcon(Icons.account_circle), findsOneWidget);
    //
    //     expect(find.byType(OrganizationFeed), findsOneWidget);
    //     expect(find.byType(ExploreEvents), findsOneWidget);
    //     expect(find.byType(AddPost), findsOneWidget);
    //     expect(find.byType(ProfilePage), findsOneWidget);
    //
    //     // If MainScreen finds some plugins, it will add them dynamically
    //
    //     // expect(find.byType(ChangeThemeTile), findsOneWidget);
    //   });
    // });
    //
    // testWidgets("Check if changing pages works", (tester) async {
    //   mockNetworkImages(() async {
    //     await tester.pumpWidget(createMainScreen());
    //     await tester.pump();
    //
    //     await tester.tap(find.byIcon(Icons.home));
    //     await tester.pump();
    //     expect(mainScreenViewModel.currentPageIndex, 0);
    //
    //     await tester.tap(find.byIcon(Icons.event_note));
    //     await tester.pump();
    //     // expect(mainScreenViewModel.currentIndex, 1);
    //
    //     await tester.tap(find.byIcon(Icons.add_box));
    //     await tester.pump();
    //     // expect(mainScreenViewModel.currentIndex, 2);
    //
    //     await tester.tap(find.byIcon(Icons.chat_outlined));
    //     await tester.pump();
    //     // expect(mainScreenViewModel.currentIndex, 3);
    //
    //     await tester.tap(find.byIcon(Icons.account_circle));
    //     await tester.pump();
    //     // expect(mainScreenViewModel.currentIndex, 4);
    //   });
    // });
  });
}
