import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';

class PostController with ChangeNotifier {
  List posts = [];
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  String currentUserID;
  Map<String, bool> likePostMap = {};
  Timer timer;

  PostController() {
    getPosts();
  }
  
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
    DateTime d1 = DateTime.now();
    final String currentOrgID = await preferences.getCurrentOrgId();
    final String currentUserID = await preferences.getUserId();
    this.currentUserID = currentUserID;
    String query = Queries().getPostsById(currentOrgID);
    Map result = await apiFunctions.gqlquery(query);
    print(DateTime.now().difference(d1));
    if (result != null) {
      print(posts.isEmpty);
      updateLikepostMap(currentUserID);
      posts.isEmpty
          ? addAllPost(result['postsByOrganization'].reversed.toList())
          : updatePosts(result['postsByOrganization'].reversed.toList());
      updateLikepostMap(currentUserID);
    }
  }

  // void : function to addlike
  Future<void> addLike(int index, String postID) async {
    String mutation = Queries().addLike(postID);
    Map result = await apiFunctions.gqlmutation(mutation);
    print(result);
    posts[index]["likeCount"]++;
    print(index);
    posts[index]['likedBy'].add({'_id': currentUserID});
    print(posts[index]["likeCount"]);
    likePostMap[posts[index]['_id']] = true;
    notifyListeners();
  }

  // void : function to remove the likes
  Future<void> removeLike(int index, String postID) async {
    String mutation = Queries().removeLike(postID);
    Map result = await apiFunctions.gqlmutation(mutation);
    print(result);
    posts[index]["likeCount"]--;
    posts[index]['likedBy'].remove(posts[index]['likedCount']);
    print(posts[index]["likeCount"]);
    likePostMap[posts[index]['_id']] = false;
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
      if (int.parse(element['createdAt']) >
          int.parse(posts.first['createdAt'])) {
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
      likePostMap[item['_id']] = false;
      //Get userIds who liked the post.
      var _likedBy = item['likedBy'];
      for (var user in _likedBy) {
        if (user['_id'] == currentUserID) {
          //if(userId is in the list we make value true;)
          likePostMap[item['_id']] = true;
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
