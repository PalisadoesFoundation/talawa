import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/view_model/widgets_view_models/interactions_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

void main() {
  setUp(() {
    testSetupLocator();
    registerServices();
  });

  tearDown(() {
    locator.reset();
    unregisterServices();
  });

  group('InteractionsViewModel Tests', () {
    test('toggleUpVotePost - should upvote when not voted', () async {
      // Arrange
      final model = InteractionsViewModel();
      final post = Post(
        id: 'test_post_id',
        hasVoted: false,
        upvotesCount: 5,
      );

      // Act
      await model.toggleUpVotePost(post);

      // Assert
      expect(post.hasVoted, true);
      expect(post.upvotesCount, 6);
    });

    test('toggleUpVotePost - should remove upvote when already voted',
        () async {
      // Arrange
      final model = InteractionsViewModel();
      final post = Post(
        id: 'test_post_id',
        hasVoted: true,
        upvotesCount: 5,
      );

      // Act
      await model.toggleUpVotePost(post);

      // Assert
      expect(post.hasVoted, false);
      expect(post.upvotesCount, 4);
    });
  });
}
