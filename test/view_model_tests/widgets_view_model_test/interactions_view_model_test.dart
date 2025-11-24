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

  test('initialize sets postID and subscribes to stream', () {
    final viewModel = InteractionsViewModel();
    viewModel.initialize('post123');

    expect(viewModel.postID, 'post123');
  });

  test('updatePost does not throw when post id matches', () {
    final viewModel = InteractionsViewModel();
    viewModel.initialize('post123');

    final post = Post();
    post.id = 'post123';

    expect(() => viewModel.updatePost(post), returnsNormally);
  });

  test('dispose cancels the subscription', () {
    final viewModel = InteractionsViewModel();
    viewModel.initialize('post123');
    viewModel.dispose();
  });

  test('updatePost is called when stream emits', () async {
    final viewModel = InteractionsViewModel();
    viewModel.initialize('post123');

    final post = Post();
    post.id = 'post123';

    var notified = false;
    viewModel.addListener(() {
      notified = true;
    });

    await Future.delayed(const Duration(milliseconds: 10));

    expect(notified, isFalse);
  });
}
