import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'dart:math';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/views/pages/addPost.dart';
import 'package:talawa/views/pages/newsArticle.dart';
import 'package:talawa/utils/uidata.dart';

class NewsFeed extends StatefulWidget {
  NewsFeed({Key key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  List list = List<String>.generate(
      20, (int index) => lipsum.createWord(numWords: 4).toString());
  List list2 = List<String>.generate(
      20, (int index) => lipsum.createWord(numWords: 20).toString());
  List times = List<int>.generate(20, (index) => Random().nextInt(30));
////////////////////////////////////////////////////
  List postList = [];
  String name;

  initState() {
    getNews();
  }

  Future<void> getNews() async {
    String query = Queries().posts;
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlquery(query);

    setState(() {
      postList = result == null ? []:result['posts'];
    });
    print(postList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Newsfeed',
          style: TextStyle(color: Colors.white),),
        ),
        floatingActionButton: addPostFab(),
        body: ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('${times[index].toString()} hours ago'),
                      ),
                    ),
                    ListTile(
                        onTap: () {
                          pushNewScreen(
                            context,
                            
                            screen: NewsArticle(),
                          );
                        },
                        title: Text(postList[index]['creator']['firstName'] +
                            ' ' +
                            postList[index]['creator']['lastName']),
                        subtitle: Text(postList[index]['text']),
                        trailing: Container(
                          width: 80,
                          child: Image.asset(UIData.shoppingImage),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.delete,
                                color: UIData.secondaryColor,
                              ),
                              Icon(
                                Icons.share,
                                color: UIData.secondaryColor,
                              ),
                              Icon(
                                Icons.bookmark,
                                color: UIData.secondaryColor,
                              ),
                              Container(width: 80)
                            ])),
                  ],
                ),
              );
            }));
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
              withNavBar: false,
              screen: AddPost(),
            );

        });
  }
}
