import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/api_functions.dart';

class PostController with ChangeNotifier {
  PostController() {
    getPosts();
  }
  List posts = [];
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  String currentUserID;
  Map<String, bool> likePostMap = {};
  Timer timer;

  // void : function function to all posts
  void addAllPost(List posts) {
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
    final String query = Queries().getPostsById(currentOrgID);
    final Map result = await apiFunctions.gqlquery(query);
    print(DateTime.now().difference(d1));
    if (result != null) {
      print(posts.isEmpty);
      updateLikepostMap(currentUserID);
      posts.isEmpty
          ? addAllPost(result['postsByOrganization'].reversed.toList() as List)
          : updatePosts(
              result['postsByOrganization'].reversed.toList() as List);
      updateLikepostMap(currentUserID);
    }
  }

  // void : function to addlike
  Future<void> addLike(int index, String postID) async {
    final String mutation = Queries().addLike(postID) as String;
    final Map result = await apiFunctions.gqlmutation(mutation) as Map;
    print(result);
    posts[index]["likeCount"]++;
    print(index);
    posts[index]['likedBy'].add({'_id': currentUserID});
    print(posts[index]["likeCount"]);
    likePostMap[posts[index]['_id'] as String] = true;
    notifyListeners();
  }

  // void : function to remove the likes
  Future<void> removeLike(int index, String postID) async {
    final String mutation = Queries().removeLike(postID) as String;
    final Map result = await apiFunctions.gqlmutation(mutation) as Map;
    print(result);
    posts[index]["likeCount"]--;
    posts[index]['likedBy'].remove(posts[index]['likedCount']);
    print(posts[index]["likeCount"]);
    likePostMap[posts[index]['_id'] as String] = false;
    notifyListeners();
  }

  void addComment(int index, Map comment) {
    posts[index]["commentCount"]++;
    posts[index]['comments'].add(comment);
    notifyListeners();
  }

  // void : function to update Posts
  void updatePosts(List updatedposts) {
    int insertAt = 0;
    updatedposts.forEach((element) {
      if (int.parse(element['createdAt'] as String) >
          int.parse(posts.first['createdAt'] as String)) {
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
    for (var item in posts) {
      item = item as Map;
      likePostMap[item['_id'] as String] = false;
      //Get userIds who liked the post.
      final _likedBy = item['likedBy'];
      for (final user in _likedBy) {
        if (user['_id'] == currentUserID) {
          //if(userId is in the list we make value true;)
          likePostMap[item['_id'] as String] = true;
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
