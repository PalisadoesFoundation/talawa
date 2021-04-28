// Packages imports.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/controllers/post_controller.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/pages/newsfeed/news_article.dart';

Widget newsArticlePage() => MultiProvider(
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
        ChangeNotifierProvider<PostController>(
          create: (_) => PostController(),
        ),
        ChangeNotifierProvider<CommentHandler>(
          create: (_) => CommentHandler(),
        ),
      ],
      child: MaterialApp(
        home: Builder(
          builder: (ctx) {
            SizeConfig().init(ctx);
            return const NewsArticle(
              index: 0,
              post: {
                '_id': '605259ecb1257f67811d7ae3',
                'text': 'ndlnldwnl',
                'title': 'naanlls'
              },
            );
          },
        ),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group("News Article Tests", () {
    testWidgets("Testing if newsArticle Page shows up", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(newsArticlePage());

        /// Verify if [News Article Page] shows up.

        expect(
          find.byType(TextField),
          findsOneWidget,
        );
      });
    });

    testWidgets("Testing overflow of New Article in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(newsArticlePage());

        /// Verify if [News Article Page] shows up.
        expect(
          find.byType(TextField),
          findsOneWidget,
        );
      });
    });

    testWidgets("Testing overflow of New Article in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(newsArticlePage());

        /// Verify if [News Article Page] shows up.
        expect(
          find.byType(TextField),
          findsOneWidget,
        );
      });
    });

    testWidgets("Load Comments Button is working", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(newsArticlePage());

        // Get the Load Comment button.
        final loadCommentsButton = find.text("Load Comments");

        // Tap on the loadCommentsButton.
        await tester.tap(loadCommentsButton);
        await tester.pump();

        // Comments Icon Should be displayed.
        const iconKey = ValueKey('commentIcon');

        expect(
          find.byKey(iconKey),
          findsWidgets,
        );
      });
    });
  });

  testWidgets("Check if Leave a Comments Button is Working",
      (WidgetTester tester) async {
    //find all the widget needed

    final leaveCommentTextField =
        find.byKey(const ValueKey('leaveCommentField'));
    final leaveCommentButton = find.byKey(const ValueKey('leaveCommentButton'));

    //execute the test
    await tester.pumpWidget(newsArticlePage());
    await tester.enterText(leaveCommentTextField, "hello how are you");
    await tester.tap(leaveCommentButton);
    await tester.pump();

    //check output
    expect(find.text("hello how are you"), findsOneWidget);
  });
}
