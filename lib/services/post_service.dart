import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';

class PostService {
  PostService() {
    _postStream = _postStreamController.stream.asBroadcastStream();
    _currentOrg = _userConfig.currentOrg;
    setOrgStreamSubscription();
  }

  final StreamController<Post> _postStreamController = StreamController<Post>();
  late Stream<Post> _postStream;
  final _userConfig = locator<UserConfig>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();
  late OrgInfo _currentOrg;

  //Getters
  Stream<Post> get postStream => _postStream;

  //Setters
  void setOrgStreamSubscription() {
    _userConfig.currentOrfInfoStream.listen((updatedOrganization) {
      _currentOrg = updatedOrganization;
    });
  }

  //Function to get all posts
  Future<void> getPosts() async {
    final String currentOrgID = _currentOrg.id!;
    final String query = PostQueries().getPostsById(currentOrgID);
    final QueryResult result =
        await _dbFunctions.gqlAuthQuery(query) as QueryResult;

    //Checking if the dbFunctions return the postJSON, if not return.
    if (result.data!['postsByOrganization'] == null) return;

    final List postsJson = result.data!['postsByOrganization'] as List;
    postsJson.forEach((postJson) {
      final Post post = Post.fromJson(postJson as Map<String, dynamic>);
      _postStreamController.add(post);
    });
  }

  Future<void> addLike(String postID) {
    final String mutation = PostQueries().addLike();
    final result =
        _dbFunctions.gqlAuthMutation(mutation, variables: {"postID": postID});
    return result;
  }
}
