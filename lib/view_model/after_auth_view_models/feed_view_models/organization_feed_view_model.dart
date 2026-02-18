import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/pinned_post_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// OrganizationFeedViewModel class helps to interact with model to serve data to view for organization feed section.
///
/// Methods include:
/// * `setCurrentOrganizationName` : to set current organization name.
/// * `refreshPosts` : to fetch new posts in the organization.
/// * `navigateToIndividualPage` : to navigate to individual page.
/// * `navigateToPinnedPostPage` : to navigate to pinned post page.
/// * `addNewPost` : to add new post in the organization.
/// * `updatedPost` : to update a post in the organization.
class OrganizationFeedViewModel extends BaseModel {
  // Local caching variables for a session.
  // ignore: prefer_final_fields
  List<Post> _posts = [];
  final List<Post> _userPosts = [];
  List<Post> _pinnedPosts = [];
  final Set<String> _renderedPostID = {};
  late String _currentOrgName = "";

  // Importing services.
  final NavigationService _navigationService = locator<NavigationService>();
  final UserConfig _userConfig = locator<UserConfig>();
  final PostService _postService = locator<PostService>();
  final PinnedPostService _pinnedPostService = locator<PinnedPostService>();

  // Stream variables
  late StreamSubscription _currentOrganizationStreamSubscription;
  late StreamSubscription _postsSubscription;
  late StreamSubscription _updatePostSubscription;
  late StreamSubscription _pinnnedPostSubscription;

  // Getters
  /// getter for the posts.
  List<Post> get posts => _posts;

  /// Getter for User Posts.
  List<Post> get userPosts => _userPosts;

  /// getter for the pinned post.
  List<Post> get pinnedPosts => _pinnedPosts;

  /// getter for the currentOrgName.
  String get currentOrgName => _currentOrgName;

  bool _isFetchingPosts = true;

  /// getter for isFetchingPosts to show loading indicator.
  bool get isFetchingPosts => _isFetchingPosts;

  /// This function sets the organization name after update.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `updatedOrganization`: updated organization name.
  ///
  /// **returns**:
  ///   None
  Future<void> setCurrentOrganizationName(String updatedOrganization) async {
    // if `updatedOrganization` is not same to `_currentOrgName`.
    if (updatedOrganization != _currentOrgName) {
      _isFetchingPosts = true;
      databaseFunctions.clearGraphQLCache();
      _currentOrgName = updatedOrganization;
      notifyListeners();
      _userPosts.clear();
      _posts.clear();
      _pinnedPosts.clear();
      _renderedPostID.clear();
      await Future.wait([
        _postService.refreshFeed(),
        _pinnedPostService.refreshPinnedPosts(),
      ]);
      _isFetchingPosts = false;
      notifyListeners();
    }
  }

  /// This function fetches new posts in the organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> refreshPosts() async {
    await Future.wait([
      _postService.refreshFeed(),
      _pinnedPostService.refreshPinnedPosts(),
    ]);
  }

  /// To initialize the view model.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> initialise() async {
    _isFetchingPosts = true;
    notifyListeners();

    // For caching/initializing the current organization after the stream subscription has canceled and the stream is updated
    _currentOrgName = _userConfig.currentOrg.name!;
    // ------
    // Attaching the stream subscription to rebuild the widgets automatically
    _currentOrganizationStreamSubscription =
        _userConfig.currentOrgInfoStream.listen(
      (updatedOrganization) =>
          setCurrentOrganizationName(updatedOrganization.name!),
    );

    _pinnnedPostSubscription =
        _pinnedPostService.pinnedPostStream.listen((newPosts) {
      return setPinnedPosts(newPosts);
    });

    _postsSubscription = _postService.postStream.listen((newPosts) {
      return setPosts(newPosts);
    });

    _updatePostSubscription =
        _postService.updatedPostStream.listen((post) => updatedPost(post));

    // SWR Pattern: Load from cache first
    await _postService.fetchPostsInitial();
    // Synchronously update the local state with cached data to avoid loading flicker
    setPosts(_postService.posts);

    if (_posts.isNotEmpty) {
      _isFetchingPosts = false;
      notifyListeners();
    }

    // Background refresh
    await Future.wait([
      _postService.refreshFeed(),
      _pinnedPostService.refreshPinnedPosts(),
    ]);

    _isFetchingPosts = false;
    notifyListeners();
  }

  /// This function initialise `_posts` with `newPosts`.
  ///
  /// **params**:
  /// * `newPosts`: new post list
  ///
  /// **returns**:
  ///   None
  void setPosts(List<Post> newPosts) {
    _posts = newPosts;
    final currentUserId = _userConfig.currentUser.id!;
    _userPosts.clear();
    for (final post in newPosts) {
      if (!_userPosts.any((element) => element.id == post.id) &&
          post.creator?.id == currentUserId) {
        _userPosts.insert(0, post);
      }
    }
  }

  /// This function initialise `_pinnedPosts` with `newPosts`.
  ///
  /// **params**:
  /// * `newPinPosts`: new post
  ///
  /// **returns**:
  ///   None
  void setPinnedPosts(List<Post> newPinPosts) {
    _pinnedPosts = newPinPosts;
    notifyListeners();
  }

  /// This function navigate to individual post page..
  ///
  /// **params**:
  /// * `post`: define_the_param
  ///
  /// **returns**:
  ///   None
  void navigateToIndividualPage(Post post) {
    // uses `pushScreen` method by `navigationService` service.
    _navigationService.pushScreen(Routes.individualPost, arguments: post);
  }

  /// This function navigate to pinned post page.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
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
    _pinnnedPostSubscription.cancel();
    _updatePostSubscription.cancel();
    super.dispose();
  }

  /// This function adds new Post.
  ///
  /// **params**:
  /// * `newPost`: define_the_param
  ///
  /// **returns**:
  ///   None
  void addNewPost(Post newPost) {
    _posts.insert(0, newPost);
    notifyListeners();
  }

  /// This function updates the post.
  ///
  /// **params**:
  /// * `post`: post object
  ///
  /// **returns**:
  ///   None
  void updatedPost(Post post) {
    for (int i = 0; i < _posts.length; i++) {
      if (_posts[i].id == post.id) {
        _posts[i] = post;
        notifyListeners();
        break;
      }
    }
  }

  /// Method to delete a post from the feed.
  ///
  /// **params**:
  /// * `post`: Post object to be deleted from the feed
  ///
  /// **returns**:
  ///   None
  Future<void> deletePost(Post post) async {
    try {
      await _postService.deletePost(post);
      _posts.removeWhere((p) => p.id == post.id);
      _pinnedPosts.removeWhere((p) => p.id == post.id);
      navigationService.showSnackBar(
        "Post deleted successfully",
      );
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting post: $e');
    }
  }

  /// Method to fetch next posts.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> nextPage() async {
    await _postService.nextPage();
  }
}
