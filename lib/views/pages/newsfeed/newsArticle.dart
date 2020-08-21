import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/timer.dart';

class NewsArticle extends StatefulWidget {
  Map post;
  NewsArticle({Key key, @required this.post}) : super(key: key);

  @override
  _NewsArticleState createState() => _NewsArticleState();
}

class _NewsArticleState extends State<NewsArticle> {
  final commentController = TextEditingController();
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  Timer timer = Timer();
  List comments = [];
  initState() {
    super.initState();
    getPostComments();
  }

  getPostComments() async {
    String mutation = Queries().getPostsComments(widget.post['_id']);
    Map result = await apiFunctions.gqlmutation(mutation);
    // print(result);
    setState(() {
      comments =
          result == null ? [] : result['commentsByPost'].reversed.toList();
    });
  }

  createComment() async {
    if (commentController.text.isNotEmpty) {
      String mutation =
          Queries().createComments(widget.post['_id'], commentController.text);
      Map result = await apiFunctions.gqlmutation(mutation);
      print(result);
      commentController.text = '';
      getPostComments();
    }
  }

  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(lipsum.createWord(numWords: 4).toString()),
              background: FittedBox(
                child: Image.asset(UIData.shoppingImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
              child: Text(widget.post['text'].toString()),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.chat),
                title: Text(comments.length.toString() + '  Comments'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(UIData.pkImage),
                ),
                title: TextField(
                  decoration: InputDecoration(
                      suffix: IconButton(
                        color: Colors.grey,
                        icon: Icon(Icons.send),
                        onPressed: () {
                          createComment();
                        },
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: 'Leave a Comment'),
                  controller: commentController,
                ),
              ),
              Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return commentTile(index);
                      })),
            ],
          )),
        ],
      ),
    );
  }

  Widget commentTile(index) {
    return ListTile(
        leading: CircleAvatar(
          child: Icon(
            Icons.person,
            color: Colors.white10,
          ),
          backgroundColor: UIData.secondaryColor,
        ),
        title: Text(comments[index]['text']),
        subtitle: Row(
          children: [
            Text(comments[index]['creator']['firstName'] +
                ' ' +
                comments[index]['creator']['lastName']),
            Text(
              ' - ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(timer.hoursOrDays(comments[index]['createdAt']))
          ],
        ));
  }
}
