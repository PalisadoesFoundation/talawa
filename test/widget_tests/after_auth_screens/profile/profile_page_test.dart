import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';
import '../feed/individual_post_test.dart';

// ... (other imports)

/// a_line_ending_with_end_punctuation.
///
/// more_info_if_required
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  SizeConfig().test();
  testSetupLocator();

  setUp(() {
    registerServices();
  });

  group('Test for likedUserCircleAvatar', () {
    testWidgets('Check if the likedUserCircleAvatar shows up', (tester) async {
      await tester.pumpWidget(createLikedUserCircleAvatarWidget());
      await tester.pump();

      final findStack = find.byType(Stack);

      expect(findStack, findsNWidgets(2));
    });
  });

  group('Test for IndividualPageLikeSection', () {
    testWidgets('Check if the IndividualPageLikeSection shows up',
        (tester) async {
      await tester.pumpWidget(createIndividualPageLikeSectionWidget());
      await tester.pump();

      final findColumn = find.byType(Column);

      expect(findColumn, findsNWidgets(1));
    });

    testWidgets(
        'Check if the likedUserCircleAvatar in IndividualPageLikeSection shows up',
        (tester) async {
      await tester.pumpWidget(createIndividualPageLikeSectionWidget());
      await tester.pump();

      final findStack = find.byType(Stack);

      expect(findStack, findsNWidgets(5));
    });
  });

  group('Test for CommentTemplate', () {
    testWidgets('Check if the CommentTemplate shows up', (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.byType(Row);

      expect(findStack, findsNWidgets(1));
    });

    testWidgets('Check if the name is displayed in CommentTemplate',
        (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.text('Ayush Chaudhary');

      expect(findStack, findsNWidgets(1));
    });

    testWidgets('Check if the comment text is displayed in CommentTemplate',
        (tester) async {
      await tester.pumpWidget(createCommentTemplateWidget());
      await tester.pump();

      final findStack = find.text('test text');

      expect(findStack, findsNWidgets(1));
    });
  });

  // Add more test groups for other widgets

  // group('Individualpostview tests', () {
  //   testWidgets("Check if the IndividualPostView shows up", (WidgetTester tester) async {
  //     // ... (your existing test code)
  //   });
  // });
}
