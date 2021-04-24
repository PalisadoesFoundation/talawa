// Packages imports.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/newsfeed/newsfeed.dart';

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
      ],
      child: const MaterialApp(
        home: NewsFeed(),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group("News Feed Tests", () {
    testWidgets("Testing if newsfeed Page shows up", (tester) async {
      await tester.pumpWidget(newsfeedPage());

      /// Verify if [Newsfeed Page] shows up.
      expect(
        find.byType(Column),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of Newsfeed in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(newsfeedPage());

      /// Verify if [News Article Page] shows up.
      expect(
        find.byType(Column),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of Newsfeed in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(newsfeedPage());

      /// Verify if [Newsfeed Page] shows up.
      expect(
        find.byType(Column),
        findsOneWidget,
      );
    });

    testWidgets("empty newsfeed for user with no org", (tester) async {
      await tester.pumpWidget(newsfeedPage());

      final emptyTextWidget = find.byKey(const Key('empty_newsfeed_text'));

      expect(emptyTextWidget, findsOneWidget);

      // get the fab button
      final addPostButton = find.byIcon(Icons.add);
      expect(
        addPostButton,
        findsNothing,
      );
    });
  });
}
