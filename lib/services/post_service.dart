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
    _userConfig = locator<UserConfig>();
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _graphqlConfig = locator<GraphqlConfig>();
    _currentOrg = _userConfig.currentOrg;
    // setOrgStreamSubscription();
  }

  void setOrgStreamSubscription() {
    _currentOrganizationStreamSubscription =
        _userConfig.currentOrfInfoStream.listen((updatedOrganization) {
      _currentOrg = updatedOrganization;
      getPosts();
    });
  }

  late UserConfig _userConfig;
  late DataBaseMutationFunctions _dbFunctions;
  late GraphqlConfig _graphqlConfig;
  late StreamSubscription _currentOrganizationStreamSubscription;
  List<Post> _posts = [];
  late OrgInfo _currentOrg;

  // void : function to get all Posts
  Future<void> getPosts() async {
    final String currentOrgID = _currentOrg.id!;
    final String query = PostQueries().getPostsById(currentOrgID);
    final Map<String, dynamic> result = await _dbFunctions.gqlquery(query);
    print(result['postsByOrganization'][0]);
    for (var result in result['postsByOrganization']) {
      Map<String, dynamic> postJson = result as Map<String, dynamic>;
      // Post post = Post.fromJson(result);
      // print(post.createdAt);
    }
    // if (result != null) {
    //   print(posts.isEmpty);
    //   updateLikepostMap(currentUserID);
    //   posts.isEmpty
    //       ? addAllPost(result['postsByOrganization'].reversed.toList() as List)
    //       : updatePosts(
    //           result['postsByOrganization'].reversed.toList() as List);
    //   updateLikepostMap(currentUserID);
    // }
  }
}
