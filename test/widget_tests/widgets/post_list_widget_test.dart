import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/widgets/post_list_widget.dart';

import '../../helpers/test_helpers.dart';

void main() {
  const Key postkey = Key("postListKey");

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
          key: postkey,
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
      final post = getPostMockModel();
      await tester.pumpWidget(createPostListWidget([post, post]));
      await tester.pump();
      final p = find.byKey(postkey);
      expect(p, findsOneWidget);
    });
  });
}
