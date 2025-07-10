import 'dart:async';

import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// LikeButtonViewModel class helps to serve the data and to react to user's input for Like Button Widget.
///
///
/// Methods include:
/// * `initialize` - initializes the ViewModel with the Post ID.
/// * `updatePost` - updates the Post data when it is changed.
/// * `dispose` - cleans up the resources used by the ViewModel.
class InteractionsViewModel extends BaseModel {
  // Services
  final _postService = locator<PostService>();
  String? _postID;

  /// Getter of Post ID of the Post.
  String get postID => _postID ?? '';

  /// Setter of Post ID of the Post.
  late StreamSubscription _updatePostSubscription;

  /// First function to initialize the ViewModel.
  ///
  /// **params**:
  /// * `postID`: Post Id of the Post
  ///
  /// **returns**:
  ///   None
  void initialize(String? postID) {
    _postID = postID;
    _updatePostSubscription =
        _postService.updatedPostStream.listen((post) => updatePost(post));
  }

  /// function to update the Post.
  ///
  /// **params**:
  /// * `post`: Post Object
  ///
  /// **returns**:
  ///   None
  void updatePost(Post post) {
    if (_postID == post.id) {}
  }

  @override
  void dispose() {
    super.dispose();
    _updatePostSubscription.cancel();
  }
}
