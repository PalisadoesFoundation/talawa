
//the flutter packages are imported here
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//the pages are called here
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/timer.dart';

const String newLineKey = "@123TALAWA321@";          
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
  bool isCommentAdded = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
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
    String queryText='';
    if (commentController.text.isNotEmpty) {
        Fluttertoast.showToast(
        msg: "Adding Comment...");
        queryText =
          commentController.text.replaceAll("\n", newLineKey).trim();
      String mutation =
          Queries().createComments(widget.post['_id'],queryText);
      Map result = await apiFunctions.gqlmutation(mutation);
      print(result);
       if (result == null) {
        Fluttertoast.showToast(
          msg: "Sorry, this comment could not be posted.",
        );
      } else {
        isCommentAdded = true;
        FocusScope.of(context).requestFocus(FocusNode());
        commentController.text = '';
        Fluttertoast.showToast(
          msg: "Comment added.",
        );
      }
    }
    else{
       Fluttertoast.showToast(
        msg: "Please write comment");
    }
  }

  String addNewline(String rawComment) {
    rawComment = rawComment.replaceAll(newLineKey, "\n");
    return rawComment;
  }
  //main build starts here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.of(context).pop(isCommentAdded);
                },
              ),
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
                title:  Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                    minHeight: 20,
                  ),
                child: TextField(
                  textInputAction:  TextInputAction.newline,
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
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.chat),
          title: Text(comments.length.toString() + '  Comments'),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                title: Text(
                  addNewline(comments[index]['text'])
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
            })
      ],
    );
  }
}
