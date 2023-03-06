// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/widgets/post_list_widget.dart';

import '../../helpers/test_helpers.dart';

void main() {
  const Key postListKey = Key("postListKey");

  Widget createPostListWidget(List<Post> postlist) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      themeMode: ThemeMode.light,
      theme: TalawaTheme.lightTheme,
      home: Scaffold(
        body: PostListWidget(
          posts: postlist,
          key: postListKey,
        ),
      ),
    );
  }

  group("Post List Widget Test-", () {
    setUp(() {
      registerServices();
      locator.registerFactory(() => LikeButtonViewModel());
    });

    tearDown(() {
      unregisterServices();
      locator.unregister<LikeButtonViewModel>();
    });

    testWidgets("Test if PostList Widget is displayed ",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createPostListWidget([]));
        await tester.pump();
        final postListFinder = find.byKey(postListKey);
        expect(postListFinder, findsOneWidget);
      });
    });

    testWidgets("Test if PostList Widget is not scrollable",
        (WidgetTester tester) async {
      final mockPost1 = getPostMockModel(description: "MockPost1");
      final mockPost2 = getPostMockModel(description: "MockPost2");

      final List<Post> postList = [mockPost1, mockPost2];
      //Extremely large screen to test if scrolling takes place
      tester.binding.window.physicalSizeTestValue = const Size(1000, 1000);
      await tester.runAsync(() async {
        await tester.pumpWidget(createPostListWidget(postList));
        await tester.pump();
        //Attempt to scroll
        await tester.drag(find.byType(ListView), const Offset(0, -800));
        await tester.pump();
        // First post in list should still be visible as scrolling is disabled
        expect(find.text(mockPost1.description!), findsOneWidget);
      });
    });
  });
}
