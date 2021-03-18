//the flutter packages are imported here
import 'package:flutter/material.dart';

//the pages are called here
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/timer.dart';

// ignore: must_be_immutable
class NewsArticle extends StatefulWidget {
  Map post;
  NewsArticle({Key key, @required this.post}) : super(key: key);

  @override
  _NewsArticleState createState() => _NewsArticleState();
}

class _NewsArticleState extends State<NewsArticle> {
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  final commentController = TextEditingController();
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  bool loadComments = false;
  Timer timer = Timer();
  List comments = [];
  initState() {
    super.initState();
  }

  //this method helps us to get the comments of the post
  getPostComments() async {
    String mutation = Queries().getPostsComments(widget.post['_id']);
    Map result = await apiFunctions.gqlmutation(mutation);
    setState(() {
      comments =
          result == null ? [] : result['commentsByPost'].reversed.toList();
    });
  }

  //this method helps us to create any comments we are willing to
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

  //main build starts here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.post['title'].toString(),
                style: TextStyle(color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
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
                      hintText: 'Leave a Comment....',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.teal))),
                  controller: commentController,
                ),
              ),
              Container(
                  child: loadComments == false
                      ? loadCommentsButton()
                      : commentList())
            ],
          )),
        ],
      ),
    );
  }

  //this loads the comments button
  Widget loadCommentsButton() {
    return TextButton(
        style: TextButton.styleFrom(
          primary: Colors.grey[200],
        ),
        onPressed: () {
          setState(() {
            loadComments = true;
          });
        },
        child: Text(
          'Load Comments',
          style: TextStyle(color: Colors.black54),
        ));
  }

  // a new widget for comment list
  Widget commentList() {
    getPostComments();
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.chat),
          title: Text(comments.length.toString() + '  Comments'),
        ),
        ListView.builder(
            shrinkWrap: true,
            // physics: ClampingScrollPhysics(),
            itemCount: comments.length,
            itemBuilder: (context, index) {
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
                ),
              );
            })
      ],
    );
  }
}
