// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/demo_server_data/pinned_post_demo_data.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// OrganizationFeedViewModel class helps to interact with model to serve data to view for organization feed section.
///
/// Methods include:
/// * `setCurrentOrganizationName` : to set current organization name.
/// * `fetchNewPosts` : to fetch new posts in the organization.
/// * `navigateToIndividualPage` : to navigate to individual page.
/// * `navigateToPinnedPostPage` : to navigate to pinned post page.
/// * `addNewPost` : to add new post in the organization.
/// * `updatedPost` : to update a post in the organization.
class OrganizationFeedViewModel extends BaseModel {
  // Local caching variables for a session.
  // ignore: prefer_final_fields
  List<Post> _posts = [];
  bool istest = false;
  List<Post> _pinnedPosts =
      pinnedPostsDemoData.map((e) => Post.fromJson(e)).toList();
  final Set<String> _renderedPostID = {};
  late String _currentOrgName = "";

  // Importing services.
  final NavigationService _navigationService = locator<NavigationService>();
  final UserConfig _userConfig = locator<UserConfig>();
  final PostService _postService = locator<PostService>();

  // Stream variables
  late StreamSubscription _currentOrganizationStreamSubscription;
  late StreamSubscription _postsSubscription;
  late StreamSubscription _updatePostSubscription;

  // Getters
  List<Post> get posts {
    // if (istest) {
    //   _posts = pinnedPostsDemoData.map((e) => Post.fromJson(e)).toList();
    //   return _posts;
    // }
    return _posts;
  }

  List<Post> get pinnedPosts {
    if (istest) {
      _pinnedPosts = [];
      return _pinnedPosts;
    }
    return _pinnedPosts;
  }

  String get currentOrgName => _currentOrgName;

  /// This function sets the organization name after update.
  ///
  /// params:
  /// * [updatedOrganization] : updated organization name.
  void setCurrentOrganizationName(String updatedOrganization) {
    // if `updatedOrganization` is not same to `_currentOrgName`.
    if (updatedOrganization != _currentOrgName) {
      _posts.clear();
      _renderedPostID.clear();
      _currentOrgName = updatedOrganization;
      notifyListeners();
    }
    // _postService.getPosts();
  }

  /// This function fetches new posts in the organization.
  void fetchNewPosts() {
    _postService.getPosts();
  }

  void initialise(
      // bool forTest,
      {
    bool isTest = false,
  }) {
    // For caching/initializing the current organization after the stream subscription has canceled and the stream is updated

    _currentOrgName = _userConfig.currentOrg.name!;
    // ------
    // Attaching the stream subscription to rebuild the widgets automatically
    _currentOrganizationStreamSubscription =
        _userConfig.currentOrgInfoStream.listen(
      (updatedOrganization) =>
          setCurrentOrganizationName(updatedOrganization.name!),
    );
    _postsSubscription = _postService.postStream.listen((newPosts) {
      return buildNewPosts(newPosts);
    });

    _updatePostSubscription =
        _postService.updatedPostStream.listen((post) => updatedPost(post));
    if (isTest) {
      istest = true;
    }
  }

  void initializeWithDemoData() {
    // final postJsonResult = postsDemoData;
    //
    // ------
    // // Calling function to ge the post for the only 1st time.
    // _postService.getPosts();
    //
    // //fetching pinnedPosts
    // final pinnedPostJsonResult = pinnedPostsDemoData;
    // pinnedPostJsonResult.forEach((pinnedPostJsonData) {
    //   _pinnedPosts.add(Post.fromJson(pinnedPostJsonData));
    // });
  }

  /// This function initialise `_posts` with `newPosts`.
  ///
  /// params:
  /// * [newPosts]
  void buildNewPosts(List<Post> newPosts) {
    _posts = newPosts;
    notifyListeners();
  }

  /// This function navigate to individual post page.
  void navigateToIndividualPage(Post post) {
    // uses `pushScreen` method by `navigationService` service.
    _navigationService.pushScreen(Routes.individualPost, arguments: post);
  }

  /// This function navigate to pinned post page.
  void navigateToPinnedPostPage() {
    // uses `pushScreen` method by `navigationService` service.
    _navigationService.pushScreen(
      Routes.pinnedPostPage,
      arguments: _pinnedPosts,
    );
  }

  @override
  void dispose() {
    // Canceling the subscription so that there will be no rebuild after the widget is disposed.
    _currentOrganizationStreamSubscription.cancel();
    _postsSubscription.cancel();
    _updatePostSubscription.cancel();
    super.dispose();
  }

  /// This function adds new Post.
  ///
  /// params:
  /// * [newPost]
  void addNewPost(Post newPost) {
    _posts.insert(0, newPost);
    notifyListeners();
  }

  /// This function updates the post.
  ///
  /// params:
  /// * [post]
  void updatedPost(Post post) {
    for (int i = 0; i < _posts.length; i++) {
      if (_posts[i].sId == post.sId) {
        _posts[i] = post;
        notifyListeners();
        break;
      }
    }
  }
}
