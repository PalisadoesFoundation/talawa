import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/page_info/page_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/caching/base_feed_manager.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';

/// PostService class provides functions in the context of a Post.
///
/// Services include:
/// * `getPosts` : to get all posts of the organization.
class PostService extends BaseFeedManager<Post> {
  // constructor
  PostService() : super(HiveKeys.postFeedKey) {
    _postStream = _postStreamController.stream.asBroadcastStream();
    _updatedPostStream =
        _updatedPostStreamController.stream.asBroadcastStream();
    _currentOrg = _userConfig.currentOrg;
    setOrgStreamSubscription();
  }

  // Stream for entire posts
  final StreamController<List<Post>> _postStreamController =
      StreamController<List<Post>>();
  late Stream<List<Post>> _postStream;

  //Stream for individual post update
  final StreamController<Post> _updatedPostStreamController =
      StreamController<Post>();
  late Stream<Post> _updatedPostStream;

  final _userConfig = locator<UserConfig>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();
  late OrgInfo _currentOrg;
  final Set<String> _renderedPostID = {};
  List<Post> _posts = [];

  bool _isRefreshing = false;

  /// Object to hold pagination information for posts. It contains information like `after`, `before`, `first`, and `last`.
  PageInfo pageInfo = PageInfo(
    hasNextPage: false,
    hasPreviousPage: false,
    startCursor: null,
    endCursor: null,
  );

  /// `after` is used to fetch posts after a certain cursor.
  String? after;

  /// `before` is used to fetch posts before a certain cursor.
  String? before;

  /// `first` is used to limit the number of posts fetched in a single request.
  int? first = 5;

  /// `last` is used to limit the number of posts fetched in a single request from the end.
  int? last;

  /// Getter for Stream of posts.
  Stream<List<Post>> get postStream => _postStream;

  /// Getter for Stream of update in any post.
  Stream<Post> get updatedPostStream => _updatedPostStream;

  /// Getter for the current organization.
  OrgInfo get currentOrg => _currentOrg;

  /// Getter for the list of posts.
  List<Post> get posts => _posts;

  @override
  Future<List<Post>> fetchDataFromApi({Map<String, dynamic>? params}) async {
    // variables
    final String currentOrgID = _currentOrg.id!;
    final String query = PostQueries().getPostsByOrgID();
    final variables = {
      'orgId': currentOrgID,
      'first': first,
      'after': after,
      'before': before,
      'last': last,
      'userId': _userConfig.currentUser.id,
    };
    final result = await _dbFunctions.gqlAuthQuery(query, variables: variables);
    //Checking if the dbFunctions return the postJSON, if not return.
    if (result.data == null) {
      // Handle the case where the result or result.data is null
      throw Exception('unable to fetch data');
    }
    final organizations = result.data!['organization'] as Map<String, dynamic>;
    final Map<String, dynamic> posts =
        organizations['posts'] as Map<String, dynamic>;

    pageInfo = PageInfo.fromJson(posts['pageInfo'] as Map<String, dynamic>);

    final List<Post> newPosts = [];
    for (final postJson in posts['edges'] as List) {
      final post = Post.fromJson(
        (postJson as Map<String, dynamic>)['node'] as Map<String, dynamic>,
      );
      pageInfo.endCursor = '${postJson['cursor']}';
      // Fetch presigned URL for attachments if they exist
      await post.getPresignedUrl(userConfig.currentOrg.id);

      newPosts.insert(0, post);
    }
    return newPosts;
  }

