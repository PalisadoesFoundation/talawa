import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//pages are imported here
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/views/pages/newsfeed/add_post.dart';
import 'package:talawa/views/pages/newsfeed/news_article.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/timer.dart';
import 'package:talawa/views/widgets/custom_appbar.dart';
import 'package:talawa/views/widgets/loading.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  ScrollController scrollController = ScrollController();
  bool isVisible = true;
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  List postList = [];
  Timer timer = Timer();

  Map<String, bool> likePostMap = <String, bool>{};
  // key = postId and value will be true if user has liked a post.

  //setting initial state to the variables
  @override
  initState() {
    super.initState();
    getPosts();
    Provider.of<Preferences>(context, listen: false).getCurrentOrgId();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible) {
          setState(() {
            isVisible = false;
          });
        }
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isVisible) {
          setState(() {
            isVisible = true;
          });
        }
      }
    });
  }

  // bool : Method to get (true/false) if a user has liked a post or Not.
  bool hasUserLiked(String postId) {
    return likePostMap[postId];
  }

  //function to get the current posts
  Future<void> getPosts() async {
    final String currentOrgID = await preferences.getCurrentOrgId();
    final String currentUserID = await preferences.getUserId();
    if (currentOrgID != null) {
      final String query = Queries().getPostsById(currentOrgID);
      final Map result = await apiFunctions.gqlquery(query);
      // print(result);
      setState(() {
        postList = result == null
            ? []
            : (result['postsByOrganization'] as List).reversed.toList();
        updateLikepostMap(currentUserID);
      });
    } else {
      setState(() {
        postList = [];
        updateLikepostMap(currentUserID);
      });
    }
  }

// void : function to set the map of userLikedPost
  void updateLikepostMap(String currentUserID) {
    // traverse through post objects.
    for (final item in postList) {
      likePostMap[item['_id'].toString()] = false;
      //Get userIds who liked the post.
      final _likedBy = item['likedBy'];
      for (final user in _likedBy) {
        if (user['_id'] == currentUserID) {
          //if(userId is in the list we make value true;)
          likePostMap[item['_id'].toString()] = true;
        }
      }
    }
  }

  //function to addlike
  Future<void> addLike(String postID) async {
    final Map result = await Queries().addLike(postID) as Map;
    print(result);
    getPosts();
  }

  //function to remove the likes
  Future<void> removeLike(String postID) async {
    final Map result = await Queries().removeLike(postID) as Map;
    print(result);
    getPosts();
  }

  //the main build starts from here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('NewsFeed', key: const Key('NEWSFEED_APP_BAR')),
        floatingActionButton: addPostFab(),
        body: postList.isEmpty
            ? Center(
                child: Loading(
                key: UniqueKey(),
              ))
            : RefreshIndicator(
                onRefresh: () async {
                  getPosts();
                },
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: postList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        pushNewScreen(
                                          context,
                                          screen: NewsArticle(
                                              post: postList[index] as Map),
                                        );
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: Image.asset(
                                                      UIData.shoppingImage),
                                                )),
                                            Row(children: <Widget>[
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              // ignore: avoid_unnecessary_containers
                                              Container(
                                                  child: Text(
                                                postList[index]['title']
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              )),
                                            ]),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(children: <Widget>[
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              // ignore: sized_box_for_whitespace
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      50,
                                                  child: Text(
                                                    postList[index]["text"]
                                                        .toString(),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  )),
                                            ]),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: <Widget>[
                                                      likeButton(index),
                                                      commentCounter(index),
                                                      Container(width: 80)
                                                    ])),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )));
  }

  //function to add the post on the news feed
  Widget addPostFab() {
    return FloatingActionButton(
      heroTag: "btn2",
      backgroundColor: UIData.secondaryColor,
      onPressed: () {
        pushNewScreenWithRouteSettings(context,
            screen: const AddPost(), settings: const RouteSettings());
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  //function which counts the number of comments on a particular post
  Widget commentCounter(int index) {
    return Row(
      children: [
        Text(
          postList[index]['commentCount'].toString(),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        IconButton(
            icon: const Icon(Icons.comment),
            color: Colors.grey,
            onPressed: () async {
              pushNewScreenWithRouteSettings(context,
                      screen: NewsArticle(
                        post: postList[index] as Map,
                      ),
                      settings: const RouteSettings(),
                      withNavBar: false)
                  .then((value) {
                //if (value != null && value)
                if (value != null) {
                  getPosts();
                }
              });
            })
      ],
    );
  }

  //function to like
  Widget likeButton(int index) {
    return Row(
      children: [
        Text(
          postList[index]['likeCount'].toString(),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.thumb_up),
          color: likePostMap[postList[index]['_id']]
              ? const Color(0xff007397)
              : const Color(0xff9A9A9A),
          onPressed: () {
            if (postList[index]['likeCount'] !=
                // ignore: curly_braces_in_flow_control_structures
                0) if (likePostMap[postList[index]['_id']] == false) {
              //If user has not liked the post addLike().
              addLike(postList[index]['_id'].toString());
            } else {
              //If user has  liked the post remove().
              removeLike(postList[index]['_id'].toString());
            }
            else {
              //if the likeCount is 0 addLike().
              addLike(postList[index]['_id'].toString());
            }
          },
        ),
      ],
    );
  }
}
