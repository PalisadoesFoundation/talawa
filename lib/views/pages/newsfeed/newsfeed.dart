import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//pages are imported here
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/post_controller.dart';
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
  ScrollController scrollController = new ScrollController();
  bool isVisible = true;
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  List postList = [];
  PostController postController;
  Timer timer = Timer();

  //setting initial state to the variables
  @override
  initState() {
    super.initState();
    // getPosts();
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

  //the main build starts from here
  @override
  Widget build(BuildContext context) {
    postController = Provider.of<PostController>(context);
    return Consumer<PostController>(builder: (context, postController, child) {
      postList = postController.posts;
      return Scaffold(
          appBar: CustomAppBar('NewsFeed', key: const Key('NEWSFEED_APP_BAR')),
          floatingActionButton: addPostFab(),
          body: postList.isEmpty
              ? Center(
                  child: Loading(
                    key: UniqueKey(),
                  ),
                )
              : Container(
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
                                            index: index,
                                            post: postList[index] as Map,
                                          ),
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
                ));
    });
  }

  //function to add the post on the news feed
  Widget addPostFab() {
    return FloatingActionButton(
      heroTag: "btn2",
      backgroundColor: UIData.secondaryColor,
      onPressed: () {
        pushNewScreenWithRouteSettings(context,
                screen: const AddPost(), settings: const RouteSettings())
            .then((value) async {
          if (value != null && value as bool) {
            await postController.getPosts();
          }
        });
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
            await Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => NewsArticle(
                  index: index,
                  post: postList[index] as Map,
                ),
              ),
            );
          },
        )
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
          color: postController.hasUserLiked(postList[index]['_id'] as String)
              ? const Color(0xff007397)
              : const Color(0xff9A9A9A),
          onPressed: () {
            if (postList[index]['likeCount'] != 0) {
              if (postController
                  .hasUserLiked(postList[index]['_id'] as String)) {
                postController.addLike(index, postList[index]['_id'] as String);
              }
            } else {
              postController.removeLike(
                  index, postList[index]['_id'] as String);
            }
          },
        ),
      ],
    );
  }
}
