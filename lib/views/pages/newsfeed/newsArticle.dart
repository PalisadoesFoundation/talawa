//the flutter packages are imported here
import 'package:flutter/cupertino.dart';
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

  double _inputHeight = 50;
  final TextEditingController commentController = TextEditingController();
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  bool loadComments = false;
  Timer timer = Timer();
  List comments = [];
  bool moreComments = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
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
      //print("knfkafasnfak");
      print(result);
      commentController.text = '';
      getPostComments();
    }
  }

  //main build starts here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  //height: 200,
                  child: FittedBox(
                    child: Image.asset(UIData.shoppingImage),
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      widget.post['title'].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10, 0, 10),
                    child: Text(widget.post['text'].toString()),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(UIData.pkImage),
                    ),
                    title: Container(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                        minHeight: 20,
                      ),
                      child: TextField(
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        //minLines: 1,//Normal textInputField will be displayed
                        //maxLines: 10,// when user presses enter it will adapt to it
                        maxLines: null,
                        decoration: InputDecoration(
                            suffix: IconButton(
                              color: Colors.grey,
                              icon: Icon(Icons.send),
                              onPressed: () {
                                print(commentController.text);
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
                  ),
                ),
                Flexible(
                  flex: 10,
                  child: Container(
                      child: loadComments == false
                          ? Align(
                              alignment: Alignment.topCenter,
                              child: loadCommentsButton())
                          : commentList()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //this loads the comments button
  Widget loadCommentsButton() {
    return FlatButton(
        color: Colors.grey[200],
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
    int lenthOfCommentList;
    if (comments.length > 3) {
      if (moreComments) {
        lenthOfCommentList = comments.length;
      } else {
        lenthOfCommentList = 3;
      }
    } else {
      lenthOfCommentList = comments.length;
    }
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.chat),
          title: Text(comments.length.toString() + '  Comments'),
        ),
        Flexible(
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: lenthOfCommentList,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: Colors.white10,
                    ),
                    backgroundColor: UIData.secondaryColor,
                  ),
                  title: Text(
                    comments[index]['text'],
                  ),
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
              }),
        ),
        (moreComments || comments.length <= 3)
            ? SizedBox(
                width: 0,
                height: 0,
              )
            : TextButton(
                onPressed: () {
                  setState(() {
                    moreComments = true;
                  });
                },
                child: Text("View More Comments"))
      ],
    );
  }
}
