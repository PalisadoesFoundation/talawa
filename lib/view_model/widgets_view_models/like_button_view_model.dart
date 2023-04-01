// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// LikeButtonViewModel class helps to serve the data and
/// to react to user's input for Like Button Widget.
///
/// Methods include:
/// * `toggleIsLiked`
/// * `setIsLiked`
/// * `updatePost`
class LikeButtonViewModel extends BaseModel {
  // Services
  final _userConfig = locator<UserConfig>();
  final _postService = locator<PostService>();

  // Local Variables for session caching
  bool _isLiked = false;
  late User _user;
  List<LikedBy> _likedBy = [];
  late String _postID;

  // ignore: unused_field
  late StreamSubscription _updatePostSubscription;

  // Getters
  bool get isLiked => _isLiked;
  List<LikedBy> get likedBy => _likedBy;
  int get likesCount => _likedBy.length;
  // initialize
  void initialize(List<LikedBy> likedBy, String postID) {
    _postID = postID;
    _user = _userConfig.currentUser;
    _likedBy = likedBy;
    notifyListeners();
    checkAndSetTheIsLiked();
    _updatePostSubscription =
        _postService.updatedPostStream.listen((post) => updatePost(post));
  }

  /// This function add like to the post if not liked and
  /// remove the like from the post if liked.
  void toggleIsLiked() {
    if (!_isLiked) {
      _postService.addLike(_postID);
    } else {
      _postService.removeLike(_postID);
    }
  }

  /// This function set `_isLike` to true.
  void setIsLiked({bool val = true}) {
    _isLiked = val;
    notifyListeners();
  }

  /*TODO: This function must be removed bec the checking, that the user 
          has liked the post or not must  be send from the backend and not 
          the processing should be done in front end.*/
  void checkAndSetTheIsLiked() {
    setIsLiked(val: false);
    for (var i = 0; i < _likedBy.length; i++) {
      if (_likedBy[i].sId == _user.id) {
        setIsLiked();
      }
    }
  }

  /// This function updates the Post.
  ///
  /// params:
  /// `post` : `Post` type, the post that need to be updated.
  void updatePost(Post post) {
    if (_postID == post.sId) {
      _likedBy = post.likedBy!;
      checkAndSetTheIsLiked();
    }
  }

  @override
  // ignore: must_call_super
  void dispose() {
    _updatePostSubscription.cancel();
  }
}
