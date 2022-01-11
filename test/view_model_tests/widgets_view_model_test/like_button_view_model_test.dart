import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

void main() {
  registerServices();
  final model = LikeButtonViewModel();
  final List<LikedBy> _likedBy = [
    LikedBy(sId: 'Test user 1'),
    LikedBy(sId: 'Test user 2')
  ];
  //model.initialize(_likedBy, 'Test post_id');
  test("Testing setIsLiked", () {
    model.initialize(_likedBy, 'Test post_id');
    model.setIsLiked();
    expect(model.isLiked, true);
  });
  test(
      'Testing checkAndSetTheIsLiked function when user is not present in likedby',
      () {
    model.initialize(_likedBy, 'Test post_id');
    model.checkAndSetTheIsLiked();
    expect(model.isLiked, false);
  });

  test('Testing checkAndSetTheIsLiked function when user is present in likedby',
      () {
    _likedBy.add(LikedBy(sId: userConfig.currentUser.id));
    model.initialize(_likedBy, 'Test post_id');
    model.checkAndSetTheIsLiked();
    expect(model.isLiked, true);
  });
}
