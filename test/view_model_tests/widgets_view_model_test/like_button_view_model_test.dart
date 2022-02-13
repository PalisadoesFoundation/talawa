import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

void main() {
  registerServices();

  final List<LikedBy> _likedBy = [
    LikedBy(sId: 'Test user 1'),
    LikedBy(sId: 'Test user 2')
  ];

  final post = Post(
    sId: "test_post_id",
    creator: userConfig.currentUser,
    likedBy: _likedBy,
  );

  group("Tests for login_button_view_model", () {
    test("Testing setIsLiked", () {
      final model = LikeButtonViewModel();
      model.initialize(_likedBy, 'Test post_id');
      model.setIsLiked();
      expect(model.isLiked, true);
    });
    test(
        'Testing checkAndSetTheIsLiked function when user is not present in likedby',
        () {
      final model = LikeButtonViewModel();
      model.initialize(_likedBy, 'Test post_id');
      model.checkAndSetTheIsLiked();
      expect(model.isLiked, false);
    });

    test(
        'Testing checkAndSetTheIsLiked function when user is present in likedby',
        () {
      final model = LikeButtonViewModel();
      _likedBy.add(LikedBy(sId: userConfig.currentUser.id));
      model.initialize(_likedBy, 'Test post_id');
      model.checkAndSetTheIsLiked();
      expect(model.isLiked, true);
      _likedBy.removeWhere((element) => element.sId == userConfig.currentUser.id);
    });

    test("testing toggleIsLiked", () {
      final model = LikeButtonViewModel();
      model.initialize(_likedBy, post.sId);
      model.setIsLiked(val: false);
      expect(model.isLiked, false);
      final LikedBy likedBy = LikedBy(
        sId: userConfig.currentUser.id,
      );
      when(postService.addLike(post.sId)).thenAnswer((realInvocation) async {
        model.likedBy.add(likedBy);
      });
      model.toggleIsLiked();
      expect(model.likedBy.length, 3);
      model.setIsLiked(val: true);
      when(postService.removeLike(post.sId)).thenAnswer((realInvocation) async {
        model.likedBy
            .removeWhere((element) => element.sId == userConfig.currentUser.id);
      });
      model.toggleIsLiked();
      expect(model.likedBy.length, 2);
      expect(model.likedBy.contains(likedBy), false);
    });

    test("Testing updatePost", () {
      final model = LikeButtonViewModel();
      model.initialize(_likedBy, post.sId);
      final Post newPost = Post(
          sId: "new_post_id", creator: userConfig.currentUser, likedBy: []);
      // with different post
      model.updatePost(newPost);
      expect(model.likedBy.length, 2);

      final LikedBy likedBy3 = LikedBy(sId: "Test user 3");
      post.likedBy!.add(likedBy3);
      // with same post
      model.updatePost(post);
      expect(model.likedBy.length, 3);
      expect(model.likedBy.contains(likedBy3), true);
    });
  });
}
