import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/view_state.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/demo_server_data/post_demo_data.dart';
import 'package:talawa/demo_server_data/pinned_post_demo_data.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

class OrganizationFeedViewModel extends BaseModel {
  final List<Post> _posts = [], _pinnedPosts = [];
  final NavigationService _navigationService = locator<NavigationService>();

  List<Post> get posts => _posts;
  List<Post> get pinnedPosts => _pinnedPosts;

  void initialise() {
    setState(ViewState.busy);
    //Fetching posts
    const postJsonResult = postsDemoData;

    postJsonResult.forEach((postJsonData) {
      _posts.add(Post.fromJson(postJsonData));
    });

    //fetching pinnedPosts
    const pinnedPostJsonResult = pinnedPostsDemoData;
    pinnedPostJsonResult.forEach((pinnedPostJsonData) {
      _pinnedPosts.add(Post.fromJson(pinnedPostJsonData));
    });

    setState(ViewState.idle);
  }

  void navigateToIndividualPage(Post post) {
    _navigationService.pushScreen(Routes.individualPost, arguments: post);
  }

  void navigateToPinnedPostPage() {
    _navigationService.pushScreen(Routes.pinnedPostpage,
        arguments: _pinnedPosts);
  }
}
