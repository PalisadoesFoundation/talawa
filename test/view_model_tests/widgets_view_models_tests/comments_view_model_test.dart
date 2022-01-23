import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/widgets_view_models/comments_view_model.dart';

class MockCommentsViewModel extends Mock implements CommentsViewModel {
  @override
  late List<Comment> commentList;
  @override
  void initialise(String postID) {
    commentList = [];
  }

  @override
  Future<List<Comment>> getComments() async {
    return commentList;
  }

  @override
  Future createComment(String msg) async {
    final Comment comment = Comment(
        text: msg,
        createdAt: DateTime.now().toString(),
        creator: UserConfig().currentUser,
        post: "post",
        likeCount: "0");
    addCommentLocally(msg);
    return comment;
  }

  @override
  void addCommentLocally(String msg) {
    final Comment comment = Comment(
        text: msg,
        createdAt: DateTime.now().toString(),
        creator: UserConfig().currentUser,
        post: "post",
        likeCount: "0");
    commentList.add(comment);
  }
}

void main() {
  final MockCommentsViewModel model = MockCommentsViewModel();
  group("check for comments view model", () {
    model.initialise("TEST ID");

    test("Check for no comments created.", () {
      final hasComments = model.commentList.isEmpty;

      //checks if no comments ae created
      expect(hasComments, true);
    });

    test("check if comment is created", () {
      model.createComment("test message");

      //checks if comments are created
      expect(model.commentList.isNotEmpty, true);

      //checks if created comment is same as input
      expect(model.commentList.first.text, "test message");
    });
  });
}
