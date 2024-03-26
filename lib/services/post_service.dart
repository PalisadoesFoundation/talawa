// ignore_for_file: talawa_good_doc_comments, talawa_api_doc
import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';

/// PostService class provides functions in the context of a Post.
///
/// Services include:
/// * `getPosts` : to get all posts of the organization.
/// * `addLike` : to add like to the post.
/// * `removeLike` : to remove the like from the post.
class PostService {
  // constructor
  PostService() {
    _postStream = _postStreamController.stream.asBroadcastStream();
    _updatedPostStream =
        _updatedPostStreamController.stream.asBroadcastStream();
    _currentOrg = _userConfig.currentOrg;
    setOrgStreamSubscription();
    getPosts();
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
  // ignore: prefer_final_fields
  List<Post> _posts = [];

  Map<String, dynamic>? postInfo;
  String? after;
  String? before;
  int? first = 5;
  int? last;

  /// Getter for Stream of posts.
  Stream<List<Post>> get postStream => _postStream;

  /// Getter for Stream of update in any post.
  Stream<Post> get updatedPostStream => _updatedPostStream;

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

  /// Method used to fetch all posts of the current organisation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: returns future void
  Future<void> getPosts() async {
    // variables
    final String currentOrgID = _currentOrg.id!;
    final String query =
        PostQueries().getPostsById(currentOrgID, after, before, first, last);
    final result = await _dbFunctions.gqlAuthQuery(query);
    //Checking if the dbFunctions return the postJSON, if not return.
    if (result == null || (result as QueryResult).data == null) {
      // Handle the case where the result or result.data is null
      return;
    }

    final organizations = result.data!['organizations'] as List;
    final posts = (organizations[0] as Map<String, dynamic>)['posts'];
    final List postsJson = (posts as Map<String, dynamic>)['edges'] as List;
    postInfo = posts['pageInfo'] as Map<String, dynamic>;
    postsJson.forEach((postJson) {
      final Post post = Post.fromJson(
        (postJson as Map<String, dynamic>)['node'] as Map<String, dynamic>,
      );
      if (!_renderedPostID.contains(post.sId)) {
        _posts.insert(0, post);
        _renderedPostID.add(post.sId);
      }
    });
    _postStreamController.add(_posts);
  }

  /// Method to refresh feed of current selected organisation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: returns future void
  Future<void> refreshFeed() async {
    _posts.clear();
    _renderedPostID.clear();
    await getPosts();
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

  ///Method to add like on a Post.
  ///
  /// This method basically update likedBy list of a Post
  /// in database.
  ///
  /// **params**:
  /// * `postID`: ID of the post to add like in database
  ///
  /// **returns**:
  /// * `Future<void>`: define_the_return
  Future<void> addLike(String postID) async {
    _localAddLike(postID);
    final String mutation = PostQueries().addLike();
    // run the graphQl mutation.
    final result = await _dbFunctions
        .gqlAuthMutation(mutation, variables: {"postID": postID});
    print(result);
    // return result
    return result;
  }

  /// Locally add like on a Post and updates it using updated Post Stream.
  ///
  /// **params**:
  /// * `postID`: ID of the post to add like locally
  ///
  /// **returns**:
  ///   None
  void _localAddLike(String postID) {
    _posts.forEach((post) {
      if (post.sId == postID) {
        post.likedBy!.add(LikedBy(sId: _userConfig.currentUser.id));
        _updatedPostStreamController.add(post);
      }
    });
  }

  /// Method to remove like in a Post.
  ///
  /// This method basically update likedBy list of a Post
  /// and removes the like of a user in database.
  ///
  /// **params**:
  /// * `postID`: ID of the post to remove like in database.
  ///
  /// **returns**:
  /// * `Future<void>`: nothing
  Future<void> removeLike(String postID) async {
    _removeLocal(postID);
    final String mutation = PostQueries().removeLike();
    final result = await _dbFunctions
        .gqlAuthMutation(mutation, variables: {"postID": postID});
    print(result);
    return result;
  }

  /// Locally removes the like of a user and update the Post UI.
  ///
  /// **params**:
  /// * `postID`: ID of the post to remove like locally
  ///
  /// **returns**:
  ///   None
  void _removeLocal(String postID) {
    _posts.forEach((post) {
      if (post.sId == postID) {
        post.likedBy!.removeWhere(
          (likeUser) => likeUser.sId == _userConfig.currentUser.id,
        );
        _updatedPostStreamController.add(post);
      }
    });
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
      if (_posts[i].sId == postID) {
        _posts[i].comments!.add(Comments(sId: postID));
        _updatedPostStreamController.add(_posts[i]);
      }
    }
  }

  /// Method to handle pagination by fetching next page of posts.
  ///
  /// **params**:
  ///  None
  ///
  /// **returns**:
  /// None
  Future<void> nextPage() async {
    if (postInfo!['hasNextPage'] == true) {
      _posts.clear();
      _renderedPostID.clear();
      after = postInfo!['endCursor'] as String;
      before = null;
      first = 5;
      last = null;
      await getPosts();
    }
  }

  /// Method to handle pagination by fetching previous page of posts.
  ///
  /// **params**:
  /// None
  ///
  /// **returns**:
  /// None
  Future<void> previousPage() async {
    if (postInfo!['hasPreviousPage'] == true) {
      _posts.clear();
      _renderedPostID.clear();
      before = postInfo!['startCursor'] as String;
      after = null;
      last = 5;
      first = null;
      await getPosts();
    }
  }
}
