import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'dart:math';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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

  @override
  Widget build(BuildContext context) {
    print(times);
    times.sort();


    return Scaffold(
        appBar: AppBar(
          title: Text('Newsfeed'),
        ),
        body: ListView.builder(
            itemCount: list.length,
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
                        title: Text(list[index]),
                        subtitle: Text(list2[index]),
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
                                color: UIData.primaryColor,
                              ),
                              Icon(
                                Icons.share,
                                color: UIData.primaryColor,
                              ),
                              Icon(
                                Icons.bookmark,
                                color: UIData.primaryColor,
                              ),
                              Container(width: 80)
                            ])),
                  ],
                ),
              );
            })
            );
  }
}
