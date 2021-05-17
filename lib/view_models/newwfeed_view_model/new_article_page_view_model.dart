import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/post_controller.dart';
import 'package:talawa/enums/viewstate.dart';
import 'package:talawa/model/posts.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/view_models/base_model.dart';

class NewsArticleViewModel extends BaseModel {
  final Preferences _preferences = Preferences();
  final ApiFunctions _apiFunctions = ApiFunctions();
  List _comments = [];
  bool _moreComments = false;
  bool _isCommentAdded = false;
  bool _showLoadComments = false;
  int index;
  Posts post;
  final Queries _query = Queries();
  List _userDetails = [];
  String userID;
  String orgName;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  PostController _postController;
  final String newLineKey = "@123TALAWA321@";
  TextEditingController _commentController;
  BuildContext context;

  PostController get postController => _postController;
  TextEditingController get commentController => _commentController;
  bool get isCommentAdded => _isCommentAdded;
  List get comments => _comments;
  List get userDetails => _userDetails;
  bool get moreComments => _moreComments;
  bool get showLoadComments => _showLoadComments;

  initialize(Posts post, int index, BuildContext context) {
    this.post = post;
    this.context = context;
    this.index = index;
    _commentController = TextEditingController(
        text: Provider.of<CommentHandler>(context, listen: false)
            .comment(post.id.toString()));
    _commentController.addListener(_notifyData);
    fetchUserDetails();
  }

  //this method helps us to get the comments of the post
  Future getPostComments() async {
    final String mutation = Queries().getPostsComments(post.id.toString());
    final Map result = await _apiFunctions.gqlmutation(mutation) as Map;
    _comments = result == null
        ? []
        : (result['commentsByPost'] as List).reversed.toList();
    return;
  }

  void _notifyData() {
    Provider.of<CommentHandler>(context, listen: false)
        .commentEntry(post.id.toString(), commentController.text);
  }

  // For getting length of Comments to be displayed
  int getCommentslength() {
    getPostComments();
    return comments.length;
  }

  //get time of comment
  String commentTime(int index) {
    final Duration commentTimeDuration = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(
          int.parse(_comments[index]['createdAt'].toString())),
    );

    String timeText = '';

    if (commentTimeDuration.inMinutes < 1) {
      if (commentTimeDuration.inSeconds == 1) {
        timeText = ' second ago';
      } else {
        timeText = ' seconds ago';
      }
      return commentTimeDuration.inSeconds.toString() + timeText;
    } else if (commentTimeDuration.inHours < 1) {
      if (commentTimeDuration.inMinutes == 1) {
        timeText = ' min ago';
      } else {
        timeText = ' mins ago';
      }
      return commentTimeDuration.inMinutes.toString() + timeText;
    } else if (commentTimeDuration.inDays < 1) {
      if (commentTimeDuration.inHours == 1) {
        timeText = ' hour ago';
      } else {
        timeText = ' hours ago';
      }
      return commentTimeDuration.inHours.toString() + timeText;
    } else if (commentTimeDuration.inDays < 7) {
      if (commentTimeDuration.inDays == 1) {
        timeText = ' day ago';
      } else {
        timeText = ' days ago';
      }
      return commentTimeDuration.inDays.toString() + timeText;
    } else if (commentTimeDuration.inDays < 52) {
      final int weeks = commentTimeDuration.inDays ~/ 7;
      if (weeks == 1) {
        timeText = ' week ago';
      } else {
        timeText = ' weeks ago';
      }
      return weeks.toString() + timeText;
    } else {
      final int years = commentTimeDuration.inDays ~/ 365;
      if (years == 1) {
        timeText = ' year ago';
      } else {
        timeText = ' years ago';
      }
      return years.toString() + timeText;
    }
  }

  //this method helps us to create any comments we are willing to
  Future createComment() async {
    FocusScope.of(context).unfocus();
    String queryText = '';
    if (commentController.text.isNotEmpty) {
      Fluttertoast.showToast(msg: "Adding Comment...");
      queryText = commentController.text.replaceAll("\n", newLineKey).trim();
      final Map result =
          await Queries().createComments(post.id.toString(), queryText) as Map;
      if (result == null) {
        Fluttertoast.showToast(
          msg: "Sorry, this comment could not be posted.",
        );
      } else {
        _isCommentAdded = true;
        FocusScope.of(context).requestFocus(FocusNode());
        commentController.text = '';
        await Fluttertoast.showToast(
          msg: "Comment added.",
        );
      }
    } else {
      Fluttertoast.showToast(msg: "Please write comment");
    }
  }

  String addNewline(String rawComment) {
    // ignore: parameter_assignments
    rawComment = rawComment.replaceAll(newLineKey, "\n");
    return rawComment;
  }

  Future fetchUserDetails() async {
    setState(ViewState.busy);

    userID = await _preferences.getUserId();
    final GraphQLClient _client = graphQLConfiguration.clientToQuery();
    final QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': userID}));
    if (result.hasException) {
      print(result.exception);
      CustomToast.exceptionToast(msg: result.exception.toString());
    } else if (!result.hasException) {
      _userDetails = result.data['users'] as List;
    }
    setState(ViewState.idle);
  }

  //
  Future<void> changeLoading({bool value}) async {
    _showLoadComments = value;
    await getPostComments();
    notifyListeners();
  }

  void showMoreComments({bool value}) {
    _moreComments = value;
    notifyListeners();
  }
}
