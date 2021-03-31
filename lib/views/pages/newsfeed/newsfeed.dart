
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//pages are imported here
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/views/pages/newsfeed/addPost.dart';
import 'package:talawa/views/pages/newsfeed/newsArticle.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/timer.dart';
import 'package:talawa/views/widgets/custom_appbar.dart';
import 'package:talawa/views/widgets/loading.dart';

class NewsFeed extends StatefulWidget {
  NewsFeed({Key key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {

  ScrollController scrollController = new ScrollController();
  bool isVisible = true;
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  List postList = [];
  Timer timer = Timer();
  String _currentOrgID;

  Map<String, bool> likePostMap = new Map<String , bool>(); 
  // key = postId and value will be true if user has liked a post.


  //setting initial state to the variables
  initState() {
    super.initState();
    getPosts();
    Provider.of<Preferences>(context, listen: false).getCurrentOrgId();
      scrollController.addListener(() {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (isVisible)
            setState(() {
              isVisible = false;
            });
        }
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!isVisible)
            setState(() {
              isVisible = true;
            });
        }
    });
  }

  // bool : Method to get (true/false) if a user has liked a post or Not.
  bool hasUserLiked(String postId){
    return likePostMap[postId];
  }


  //function to get the current posts
  Future<void> getPosts() async {
    final String currentOrgID = await preferences.getCurrentOrgId();
    final String currentUserID = await preferences.getUserId();
    _currentOrgID = currentUserID;
    String query = Queries().getPostsById(currentOrgID);
    Map result = await apiFunctions.gqlquery(query);
    // print(result);
    setState(() {
      postList =
          result == null ? [] : result['postsByOrganization'].reversed.toList();
      updateLikepostMap(currentUserID);
    });
    
  }


// void : function to set the map of userLikedPost
  void updateLikepostMap(String currentUserID){
    // traverse through post objects.
      for (var item in postList) {
        likePostMap[item['_id']] = false;
        //Get userIds who liked the post.
        var _likedBy = item['likedBy'];
        for(var user in _likedBy){
          if(user['_id'] == currentUserID){
            //if(userId is in the list we make value true;)
            likePostMap[item['_id']] = true;
          }
        }
      }
  }

  //function to addlike
  Future<void> addLike(String postID) async {
    String mutation = Queries().addLike(postID);
    Map result = await apiFunctions.gqlmutation(mutation);
    print(result);
    getPosts();
  }



  //function to remove the likes
  Future<void> removeLike(String postID) async {
    String mutation = Queries().removeLike(postID);
    Map result = await apiFunctions.gqlmutation(mutation);
    print(result);
    getPosts();
  }


  //the main build starts from here
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: CustomAppBar('NewsFeed',key: Key('NEWSFEED_APP_BAR')),
        floatingActionButton: addPostFab(),
        body: postList.isEmpty
            ? Center(child: Loading(key: UniqueKey(),))
            : RefreshIndicator(
                onRefresh: () async {
                  getPosts();
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: postList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: <Widget>[
                                    InkWell(
                                        onTap: () {
                                          pushNewScreen(
                                            context,
                                            screen: NewsArticle(
                                                post: postList[index]),
                                          );
                                        },
                                        child: Card(
                                          color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20.0),
                                                child:  Image.asset(UIData.shoppingImage),
                                              )
                                            ),
                                            Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Container(
                                                      child: Text(
                                                          postList[index]['title'].toString(),
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20.0,
                                                        ),
                                                      )
                                                  ),
                                                ]
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width - 50,
                                                      child: Text(
                                                          postList[index]["text"].toString(),
                                                        textAlign: TextAlign.justify,
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 10,
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                        ),
                                                      )
                                                  ),
                                                ]
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
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
                )
        )
    );
  }


  //function to add the post on the news feed
  Widget addPostFab() {
    return FloatingActionButton(
        backgroundColor: UIData.secondaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          pushNewScreenWithRouteSettings(context,
              screen: AddPost(), settings: RouteSettings());
        });
  }


  //function which counts the number of comments on a particular post
  Widget commentCounter(index) {
    return Row(
      children: [
        Text(
          postList[index]['commentCount'].toString(),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        IconButton(
            icon: Icon(Icons.comment), color: Colors.grey, onPressed: () async{
        var refresh = await Navigator.push(context,CupertinoPageRoute(
                    builder: (context) => NewsArticle(
                          post: postList[index],
                        )),
              ).then((value) {
                if (value != null && value) {
                  getPosts();
                }
              });
        })
      ],
    );
  }


  //function to like
  Widget likeButton(index) {
    return Row(
      children: [
        Text(
          postList[index]['likeCount'].toString(),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        IconButton(
            icon: Icon(Icons.thumb_up),
          color: likePostMap[postList[index]['_id']] ? Color(0xff007397) : Color(0xff9A9A9A),
            onPressed: ()
            {
              if(postList[index]['likeCount'] != 0)
                if(likePostMap[postList[index]['_id']] == false) {
                  //If user has not liked the post addLike().
                  addLike(postList[index]['_id']);
                }
                else {
                  //If user has  liked the post remove().
                  removeLike(postList[index]['_id']);
                }
              else
                {
                  //if the likeCount is 0 addLike().
                  addLike(postList[index]['_id']);
                }

              },
            ),
      ],

    );
  }
}