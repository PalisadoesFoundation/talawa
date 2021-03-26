import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';

class PostController with ChangeNotifier {
  List posts = [];
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  String currentOrgID;

  PostController() {
    getPosts();
  }

  // function to all posts
  void addAllPost(List posts) {
    this.posts = posts;
    notifyListeners();
  }

  //function to get all Posts
  Future<void> getPosts() async {
    final String currentOrgID = await preferences.getCurrentOrgId();
    final String currentUserID = await preferences.getUserId();
    this.currentOrgID = currentUserID;
    String query = Queries().getPostsById(currentOrgID);
    Map result = await apiFunctions.gqlquery(query);
    if (result != null) {
      print(posts.isEmpty);
      posts.isEmpty
          ? addAllPost(result['postsByOrganization'].reversed.toList())
          : updatePosts(result['postsByOrganization'].reversed.toList());
    }
  }

  //function to addlike
  Future<void> addLike(int index, String postID) async {
    String mutation = Queries().addLike(postID);
    Map result = await apiFunctions.gqlmutation(mutation);
    print(result);
    posts[index]["likeCount"]++;
    print(index);
    posts[index]['likedBy'].add({'_id': currentOrgID});
    print(posts[index]["likeCount"]);
    notifyListeners();
  }

  //function to remove the likes
  Future<void> removeLike(int index, String postID) async {
    String mutation = Queries().removeLike(postID);
    Map result = await apiFunctions.gqlmutation(mutation);
    print(result);
    posts[index]["likeCount"]--;
    posts[index]['likedBy'].remove(posts[index]['likedCount']);
    print(posts[index]["likeCount"]);
    notifyListeners();
  }

  void addComment(int index, Map comment) {
    posts[index]["commentCount"]++;
    posts[index]['comments'].add(comment);
    notifyListeners();
  }

  //update Posts
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
}
