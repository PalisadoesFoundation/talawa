import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talawa/services/app_localization.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/groups_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/controllers/news_feed_controller.dart';
import 'package:talawa/controllers/post_controller.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/pages/newsfeed/newsfeed.dart';
import 'package:talawa/views/widgets/custom_appbar.dart';
import 'package:talawa/router.dart' as router;

Widget newsfeedPage() => MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
          create: (_) => GraphQLConfiguration(),
        ),
        ChangeNotifierProvider<OrgController>(
          create: (_) => OrgController(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<Preferences>(
          create: (_) => Preferences(),
        ),
        ChangeNotifierProvider<NewsFeedProvider>(
          create: (_) => NewsFeedProvider(),
        ),
        ChangeNotifierProvider<GroupController>(
          create: (_) => GroupController(),
        ),
        ChangeNotifierProvider<PostController>(
          create: (_) => PostController(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Builder(
          builder: (ctx) {
            SizeConfig().init(ctx);
            return const NewsFeed();
          },
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;
  setupLocator();

  group("News Feed Tests", () {
    testWidgets("Testing if newsfeed Page shows up", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(newsfeedPage());
        await tester.pump();

        /// Verify if [Newsfeed Page] shows up.
        expect(
          find.byKey(const Key('NEWSFEED_APP_BAR')),
          findsOneWidget,
        );

        expect(
          find.byType(Scaffold),
          findsOneWidget,
        );

        expect(
          find.byType(CustomAppBar),
          findsOneWidget,
        );
      });
    });

    testWidgets("Testing overflow of Newsfeed in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(newsfeedPage());
        await tester.pump();

        /// Verify if [News Article Page] shows up.
        expect(
          find.byKey(const Key('NEWSFEED_APP_BAR')),
          findsOneWidget,
        );

        expect(
          find.byType(Scaffold),
          findsOneWidget,
        );

        expect(
          find.byType(CustomAppBar),
          findsOneWidget,
        );
      });
    });

    testWidgets("Testing overflow of Newsfeed in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(newsfeedPage());
        await tester.pump();

        /// Verify if [Newsfeed Page] shows up.
        expect(
          find.byKey(const Key('NEWSFEED_APP_BAR')),
          findsOneWidget,
        );

        expect(
          find.byType(Scaffold),
          findsOneWidget,
        );

        expect(
          find.byType(CustomAppBar),
          findsOneWidget,
        );
      });
    });

    testWidgets("finds add post fab", (tester) async {
      await tester.pumpWidget(newsfeedPage());
      await tester.pump();

      //get [add post fab]
      final addPostFab = find.byType(FloatingActionButton);

      //finds [add post fab]
      expect(addPostFab, findsOneWidget);
    });

    testWidgets("tapping add post fab opens add post screen", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(newsfeedPage());
        await tester.pump();

        //get [add post fab]
        final addPostFab = find.byType(FloatingActionButton);

        //finds [add post fab]
        expect(addPostFab, findsOneWidget);

        //Finds [Add Post] screen
        expect(find.byKey(const Key('NEWSFEED_APP_BAR')), findsOneWidget);

        //tap on the [add post fab]
        await tester.tap(addPostFab);
        await tester.pumpAndSettle();

        //Finds the form on [Add Post] screen
        expect(find.byType(Form), findsOneWidget);
      });
    });
  });
}
