import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/post_modal.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
    registerServices();
  });

  tearDownAll(() => unregisterServices());

  group('PostBottomModalTest -', () {
    testWidgets('has a post widget', (tester) async {
      final post = Post(
        id: 'post2',
        caption: 'Test Caption',
        creator: User(id: 'test'), // Same as current user
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostBottomModal(
              post: post,
              deletePost: (_) => () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify the existence of PostBottomModal widget and reportPost button
      expect(find.byType(PostBottomModal), findsOneWidget);
      expect(find.byKey(const Key('reportPost')), findsOneWidget);

      // Tap the reportPost button and verify the behavior
      await tester.tap(find.byKey(const Key('reportPost')));
      await tester.pumpAndSettle();

      verify(
        navigationService.showTalawaErrorSnackBar(
          'Your Report has been sent to the Admin',
          MessageType.info,
        ),
      ).called(1);
    });

    testWidgets('shows delete button if post is by current user',
        (tester) async {
      bool deleteCalled = false;
      final currUserId = userConfig.currentUser.id;
      final post = Post(
        id: 'post2',
        caption: 'Test Caption',
        creator: User(id: currUserId), // Same as current user
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostBottomModal(
              post: post,
              deletePost: (_) => deleteCalled = true,
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('deletePost')), findsOneWidget);
      await tester.tap(find.byKey(const Key('deletePost')));
      await tester.pumpAndSettle();

      // Tap "Yes" on the AlertDialog
      await tester.tap(find.byKey(const Key('alert_dialog_yes_btn')));
      await tester.pumpAndSettle();

      expect(deleteCalled, isTrue);
    });

    testWidgets('does not show delete button if post is not by current user',
        (tester) async {
      final post = Post(
        id: 'post3',
        caption: 'Test Caption',
        creator: User(id: 'someone_else'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostBottomModal(post: post),
          ),
        ),
      );

      expect(find.byKey(const Key('deletePost')), findsNothing);
    });
    testWidgets("Testing `no` button of alertDialogBox", (tester) async {
      final currUserId = userConfig.currentUser.id;
      final post = Post(
        id: 'post2',
        caption: 'Test Caption',
        creator: User(id: currUserId), // Same as current user
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostBottomModal(
              post: post,
              deletePost: (_) => () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Tap the delete Post button and verify the behavior
      expect(find.byKey(const Key('deletePost')), findsOneWidget);
      await tester.tap(find.byKey(const Key('deletePost')));
      await tester.pumpAndSettle();

      // Verify the presence of AlertDialog and its no button
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.byKey(const Key('alert_dialog_no_btn')), findsOneWidget);

      // Tap the no button in AlertDialog and verify the behavior
      await tester.tap(find.byKey(const Key('alert_dialog_no_btn')));
      await tester.pumpAndSettle();

      // Verify that AlertDialog is dismissed
      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
