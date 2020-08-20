import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/views/pages/newsfeed/addPost.dart';
import 'package:talawa/views/pages/newsfeed/newsArticle.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/timer.dart';

class NewsFeed extends StatefulWidget {
  NewsFeed({Key key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  Preferences preferences = Preferences();
  List postList = [];
  String name;
  Timer timer = Timer();

  initState() {
    super.initState();
    getPosts();
  }

  Future<void> getPosts() async {
    final String currentOrgID = await preferences.getCurrentOrgId();
    String query = Queries().getPostsById(currentOrgID);
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlquery(query);
    print(result);
    setState(() {
      postList =
          result == null ? [] : result['postsByOrganization'].reversed.toList();
    });
    print(DateTime.fromMillisecondsSinceEpoch(
        int.parse(postList[0]['createdAt'])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Newsfeed',
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: addPostFab(),
        body: postList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  getPosts();
                },
                child: ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    '${timer.hoursOrDays(postList[index]['createdAt'])}'),
                              ),
                            ),
                            ListTile(
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: NewsArticle(post: postList[index]),
                                  );
                                },
                                title: Text(postList[index]['creator']
                                        ['firstName'] +
                                    ' ' +
                                    (postList[index]['creator']['lastName'])),
                                subtitle:
                                    Text(postList[index]["text"].toString()),
                                trailing: Container(
                                  width: 80,
                                  child: Image.asset(UIData.shoppingImage),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Icon(
                                        Icons.thumb_up,
                                        color: UIData.secondaryColor,
                                      ),
                                      Icon(
                                        Icons.comment,
                                        color: UIData.secondaryColor,
                                      ),
                                      Container(width: 80)
                                    ])),
                          ],
                        ),
                      );
                    })));
  }

  Widget addPostFab() {
    return FloatingActionButton(
        backgroundColor: UIData.secondaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          pushNewScreen(
            context,
            screen: AddPost(),
          );
        });
  }

  Widget likes() {
    return Row(
      children: <Widget>[
        Text('0'),
      ],
    );
  }
}
