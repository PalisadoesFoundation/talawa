// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

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

  //Stream for individul post update
  final StreamController<Post> _updatedPostStreamController =
      StreamController<Post>();
  late Stream<Post> _updatedPostStream;

  final _userConfig = locator<UserConfig>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();
  late OrgInfo _currentOrg;
  final Set<String> _renderedPostID = {};
  // ignore: prefer_final_fields
  List<Post> _posts = [];

  //Getters
  Stream<List<Post>> get postStream => _postStream;
  Stream<Post> get updatedPostStream => _updatedPostStream;

  //Setters
  void setOrgStreamSubscription() {
    _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
      if (updatedOrganization != _currentOrg) {
        print("org changes from post service");
        _renderedPostID.clear();
        _currentOrg = updatedOrganization;
        getPosts();
      }
    });
  }

  /// This function used to get all posts of an organization.
  /// The function reference the organization Id from `_currentOrg`.
  Future<void> getPosts() async {
    // variables
    final String currentOrgID = _currentOrg.id!;
    final String query = PostQueries().getPostsById(currentOrgID);
    final result = await _dbFunctions.gqlAuthQuery(query);

    //Checking if the dbFunctions return the postJSON, if not return.
    if (result.data!['postsByOrganization'] == null) return;

    final List postsJson = result.data!['postsByOrganization'] as List;

    postsJson.forEach((postJson) {
      final Post post = Post.fromJson(postJson as Map<String, dynamic>);
      if (!_renderedPostID.contains(post.sId)) {
        _posts.insert(0, post);
        _renderedPostID.add(post.sId);
      }
    });
    _postStreamController.add(_posts);
  }

  /// This function is used to add Like to the Post.
  ///
  /// params:
  /// * [postId] : id of the post where like need to be added.
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

  void _localAddLike(String postID) {
    _posts.forEach((post) {
      if (post.sId == postID) {
        post.likedBy!.add(LikedBy(sId: _userConfig.currentUser.id));
        _updatedPostStreamController.add(post);
      }
    });
  }

  /// This function is used to remove like from the Post.
  ///
  /// params:
  /// * [postId] : id of the post where like need to be removed.
  Future<void> removeLike(String postID) async {
    _removeLocal(postID);
    final String mutation = PostQueries().removeLike();
    final result = await _dbFunctions
        .gqlAuthMutation(mutation, variables: {"postID": postID});
    print(result);
    return result;
  }

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

  // Functions related to comments
  void addCommentLocally(String postID) {
    for (int i = 0; i < _posts.length; i++) {
      if (_posts[i].sId == postID) {
        _posts[i].comments!.add(Comments(sId: postID));
        _updatedPostStreamController.add(_posts[i]);
      }
    }
  }
}