  ///This method sets up a stream that constantly listens to change in current org.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void setOrgStreamSubscription() {
    _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
      if (updatedOrganization != _currentOrg) {
        _currentOrg = updatedOrganization;
      }
    });
  }

  ///  Method to load cached data from Hive database.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> fetchPostsInitial() async {
    _posts = await loadCachedData();
    _postStreamController.add(_posts);
    refreshFeed();
  }

  /// Method to toggle upvote on a post.
  ///
  /// **params**:
  /// * `post`: post for which vote needs to be updated
  ///
  /// **returns**:
  ///   None
  Future<void> toggleUpVote(Post post) async {
    try {
      String mutation;
      Map<String, dynamic> variables;

      if (post.hasVoted == true && post.voteType == VoteType.upVote) {
        // Remove upvote
        mutation = PostQueries().updateVotePost();
        variables = {
          'postId': post.id,
          'type': null,
        };
      } else {
        // Add Upvote
        mutation = PostQueries().updateVotePost();
        variables = {
          'postId': post.id,
          'type': VoteType.upVote.toApiString(),
        };
      }

      await _dbFunctions.gqlAuthMutation(mutation, variables: variables);
    } catch (e) {
      debugPrint('Error toggling upvote: $e');
    }
  }

  /// Method to toggle downvote on a post.
  ///
  /// **params**:
  /// * `post`: post for which vote needs to be updated
  ///
  /// **returns**:
  ///   None
  Future<void> toggleDownVote(Post post) async {
    try {
      String mutation;
      Map<String, dynamic> variables;

      if (post.hasVoted == true && post.voteType == VoteType.downVote) {
        // Remove downvote
        mutation = PostQueries().updateVotePost();
        variables = {
          'postId': post.id,
          'type': null,
        };
      } else {
        mutation = PostQueries().updateVotePost();
        variables = {
          'postId': post.id,
          'type': VoteType.downVote.toApiString(),
        };
      }
      await _dbFunctions.gqlAuthMutation(mutation, variables: variables);
    } catch (e) {
      debugPrint('Error toggling downvote: $e');
    }
  }

  /// Method to refresh feed of current selected organisation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> refreshFeed() async {
    if (_isRefreshing) return;
    _isRefreshing = true;
    try {
      after = null;
      before = null;
      first = 5;
      last = null;
      final List<Post> newPosts = await getNewFeedAndRefreshCache();
      _renderedPostID.clear();
      _posts.clear();
      _posts = newPosts;
      _postStreamController.add(_posts);
    } finally {
      _isRefreshing = false;
    }
  }

  ///Method to add newly created post at the very top of the feed.
  ///
  /// **params**:
  /// * `newPost`: new post made by user to add in feed
  ///
  /// **returns**:
  ///   None
  void addNewpost(Post newPost) {
    if (!_posts.contains(newPost)) {
      _posts.insert(0, newPost);
    }
    _postStreamController.add(_posts);
  }

  ///Method to delete a post from the feed.
  ///
  /// **params**:
  /// * `post`: Post object to be deleted from the feed
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: returns the result of the GraphQL mutation to delete the post.
  Future<QueryResult<Object?>> deletePost(Post post) async {
    final res = await _dbFunctions.gqlAuthMutation(
      PostQueries().deletePost(),
      variables: {
        "id": post.id,
      },
    );

    return res;
  }

  ///Method to add comment of a user and update comments using updated Post Stream.
  ///
  /// **params**:
  /// * `post`: ID of the post to add comment locally
  ///
  /// **returns**:
  ///   None
  void addCommentLocally(Post post) {
    for (int i = 0; i < _posts.length; i++) {
      if (_posts[i].id == post.id) {
        _posts[i].commentsCount = (_posts[i].commentsCount ?? 0) + 1;
        _updatedPostStreamController.add(_posts[i]);
      }
    }
    saveDataToCache(_posts);
  }

  /// Method to handle pagination by fetching next page of posts.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> nextPage() async {
    if (pageInfo.hasNextPage == true && !_isRefreshing) {
      final nextCursor = pageInfo.endCursor;
      if (nextCursor != null && nextCursor.isNotEmpty) {
        _isRefreshing = true;
        try {
          after = nextCursor;
          before = null;
          first = 5;
          last = null;

          // Fetch new posts without clearing existing ones
          final List<Post> newPosts = await fetchDataFromApi();

          // Add only new posts that aren't already in the list
          for (final post in newPosts) {
            if (!_renderedPostID.contains(post.id)) {
              _posts.add(post);
              _renderedPostID.add(post.id ?? '');
            }
          }

          _postStreamController.add(_posts);
          saveDataToCache(_posts);
        } finally {
          _isRefreshing = false;
        }
      }
    }
  }
}
