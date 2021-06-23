import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

class LikeButtonViewModel extends BaseModel {
  // Services
  final _userConfig = locator<UserConfig>();
  final _postService = locator<PostService>();

  // Local Variables for session caching
  bool _isLiked = false;
  late User _user;
  List<LikedBy> _likedBy = [];
  late String _postID;

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
  }

  void toggleIsLiked() {
    if (!_isLiked) _postService.addLike(_postID);
    _isLiked = !_isLiked;
    notifyListeners();
  }

  void setIsLiked({bool val = true}) {
    _isLiked = val;
    notifyListeners();
  }

  /*TODO: This function must be removed bec the checking, that the user 
  has liked the post or not must  be send from the backend and not 
  the processing should be done in front end.*/
  void checkAndSetTheIsLiked() {
    for (var i = 0; i < _likedBy.length; i++) {
      if (_likedBy[i].sId == _user.id) {
        setIsLiked();
      }
    }
  }
}
