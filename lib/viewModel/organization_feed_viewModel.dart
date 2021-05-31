import 'package:talawa/enums/view_state.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/demo_server_data/post_demo_data.dart';
import 'package:talawa/demo_server_data/pinned_post_demo_data.dart';
import 'package:talawa/viewModel/base_view_model.dart';

class OrganizationFeedViewModel extends BaseModel {
  final List<Post> _posts = [], _pinnedPosts = [];

  List<Post> get posts => _posts;
  List<Post> get pinnedPosts => _pinnedPosts;

  void initialise() {
    setState(ViewState.busy);
    //Fetching posts
    final postJsonResult = postsDemoData;

    postJsonResult.forEach((postJsonData) {
      _posts.add(Post.fromJson(postJsonData));
    });

    //fetching pinnedPosts
    final pinnedPostJsonResult = pinnedPostsDemoData;
    pinnedPostJsonResult.forEach((pinnedPostJsonData) {
      _pinnedPosts.add(Post.fromJson(pinnedPostJsonData));
    });

    setState(ViewState.idle);
  }
}
