import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/news_feed_controller.dart';

import 'package:talawa/model/posts.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/custom_toast.dart';

class PostController with ChangeNotifier {
  String organizationId;
  List<Posts> posts = [];
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  String currentUserID;
  Map<String, bool> likePostMap = {};
  Timer timer;

  //This method is getting the current organisation Id
  Future<void> getCurrentOrgId() async {
    organizationId = await preferences.getCurrentOrgId();
    notifyListeners();
  }

  //Methode used for craeting the post
  Future createPost(
      String description, String title, BuildContext context) async {
    if (organizationId == null) {
      CustomToast.exceptionToast(msg: "Please join an organization");
      return;
    }

    final Map result =
        await Queries().addPost(description, organizationId, title);
    if (result['error'] == null) {
      Provider.of<NewsFeedProvider>(context, listen: false).getPosts();
      Navigator.pop(context, true);
    } else {
      CustomToast.exceptionToast(msg: result['error'] as String);
    }
  }

  // void : function function to all posts
  void addAllPost(List<Posts> posts) {
    this.posts = posts;
    notifyListeners();
  }

  void switchOrg(BuildContext context) {
    print(posts);
    posts.clear();
    Provider.of<NewsFeedProvider>(context).getPosts();
  }

  // void : function to addlike
  Future<void> addLike(int index, String postID) async {
    final String mutation = Queries().addLike(postID) as String;
    final Map result = await apiFunctions.gqlmutation(mutation) as Map;
    print(result);
    posts[index].likeCount++;
    print(index);
    posts[index].likedBy.add(LikedBy(id: currentUserID));
    likePostMap[posts[index].id] = true;
    notifyListeners();
  }

  // void : function to remove the likes
  Future<void> removeLike(int index, String postID) async {
    final String mutation = Queries().removeLike(postID) as String;
    final Map result = await apiFunctions.gqlmutation(mutation) as Map;
    print(result);
    posts[index].likeCount--;
    posts[index].likedBy.removeAt(posts[index].likeCount);
    likePostMap[posts[index].id] = false;
    notifyListeners();
  }

  void addComment(int index, Map comment) {
    posts[index].commentCount++;
    posts[index].comments.add(Comments(id: comment["_id"] as String));
    notifyListeners();
  }

  // void : function to update Posts
  void updatePosts(List<Posts> updatedposts) {
    int insertAt = 0;
    updatedposts.forEach((element) {
      if (int.parse(element.createdAt) > int.parse(posts.first.createdAt)) {
        posts.insert(insertAt, element);
        insertAt++;
      } else {
        notifyListeners();
        return;
      }
    });
  }

  // void : function to set the map of userLikedPost
  void updateLikepostMap(String currentUserID) {
    // traverse through post objects.
    for (final item in posts) {
      likePostMap[item.id] = false;
      //Get userIds who liked the post.
      final _likedBy = item.likedBy;
      for (final user in _likedBy) {
        if (user.id == currentUserID) {
          //if(userId is in the list we make value true;)
          likePostMap[item.id] = true;
        }
      }
    }
    return;
  }

  // bool : Method to get (true/false) if a user has liked a post or Not.
  bool hasUserLiked(String postId) {
    return likePostMap[postId];
  }
}
