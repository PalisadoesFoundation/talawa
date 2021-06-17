import 'dart:async';

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
    final Map<String, dynamic> result = await _dbFunctions.gqlquery(query);

    //Checking if the dbFunctions return the postJSON, if not return.
    if (result['postsByOrganization'] == null) return;

    final List postsJson = result['postsByOrganization'] as List;
    postsJson.forEach((postJson) {
      final Post post = Post.fromJson(postJson as Map<String, dynamic>);
      _postStreamController.add(post);
    });
  }

  Future<void> addLike(String postID) {
    final String mutation = PostQueries().addLike();
    final result =
        _dbFunctions.gqlmutation(mutation, variables: {"postID": postID});
    print(result);
    return result;
  }
}
