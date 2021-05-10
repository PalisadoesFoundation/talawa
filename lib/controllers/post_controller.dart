import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:talawa/model/posts.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/api_functions.dart';

class PostController with ChangeNotifier {
  PostController() {
    getPosts();
  }
  List<Posts> posts = [];
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  String currentUserID;
  Map<String, bool> likePostMap = {};
  Timer timer;

  // void : function function to all posts
  void addAllPost(List<Posts> posts) {
    this.posts = posts;
    notifyListeners();
  }

  void switchOrg() {
    print(posts);
    posts.clear();
    getPosts();
  }

  // void : function to get all Posts
  Future<void> getPosts() async {
    final DateTime d1 = DateTime.now();
    final String currentOrgID = await preferences.getCurrentOrgId();
    final String currentUserID = await preferences.getUserId();
    this.currentUserID = currentUserID;
    debugPrint(currentOrgID);
    final String query = Queries().getPostsById(currentOrgID);
    final Map result = await apiFunctions.gqlquery(query);
    print(DateTime.now().difference(d1));
    if (result != null) {
      print(posts.isEmpty);
      updateLikepostMap(currentUserID);

      posts.isEmpty
          ? addAllPost(postsFromJson(
              json.encode(result['postsByOrganization'].reversed.toList())))
          : updatePosts(postsFromJson(
              json.encode(result['postsByOrganization'].reversed.toList())));
      updateLikepostMap(currentUserID);
    }
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
