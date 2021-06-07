import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//pages are imported here
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/news_feed_controller.dart';
import 'package:talawa/model/posts.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/pages/newsfeed/add_post.dart';
import 'package:talawa/views/pages/newsfeed/news_article.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/widgets/custom_appbar.dart';
import 'package:talawa/views/widgets/loading.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed();

  /// Get the list of posts
  Future<void> getPostsList(BuildContext context) async {
    await Provider.of<NewsFeedProvider>(context, listen: false).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    //print(AppLocalizations.of(context).translate('hello-world'));
    return Scaffold(
      appBar: CustomAppBar(
        AppLocalizations.of(context).translate('NewsFeed'),
        key: const Key('NEWSFEED_APP_BAR'),
      ),
      floatingActionButton: addPostFab(context),
      body: FutureBuilder(
        future: getPostsList(context),
        builder: (BuildContext context, AsyncSnapshot<void> snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () async {
              try {
                await Provider.of<NewsFeedProvider>(context, listen: false)
                    .getPosts();
              } catch (e) {
                CustomToast.exceptionToast(msg: e.toString());
              }
            },
            child: Provider.of<NewsFeedProvider>(context).isPostEmpty
                ? Center(
                    child: Loading(
                    isNetworkError:
                        Provider.of<NewsFeedProvider>(context).isErrorOccurred,
                    isCurrentOrgNull:
                        Provider.of<NewsFeedProvider>(context).isCurrOrgIdNull,
                    emptyContentIcon: Icons.photo_album_outlined,
                    emptyContentMsg: AppLocalizations.of(context)
                        .translate('No post to show, Create One!'),
                    refreshFunction: () => getPostsList(context),
                    key: UniqueKey(),
                  ))
                : Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          // ignore: sort_child_properties_last
                          child: ListView.builder(
                            itemCount: Provider.of<NewsFeedProvider>(context)
                                .getPostList
                                .length,
                            itemBuilder: (context, index) {
                              final Posts post =
                                  Provider.of<NewsFeedProvider>(context)
                                      .getPostList[index];

                              return Container(
                                padding: EdgeInsets.only(
                                    top: SizeConfig.safeBlockVertical * 2.5),
                                child: Column(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        pushNewScreen(
                                          context,
                                          screen: NewsArticle(
                                            post: post,
                                            index: index,
                                          ),
                                        ).then((value) {
                                          //if (value != null && value)
                                          if (value != null) {
                                            Provider.of<NewsFeedProvider>(
                                                    context,
                                                    listen: false)
                                                .getPosts();
                                          }
                                        });
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
                                            Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: SizeConfig
                                                          .safeBlockHorizontal *
                                                      7.5,
                                                ),
                                                // ignore: avoid_unnecessary_containers
                                                Container(
                                                  child: Text(
                                                    post.title ?? '',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height:
                                                  SizeConfig.safeBlockVertical *
                                                      1.25,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: SizeConfig
                                                          .safeBlockHorizontal *
                                                      7.5,
                                                ),
                                                // ignore: sized_box_for_whitespace
                                                Container(
                                                  width: SizeConfig
                                                          .screenWidth -
                                                      SizeConfig
                                                              .safeBlockHorizontal *
                                                          12.5,
                                                  child: Text(
                                                    post.text.toString(),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: <Widget>[
                                                  likeButton(post, context),
                                                  commentCounter(
                                                      post, index, context),
                                                  Container(
                                                    width: SizeConfig
                                                            .safeBlockHorizontal *
                                                        20,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  SizeConfig.safeBlockVertical *
                                                      1.25,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  //function to add the post on the news feed
  Widget addPostFab(BuildContext context) {
    return FloatingActionButton(
      heroTag: "btn2",
      backgroundColor: UIData.secondaryColor,
      onPressed: () {
        pushNewScreenWithRouteSettings(
          context,
          screen: const AddPost(),
          settings: const RouteSettings(),
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  //function which counts the number of comments on a particular post
  Widget commentCounter(Posts post, int index, BuildContext context) {
    return Row(
      children: [
        Text(
          post.commentCount.toString(),
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
                        post: post,
                        index: index,
                      ),
                      settings: const RouteSettings(),
                      withNavBar: false)
                  .then((value) {
                //if (value != null && value)
                if (value != null) {
                  Provider.of<NewsFeedProvider>(context, listen: false)
                      .getPosts();
                }
              });
            })
      ],
    );
  }

  //function to like
  Widget likeButton(Posts post, BuildContext context) {
    final bool isPostLiked =
        Provider.of<NewsFeedProvider>(context).getLikePostMap[post.id];

    return Row(
      children: [
        Text(
          post.likeCount.toString(),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.thumb_up),
          color:
              isPostLiked ? const Color(0xff007397) : const Color(0xff9A9A9A),
          onPressed: () {
            if (post.likeCount != 0) {
              if (isPostLiked == false) {
                //If user has not liked the post addLike().
                Provider.of<NewsFeedProvider>(context, listen: false)
                    .addLike(post.id);
              } else {
                Provider.of<NewsFeedProvider>(context, listen: false)
                    .removeLike(post.id);
              }
            } else {
              //if the likeCount is 0 addLike().
              Provider.of<NewsFeedProvider>(context, listen: false)
                  .addLike(post.id);
            }
          },
        ),
      ],
    );
  }
}
