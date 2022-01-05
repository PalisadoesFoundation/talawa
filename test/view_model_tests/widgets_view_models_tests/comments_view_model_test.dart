import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/comment/comment_model.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockCommentsViewModel extends BaseModel {
  late String _postID;
  late List<Comment> _commentlist;
  late UserConfig _userConfig;

  // Getters
  List<Comment> get commentList => _commentlist;

  //initialises the variables
  void initialise(String postID) {
    _userConfig = getAndRegisterUserConfig();
    _commentlist = [];
    _postID = postID;
    notifyListeners();
  }

  //gets the already created and stored comments
  List getComments() {
    return commentList;
  }

  //creates new comments
  Future createComment(String msg) async {
    addCommentLocally(msg);
  }

  //adds comments locally 
  void addCommentLocally(String msg) {
    final _creator = _userConfig.currentUser;
    final Comment _localComment = Comment(
        text: msg, createdAt: DateTime.now().toString(), creator: _creator);
    _commentlist.insert(0, _localComment);
    notifyListeners();
  }
}

void main() {
  group("check for comments view model", () {
    final model = MockCommentsViewModel();
    model.initialise("TEST ID");

    test("Check for no comments created.", () {
      final comments = model.getComments();

      //checks if no comments ae created
      expect(model.getComments().isEmpty, true);
    });

    test("check if comment is created", () {
      model.createComment("test message");

      //checks if comments are created
      expect(model.getComments().isNotEmpty, true);
      
      //checks if created comment is same as input
      expect(model._commentlist.first.text, "test message");
    });
  });
}



