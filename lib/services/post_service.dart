import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';

class PostService {
  PostService() {
    _postStream = _postStreamController.stream.asBroadcastStream();
    _userConfig = locator<UserConfig>();
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _graphqlConfig = locator<GraphqlConfig>();
    _currentOrg = _userConfig.currentOrg;
    setOrgStreamSubscription();
  }

  late UserConfig _userConfig;
  late DataBaseMutationFunctions _dbFunctions;
  late GraphqlConfig _graphqlConfig;
  late StreamSubscription _currentOrganizationStreamSubscription;
  late OrgInfo _currentOrg;
  final Set<String> _posts = {};
  //Post Stream
  late Stream<Post> _postStream;
  final StreamController<Post> _postStreamController = StreamController<Post>();

  void setOrgStreamSubscription() {
    _currentOrganizationStreamSubscription =
        _userConfig.currentOrfInfoStream.listen((updatedOrganization) {
      _currentOrg = updatedOrganization;
      getPosts();
    });
  }

  // void : function to get all Posts
  Future<void> getPosts() async {
    final String currentOrgID = _currentOrg.id!;
    final String query = PostQueries().getPostsById(currentOrgID);
    final Map<String, dynamic> result = await _dbFunctions.gqlquery(query);
    List postsJson = result['postsByOrganization'] as List;

    postsJson.forEach((postJson) {
      Post post = Post.fromJson(postJson as Map<String, dynamic>);
      if (!_posts.contains(post.sId)) {
        _posts.add(post.sId);
        _postStreamController.add(post);
      }
    });
  }
}
