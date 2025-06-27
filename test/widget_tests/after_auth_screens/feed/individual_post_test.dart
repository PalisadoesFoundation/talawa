// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/comments_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/individual_post.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

final u1 = User(
  id: '123',
  firstName: 'John',
  lastName: 'Doe',
  email: 'test@test.com',
);
final u2 = User(
  id: '123',
  firstName: 'Ayush',
  lastName: 'Chaudhary',
  email: 'test@test.com',
);
final List<User> users = [u1, u2];

final myBirthday = DateTime.utc(2004, DateTime.june, 16, 5, 30, 0, 0, 0);
final post = Post(
  creator: User(
    id: '123',
    firstName: 'John',
    lastName: 'Doe',
    email: 'test@test.com',
  ),
  id: "sid",
  createdAt: myBirthday,
  caption: 'test description',
  organization: OrgInfo(admins: users),
);

final comment = Comment(
  creator: User(
    id: '123',
    firstName: 'Ayush',
    lastName: 'Chaudhary',
    email: 'test@test.com',
  ),
  createdAt: '123456',
  body: 'test text',
);

Widget createCommentTemplateWidget({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
    navigatorObservers: [],
    locale: const Locale('en'),
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('es', 'ES'),
      const Locale('fr', 'FR'),
      const Locale('hi', 'IN'),
      const Locale('zh', 'CN'),
      const Locale('de', 'DE'),
      const Locale('ja', 'JP'),
      const Locale('pt', 'PT'),
    ],
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: CommentTemplate(
        comment: comment,
      ),
    ),
  );
}

Widget createIndividualPostCommentSectionWidget({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
    navigatorObservers: [],
    locale: const Locale('en'),
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('es', 'ES'),
      const Locale('fr', 'FR'),
      const Locale('hi', 'IN'),
      const Locale('zh', 'CN'),
      const Locale('de', 'DE'),
      const Locale('ja', 'JP'),
      const Locale('pt', 'PT'),
    ],
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: IndividualPostCommentSection(
        postID: 'test  post id',
        model: CommentsViewModel(),
      ),
    ),
  );
}

Widget createIndividualPostViewWidget({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
  required Post post1,
}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
    navigatorObservers: [],
    locale: const Locale('en'),
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('es', 'ES'),
      const Locale('fr', 'FR'),
      const Locale('hi', 'IN'),
      const Locale('zh', 'CN'),
      const Locale('de', 'DE'),
      const Locale('ja', 'JP'),
      const Locale('pt', 'PT'),
    ],
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: IndividualPostView(
        post: post1,
      ),
    ),
  );
}

void main() {
  // locator.registerSingleton(LikeButtonViewModel());

  setUpAll(() {
    SizeConfig().test();
    testSetupLocator();
    registerServices();
  });

  group('Test for CommentTemplate', () {
    testWidgets('Check if the CommentTemplate shows up', (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.byType(Row);

      expect(findStack, findsNWidgets(1));
    });

    testWidgets('Check if the name is displayed in CommentTemplate ',
        (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.text('Ayush Chaudhary');

      expect(findStack, findsNWidgets(1));
    });

    testWidgets('Check if the comment text is displayed in CommentTemplate ',
        (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.text('test text');

      expect(findStack, findsNWidgets(1));
    });
  });
}
