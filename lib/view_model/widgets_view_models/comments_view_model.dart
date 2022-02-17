import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

class CommentsViewModel extends BaseModel {
  late CommentService _commentService;
  late PostService _postService;
  late String _postID;
  late List<Comment> _commentlist;
  late UserConfig _userConfig;

  // Getters
  List<Comment> get commentList => _commentlist;
  String get postId => _postID;

  Future initialise(String postID) async {
    _commentlist = [];
    _postID = postID;
    _commentService = locator<CommentService>();
    _userConfig = locator<UserConfig>();
    _postService = locator<PostService>();
    notifyListeners();
    await getComments();
  }

  Future getComments() async {
    setState(ViewState.busy);
    final List _commentsJSON =
        await _commentService.getCommentsForPost(_postID) as List;
    print(_commentsJSON);
    _commentsJSON.forEach((commentJson) {
      _commentlist.add(Comment.fromJson(commentJson as Map<String, dynamic>));
    });
    setState(ViewState.idle);
  }

  Future createComment(String msg) async {
    print("comment viewModel called");
    await _commentService.createComments(_postID, msg);
    addCommentLocally(msg);
  }

  void addCommentLocally(String msg) {
    _postService.addCommentLocally(_postID);
    final _creator = _userConfig.currentUser;
    final Comment _localComment = Comment(
      text: msg,
      createdAt: DateTime.now().toString(),
      creator: _creator,
    );
    _commentlist.insert(0, _localComment);
    notifyListeners();
  }
}
