import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/post_provider.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/newsfeed/newsfeed.dart';
import 'package:talawa/views/widgets/custom_appbar.dart';
import 'package:talawa/views/widgets/loading.dart';

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
        ChangeNotifierProvider<PostProvider>(
          create: (_) => PostProvider(),
        ),
      ],
      child: const MaterialApp(
        home: NewsFeed(
          isTest: true,
        ),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group("News Feed Tests", () {
    testWidgets("Testing if newsfeed Page shows up", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(newsfeedPage());

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

      //get [add post fab]
      final addPostFab = find.byType(FloatingActionButton);

      //finds [add post fab]
      expect(addPostFab, findsOneWidget);
    });

    testWidgets("tapping add post fab opens add post screen", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(newsfeedPage());

        //get [add post fab]
        final addPostFab = find.byType(FloatingActionButton);

        //finds [add post fab]
        expect(addPostFab, findsOneWidget);

        //tap on the [add post fab]
        await tester.tap(addPostFab);
        await tester.pumpAndSettle();

        //Finds [Add Post] screen
        expect(find.byKey(const Key('ADD_POST_APP_BAR')), findsOneWidget);
        //Finds the form on [Add Post] screen
        expect(find.byType(Form), findsOneWidget);
      });
    });
  });
}
