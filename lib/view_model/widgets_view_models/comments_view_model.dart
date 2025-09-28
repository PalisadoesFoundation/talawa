import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/models/page_info/page_info.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/post_service.dart';
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

  /// comment list getter.
  List<Comment> get commentList => _commentlist;

  /// Id of current post.
  String get postId => _postID;

  /// page Info of the current comments.
  PageInfo pageInfo = PageInfo(
    hasNextPage: false,
    hasPreviousPage: false,
    startCursor: null,
    endCursor: null,
  );

  /// This function is used to get if there is a next page of comments available.
  bool get hasNextPage => pageInfo.hasNextPage == true;

  /// This function is used to initialise the CommentViewModel.
  ///
  /// To verify things are working, check out the native platform logs.
  /// **params**:
  /// * `postID`: The post id for which comments are to be fetched.
  ///
  /// **returns**:
  ///   None
  Future<void> initialise(String postID) async {
    _commentlist = [];
    _postID = postID;
    _commentService = locator<CommentService>();
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
  ///   None
  Future<void> getComments() async {
    setState(ViewState.busy);
    final result = await _commentService.getCommentsForPost(
      postId: _postID,
      first: 10,
      after: pageInfo.endCursor,
    );

    final List edges = result['comments'] as List;
    pageInfo = PageInfo.fromJson(result['pageInfo'] as Map<String, dynamic>);
    for (final edge in edges) {
      final node =
          (edge as Map<String, dynamic>)['node'] as Map<String, dynamic>;
      _commentlist.add(Comment.fromJson(node));
    }
    setState(ViewState.idle);
  }

  /// This function is used to fetch next page of comments if available.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> fetchNextPage() async {
    if (hasNextPage) {
      await getComments();
    }
  }

  /// This function add comment on the post. The function uses `createComments` method provided by Comment Service.
  ///
  /// **params**:
  /// * `msg`: The comment text.
  ///
  /// **returns**:
  ///   None
  Future<void> createComment(String msg) async {
    Comment? comment;
    await actionHandlerService.performAction(
      actionType: ActionType.optimistic,
      action: () async {
        comment = await _commentService.createComments(_postID, msg);
        return null;
      },
      updateUI: () {
        addCommentLocally(comment);
      },
    );
  }

  /// This function toggle upvote on the comment. The function uses `toggleUpVoteComment` method provided by Comment Service.
  ///
  /// **params**:
  /// * `comment`: The comment to be upvoted or remove upvote.
  ///
  /// **returns**:
  ///   None
  Future<void> toggleUpVoteComment(Comment comment) async {
    await actionHandlerService.performAction(
      actionType: ActionType.optimistic,
      action: () async {
        // await _commentService.toggleUpVoteComment(_postID, isUpvoted);
        return null;
      },
      updateUI: () {
        comment.upvotesCount = (comment.upvotesCount ?? 0) +
            (comment.hasVoted != null && comment.hasVoted == true ? -1 : 1);

        if (comment.hasVoted != null && comment.hasVoted == true) {
          comment.hasVoted = false;
        } else {
          comment.hasVoted = true;
        }
        notifyListeners();
      },
    );
  }

  /// This function add comment locally.
  ///
  /// **params**:
  /// * `comment`: The comment to add.
  ///
  /// **returns**:
  ///   None
  void addCommentLocally(Comment? comment) {
    if (comment == null) {
      return;
    }
    _postService.addCommentLocally(_postID);
    _commentlist.add(comment);
    notifyListeners();
  }
}
