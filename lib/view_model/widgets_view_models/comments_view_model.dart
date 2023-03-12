// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// CommentsViewModel class helps to serve the data from model
/// and to react to user's input for Comment Widget.
///
/// Methods include:
/// * `getComments` : to get all comments on the post.
/// * `createComment` : to add comment on the post.
class CommentsViewModel extends BaseModel {
  late CommentService _commentService;
  late PostService _postService;
  late String _postID;
  late List<Comment> _commentlist;
  late UserConfig _userConfig;

  // Getters
  List<Comment> get commentList => _commentlist;
  String get postId => _postID;

  // initialiser.
  Future initialise(String postID) async {
    _commentlist = [];
    _postID = postID;
    _commentService = locator<CommentService>();
    _userConfig = locator<UserConfig>();
    _postService = locator<PostService>();
    notifyListeners();
    await getComments();
  }

  /// This methods fetch all comments on the post.
  /// The function uses `getCommentsForPost` method by Comment Service.
  Future getComments() async {
    setState(ViewState.busy);
    final List commentsJSON =
        await _commentService.getCommentsForPost(_postID) as List;
    print(commentsJSON);
    commentsJSON.forEach((commentJson) {
      _commentlist.add(Comment.fromJson(commentJson as Map<String, dynamic>));
    });
    setState(ViewState.idle);
  }

  /// This function add comment on the post.
  /// The function uses `createComments` method provided by Comment Service.
  ///
  /// params:
  /// * `msg` : text of the comment to add.
  Future createComment(String msg) async {
    print("comment viewModel called");
    await _commentService.createComments(_postID, msg);
    addCommentLocally(msg);
  }

  // This function add comment locally.
  void addCommentLocally(String msg) {
    _postService.addCommentLocally(_postID);
    final creator = _userConfig.currentUser;
    final Comment localComment = Comment(
      text: msg,
      createdAt: DateTime.now().toString(),
      creator: creator,
    );
    _commentlist.insert(0, localComment);
    notifyListeners();
  }
}
