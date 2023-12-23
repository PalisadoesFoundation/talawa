import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// CommentsViewModel class helps to serve the data from model and to react to user's input for Comment Widget.
///
/// Methods include:
/// * `getComments` : to get all comments on the post.
/// * `createComment` : to add comment on the post.
class CommentsViewModel extends BaseModel {
  /// Constructor
  late CommentService _commentService;

  /// PostService instance.
  late PostService _postService;

  /// Post id on which comments are to be fetched.
  late String _postID;

  /// List of comments on the post.
  late List<Comment> _commentlist;

  /// UserConfig instance.
  late UserConfig _userConfig;

  // Getters
  List<Comment> get commentList => _commentlist;
  String get postId => _postID;

  /// This function is used to initialise the CommentViewModel.
  ///
  /// To verify things are working, check out the native platform logs.
  /// **params**:
  /// * `postID`: The post id for which comments are to be fetched.
  ///
  /// **returns**:
  /// * `Future<void>`: promise that will be fulfilled message background activities are successful.
  ///
  Future<void> initialise(String postID) async {
    _commentlist = [];
    _postID = postID;
    _commentService = locator<CommentService>();
    _userConfig = locator<UserConfig>();
    _postService = locator<PostService>();
    notifyListeners();
    await getComments();
  }

  /// This function is used to get all comments on the post.
  ///
  /// To verify things are working, check out the native platform logs.
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: promise that will be fulfilled when comments are fetched.
  ///
  Future<void> getComments() async {
    setState(ViewState.busy);
    final List commentsJSON = await _commentService.getCommentsForPost(_postID);
    print(commentsJSON);
    commentsJSON.forEach((commentJson) {
      _commentlist.add(Comment.fromJson(commentJson as Map<String, dynamic>));
    });
    setState(ViewState.idle);
  }

  /// This function add comment on the post. The function uses `createComments` method provided by Comment Service.
  ///
  /// **params**:
  /// * `msg`: The comment text.
  ///
  /// **returns**:
  /// * `Future<void>`: promise that will be fulfilled when comment is added.
  ///
  Future<void> createComment(String msg) async {
    print("comment viewModel called");
    await _commentService.createComments(_postID, msg);
    addCommentLocally(msg);
  }

  /// This function add comment locally.
  ///
  /// **params**:
  /// * `msg`: BuildContext, contain parent info
  ///
  /// **returns**:
  ///   None
  void addCommentLocally(String msg) {
    _postService.addCommentLocally(_postID);
    final creator = _userConfig.currentUser;
    final Comment localComment = Comment(
      text: msg,
      createdAt: DateTime.now().toString(),
      creator: creator,
    );
    _commentlist.add(localComment);
    notifyListeners();
  }
}
