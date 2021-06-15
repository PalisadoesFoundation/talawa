import 'dart:async';

import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/demo_server_data/pinned_post_demo_data.dart';
import 'package:talawa/demo_server_data/post_demo_data.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/view_model/base_view_model.dart';

class OrganizationFeedViewModel extends BaseModel {
  final List<Post> _posts = [], _pinnedPosts = [];
  late StreamSubscription _currentOrganizationStreamSubscription;

  List<Post> get posts => _posts;
  List<Post> get pinnedPosts => _pinnedPosts;
  late String _currentOrgname = "";

  String get currentOrgName => _currentOrgname;

  void setCurrentOrganizationName(String updatedOrganization) {
    _currentOrgname = updatedOrganization;
    notifyListeners();
  }

  void initialise() {
    // For caching/initalizing the current organization after the stream subsciption has canceled and the stream is updated
    _currentOrgname = userConfig.currentOrg.name!;

    // Attasching the stream subscription to rebuild the widgets automatically
    _currentOrganizationStreamSubscription = userConfig.currentOrfInfoStream
        .listen((updatedOrganization) =>
            setCurrentOrganizationName(updatedOrganization.name!));

    final postJsonResult = postsDemoData;

    postJsonResult.forEach((postJsonData) {
      _posts.add(Post.fromJson(postJsonData));
    });

    //fetching pinnedPosts
    final pinnedPostJsonResult = pinnedPostsDemoData;
    pinnedPostJsonResult.forEach((pinnedPostJsonData) {
      _pinnedPosts.add(Post.fromJson(pinnedPostJsonData));
    });
  }

  void navigateToIndividualPage(Post post) {
    navigationService.pushScreen(Routes.individualPost, arguments: post);
  }

  void navigateToPinnedPostPage() {
    navigationService.pushScreen(Routes.pinnedPostPage,
        arguments: _pinnedPosts);
  }

  @override
  void dispose() {
    // Canceling the subscription so that there will be no rebuild after the widget is disposed.
    _currentOrganizationStreamSubscription.cancel();
    super.dispose();
  }
}
