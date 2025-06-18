import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/exceptions/critical_action_exception.dart';
import 'package:talawa/exceptions/graphql_exception_resolver.dart';
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
/// * `addLike` : to add like to the post.
/// * `removeLike` : to remove the like from the post.

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

  /// Object to hold pagination information for posts. It contains information like `after`, `before`, `first`, and `last`.
  PageInfo postInfo = PageInfo(
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

  @override
  Future<List<Post>> fetchDataFromApi() async {
    // variables
    final String currentOrgID = _currentOrg.id!;
    final String query = PostQueries().getPostsByOrgID();
    final variables = {
      'orgId': currentOrgID,
      'first': first,
      'after': after,
      'before': before,
      'last': last,
    };
    final result = await _dbFunctions.gqlAuthQuery(query, variables: variables);
    //Checking if the dbFunctions return the postJSON, if not return.
    if (result.data == null) {
      // Handle the case where the result or result.data is null
      throw Exception('unable to fetch data');
    }
    final organizations = result.data!['organization'] as Map<String, dynamic>;
    print("data ${result.data}");
    print("data this isc ${result.exception}");
    final Map<String, dynamic> posts =
        organizations['posts'] as Map<String, dynamic>;

    print("posts: ${posts['pageInfo']}");
    postInfo = PageInfo.fromJson(posts['pageInfo'] as Map<String, dynamic>);

    print("cursor: ${postInfo.endCursor}");
    print(postInfo.endCursor);
    final List<Post> newPosts = [];
    for (final postJson in posts['edges'] as List) {
      final post = Post.fromJson(
        (postJson as Map<String, dynamic>)['node'] as Map<String, dynamic>,
      );
      print("cursor is ${postJson['cursor']}");
      postInfo.endCursor  = '${postJson['cursor']}';
      // Fetch presigned URL for attachments if they exist
      await post.getPresignedUrl(userConfig.currentOrg.id);

      // Fetch and set user's vote status for the post
      await _fetchAndSetUserVoteStatus(post);

      newPosts.insert(0, post);
    }
    return newPosts;
  }

  /// Method to fetch and set the user's vote status for a post.
  ///
  /// **params**:
  /// * `post`: The post for which the user's vote status is to be fetched.
  ///
  /// **returns**:
  ///   None
  Future<void> _fetchAndSetUserVoteStatus(Post post) async {
    final query = PostQueries().hasUserVoted();
    final variables = {'postId': post.id};

    final QueryResult<Object?> result;
    try {
      result = await _dbFunctions.gqlAuthQuery(query, variables: variables);
    } catch (e) {
      // Handle the exception, e.g., log it or show an error message
      debugPrint('Error fetching user vote status: $e');
      return;
    }
    if (result.data != null && result.data!['hasUserVoted'] != null) {
      final voteData = result.data!['hasUserVoted'] as Map<String, dynamic>;
      post.hasVoted = voteData['hasVoted'] as bool? ?? false;
      post.voteType = voteData['voteType'] as String?;
    }
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
        _renderedPostID.clear();
        _currentOrg = updatedOrganization;
        getPosts();
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

  /// Method used to fetch all posts of the current organisation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> getPosts() async {
    final List<Post> newPosts = await getNewFeedAndRefreshCache();
    _posts = newPosts;
    _renderedPostID.addAll(newPosts.map((post) => post.id ?? ''));
    _postStreamController.add(_posts);
    await saveDataToCache(_posts);
  }

  /// Method to refresh feed of current selected organisation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> refreshFeed() async {
    after = null;
    before = null;
    first = 5;
    last = null;
    final List<Post> newPosts = await getNewFeedAndRefreshCache();
    _renderedPostID.clear();
    _posts.clear();
    _posts = newPosts;
    GraphqlExceptionResolver.encounteredExceptionOrError(
      CriticalActionException('Feed refreshed!!!'),
    );
    _postStreamController.add(_posts);
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
    return await _dbFunctions.gqlAuthMutation(
      PostQueries().deletePost(),
      variables: {
        "id": post.id,
      },
    );
  }

  ///Method to add comment of a user and update comments using updated Post Stream.
  ///
  /// **params**:
  /// * `postID`: ID of the post to add comment locally
  ///
  /// **returns**:
  ///   None
  void addCommentLocally(String postID) {
    for (int i = 0; i < _posts.length; i++) {
      if (_posts[i].id == postID) {
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
    if (postInfo.hasNextPage == true) {
      print("Fetching next page of posts...");
      final nextCursor = postInfo.endCursor;
      if (nextCursor != null && nextCursor.isNotEmpty) {
        after = nextCursor;
        before = null;
        first = 5;
        last = null;
        print("Next cursor: $after");
        await getPosts();
      }
    }
  }

  /// Method to handle pagination by fetching previous page of posts.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> previousPage() async {
    if (postInfo.hasPreviousPage == true) {
      final prevCursor = postInfo.startCursor;
      if (prevCursor != null && prevCursor.isNotEmpty) {
        before = prevCursor;
        after = null;
        last = 5;
        first = null;
        await getPosts();
      }
    }
  }
}
