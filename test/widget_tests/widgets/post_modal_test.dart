import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/post_modal.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockFunction extends Mock {
  void call(Post post);
}

class MockNavigationService extends Mock implements NavigationService {}

final MockFunction mockDeletePost = MockFunction();
final LikedBy user = LikedBy(sId: "test_id");

final u1 = User(
  id: '123',
  firstName: 'Lakshay',
  lastName: 'Gupta',
  email: 'test@test.com',
);
final u2 = User(
  id: '123',
  firstName: 'Ankit',
  lastName: 'Varshney',
  email: 'test@test.com',
);
final List<User> users = [u1, u2];
List<Comments> comments = [
  Comments(sId: 'comment1'),
  Comments(sId: 'comment2'),
  Comments(sId: 'comment3'),
  Comments(sId: 'comment4'),
  Comments(sId: 'comment5'),
  Comments(sId: 'comment6'),
];
final comment = Comment(
  creator: User(
    id: '123',
    firstName: 'Ankit',
    lastName: 'Varshney',
    email: 'test@test.com',
  ),
  createdAt: '123456',
  text: 'test text',
  post: 'test post',
  likeCount: 'test count',
);

final LikedBy l1 = LikedBy(sId: 'test1');
final LikedBy l2 = LikedBy(sId: 'test2');
final List<LikedBy> likeby = [l1, l2];

final comment1 = Comments(sId: 'comment1');
final comment2 = Comments(sId: 'comment2');
final comment3 = Comments(sId: 'comment3');
final List<Comments> comments1 = [comment1, comment2, comment3];

final myBirthday = DateTime.utc(2004, DateTime.june, 16, 5, 30, 0, 0, 0);
final post = Post(
  creator: User(
    id: '123',
    firstName: 'John',
    lastName: 'Doe',
    email: 'test@test.com',
  ),
  sId: "sid",
  createdAt: myBirthday,
  description: 'test description',
  organization: OrgInfo(admins: users),
  likedBy: likeby,
  comments: comments1,
);
Widget createPostBottomModal() {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: PostBottomModal(
          post: post,
          deletePost: mockDeletePost,
        ),
        navigatorKey: navigationService.navigatorKey,
      );
    },
  );
}

void main() {
  SizeConfig().test();
  testSetupLocator();

  setUp(() {
    registerServices();
  });
  tearDown(() => unregisterServices());

  group('PostBottomModalTest -', () {
    testWidgets('has a post widget', (tester) async {
      await tester.pumpWidget(createPostBottomModal());
      await tester.pumpAndSettle();

      expect(find.byType(PostBottomModal), findsOneWidget);
      expect(find.byKey(const Key('reportPost')), findsOneWidget);

      await tester.tap(find.byKey(const Key('reportPost')));
      await tester.pumpAndSettle();
      verify(
        navigationService.showTalawaErrorSnackBar(
          'Your Report has been sent to the Admin',
          MessageType.info,
        ),
      ).called(1);
    });
    testWidgets('Testing the delete Post button', (WidgetTester tester) async {
      await tester.pumpWidget(createPostBottomModal());
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.delete), findsOneWidget);
      expect(find.byKey(const Key("deletePost")), findsOneWidget);
      await tester.tap(find.byKey(const Key("deletePost")));
      await tester.pumpAndSettle();

      verify(mockDeletePost.call(post)).called(1);

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.byKey(const Key("yes")), findsOneWidget);
      expect(find.text("The post was deleted"), findsOneWidget);

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("yes")));
      await tester.pumpAndSettle();

      verify(
        navigationService.showTalawaErrorSnackBar(
          'Post was deleted if you had the rights!',
          MessageType.info,
        ),
      ).called(1);
    });
    testWidgets("Testing no button of alertDialogBox",
        (WidgetTester tester) async {
      await tester.pumpWidget(createPostBottomModal());
      await tester.pumpAndSettle();
      expect(find.byKey(const Key("deletePost")), findsOneWidget);
      await tester.tap(find.byKey(const Key("deletePost")));
      await tester.pumpAndSettle();

      verify(mockDeletePost.call(post)).called(1);

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.byKey(const Key('no')), findsOneWidget);
      await tester.tap(find.byKey(const Key("no")));
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
