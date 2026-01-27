// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/view_model/widgets_view_models/comment_interactions_view_model.dart';
import 'package:talawa/widgets/comment_interactions.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';
import 'golden_test_helpers.dart';

class MockCommentInteractionsViewModel extends Mock
    implements CommentInteractionsViewModel {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => setUpGoldenTests());
  tearDownAll(() => tearDownGoldenTests());

  setUp(() async {
    await locator.reset();
    registerServices();
    registerViewModels();

    // Register our mock
    if (locator.isRegistered<CommentInteractionsViewModel>()) {
      locator.unregister<CommentInteractionsViewModel>();
    }
    locator.registerFactory<CommentInteractionsViewModel>(
        () => MockCommentInteractionsViewModel());
  });

  Widget createInteractionsForGolden({
    required ThemeMode themeMode,
    required Comment comment,
  }) {
    return themedWidget(
      Center(
        child: CommentInteractions(
          comment: comment,
        ),
      ),
      themeMode: themeMode,
    );
  }

  group('CommentInteractions Golden Tests', () {
    testWidgets('comment_interactions default state - light theme',
        (WidgetTester tester) async {
      final comment = Comment(
        id: '1',
        upvotesCount: 0,
        downvotesCount: 0,
        hasVoted: false,
        voteType: VoteType.none,
      );

      await tester.pumpWidget(
        createInteractionsForGolden(
          themeMode: ThemeMode.light,
          comment: comment,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('comment_interactions', 'default', 'light'),
        ),
      );
    });

    testWidgets('comment_interactions default state - dark theme',
        (WidgetTester tester) async {
      final comment = Comment(
        id: '1',
        upvotesCount: 0,
        downvotesCount: 0,
        hasVoted: false,
        voteType: VoteType.none,
      );

      await tester.pumpWidget(
        createInteractionsForGolden(
          themeMode: ThemeMode.dark,
          comment: comment,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('comment_interactions', 'default', 'dark'),
        ),
      );
    });

    testWidgets('comment_interactions upvoted - light theme',
        (WidgetTester tester) async {
      final comment = Comment(
        id: '1',
        upvotesCount: 1,
        downvotesCount: 0,
        hasVoted: true,
        voteType: VoteType.upVote,
      );

      await tester.pumpWidget(
        createInteractionsForGolden(
          themeMode: ThemeMode.light,
          comment: comment,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('comment_interactions', 'upvoted', 'light'),
        ),
      );
    });

    testWidgets('comment_interactions upvoted - dark theme',
        (WidgetTester tester) async {
      final comment = Comment(
        id: '1',
        upvotesCount: 1,
        downvotesCount: 0,
        hasVoted: true,
        voteType: VoteType.upVote,
      );

      await tester.pumpWidget(
        createInteractionsForGolden(
          themeMode: ThemeMode.dark,
          comment: comment,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('comment_interactions', 'upvoted', 'dark'),
        ),
      );
    });

    testWidgets('comment_interactions downvoted - light theme',
        (WidgetTester tester) async {
      final comment = Comment(
        id: '1',
        upvotesCount: 0,
        downvotesCount: 1,
        hasVoted: true,
        voteType: VoteType.downVote,
      );

      await tester.pumpWidget(
        createInteractionsForGolden(
          themeMode: ThemeMode.light,
          comment: comment,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('comment_interactions', 'downvoted', 'light'),
        ),
      );
    });

    testWidgets('comment_interactions downvoted - dark theme',
        (WidgetTester tester) async {
      final comment = Comment(
        id: '1',
        upvotesCount: 0,
        downvotesCount: 1,
        hasVoted: true,
        voteType: VoteType.downVote,
      );

      await tester.pumpWidget(
        createInteractionsForGolden(
          themeMode: ThemeMode.dark,
          comment: comment,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('comment_interactions', 'downvoted', 'dark'),
        ),
      );
    });

    testWidgets('comment_interactions high counts - light theme',
        (WidgetTester tester) async {
      final comment = Comment(
        id: '1',
        upvotesCount: 999,
        downvotesCount: 500,
        hasVoted: false,
        voteType: VoteType.none,
      );

      await tester.pumpWidget(
        createInteractionsForGolden(
          themeMode: ThemeMode.light,
          comment: comment,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('comment_interactions', 'high_counts', 'light'),
        ),
      );
    });

    testWidgets('comment_interactions high counts - dark theme',
        (WidgetTester tester) async {
      final comment = Comment(
        id: '1',
        upvotesCount: 999,
        downvotesCount: 500,
        hasVoted: false,
        voteType: VoteType.none,
      );

      await tester.pumpWidget(
        createInteractionsForGolden(
          themeMode: ThemeMode.dark,
          comment: comment,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('comment_interactions', 'high_counts', 'dark'),
        ),
      );
    });

    testWidgets('comment_interactions null counts - light theme',
        (WidgetTester tester) async {
      final comment = Comment(
        id: '1',
        upvotesCount: null,
        downvotesCount: null,
        hasVoted: false,
        voteType: VoteType.none,
      );

      await tester.pumpWidget(
        createInteractionsForGolden(
          themeMode: ThemeMode.light,
          comment: comment,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('comment_interactions', 'null_counts', 'light'),
        ),
      );
    });

    testWidgets('comment_interactions null counts - dark theme',
        (WidgetTester tester) async {
      final comment = Comment(
        id: '1',
        upvotesCount: null,
        downvotesCount: null,
        hasVoted: false,
        voteType: VoteType.none,
      );

      await tester.pumpWidget(
        createInteractionsForGolden(
          themeMode: ThemeMode.dark,
          comment: comment,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('comment_interactions', 'null_counts', 'dark'),
        ),
      );
    });
  });
}
