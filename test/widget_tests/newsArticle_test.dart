// Packages imports.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/views/pages/newsfeed/newsArticle.dart';

Widget NewsArticlePage() => MultiProvider(
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
      child: MaterialApp(
        home: NewsArticle(
          post: {
            '_id': '605259ecb1257f67811d7ae3',
            'text': 'ndlnldwnl',
            'title': 'naanlls'
          },
        ),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  // Function for ignoring overflow errors.
  Function onErrorIgnoreOverflowErrors = (
    FlutterErrorDetails details, {
    bool forceReport = false,
  }) {
    assert(details != null);
    assert(details.exception != null);

    bool ifIsOverflowError = false;

    // Detect overflow error.
    var exception = details.exception;
    if (exception is FlutterError)
      ifIsOverflowError = !exception.diagnostics.any(
        (e) => e.value.toString().startsWith(
              "A RenderFlex overflowed by",
            ),
      );

    // Ignore if is overflow error.
    if (ifIsOverflowError) {
      print("Over flow error");
    }

    // Throw other errors.
    else {
      FlutterError.dumpErrorToConsole(
        details,
        forceReport: forceReport,
      );
    }
  };
  group("News Article Tests", () {
    testWidgets("Testing if newsArticle Page shows up", (tester) async {
      await tester.pumpWidget(NewsArticlePage());

      /// Verify if [News Article Page] shows up.

      expect(
        find.byType(TextField),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of New Article in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(NewsArticlePage());

      /// Verify if [News Article Page] shows up.
      expect(
        find.byType(TextField),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of New Article in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(NewsArticlePage());

      /// Verify if [News Article Page] shows up.
      expect(
        find.byType(TextField),
        findsOneWidget,
      );
    });

    testWidgets("Load Comments Button is working", (tester) async {
      await tester.pumpWidget(NewsArticlePage());

      // Get the Load Comment button.
      var loadCommentsButton = find.text("Load Comments");

      // Tap on the loadCommentsButton.
      await tester.tap(loadCommentsButton);
      await tester.pumpAndSettle();

      // Comments Icon Should be displayed.
      final icon_key = ValueKey('commentIcon');

      expect(
        find.byKey(icon_key),
        findsWidgets,
      );
    });
  });
}
