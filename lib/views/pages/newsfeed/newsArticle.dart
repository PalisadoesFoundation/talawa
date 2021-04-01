//the flutter packages are imported here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

//the pages are called here
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
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

  final TextEditingController commentController = TextEditingController();
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  bool loadComments = false;
  Timer timer = Timer();
  List comments = [];
  bool moreComments = false;
  bool isCommentAdded = false;

  Queries _query = Queries();
  List userDetails = [];
  String userID;
  String orgName;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future fetchUserDetails() async {
    userID = await preferences.getUserId();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': userID}));
    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException) {
      //print(result);
      setState(() {
        userDetails = result.data['users'];
      });
      //print(userDetails);
    }
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

//return profile image of current user
  Widget _profileImage() {
    return userDetails[0]['image'] != null
        ? CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                Provider.of<GraphQLConfiguration>(context).displayImgRoute +
                    userDetails[0]['image']))
        : CircleAvatar(
            radius: 45.0,
            backgroundColor: Colors.white,
            child: Text(
                userDetails[0]['firstName']
                        .toString()
                        .substring(0, 1)
                        .toUpperCase() +
                    userDetails[0]['lastName']
                        .toString()
                        .substring(0, 1)
                        .toUpperCase(),
                style: TextStyle(
                  color: UIData.primaryColor,
                )),
          );
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
    String queryText = '';
    if (commentController.text.isNotEmpty) {
      Fluttertoast.showToast(msg: "Adding Comment...");
      queryText = commentController.text.replaceAll("\n", newLineKey).trim();
      String mutation = Queries().createComments(widget.post['_id'], queryText);
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
    } else {
      Fluttertoast.showToast(msg: "Please write comment");
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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                SizedBox.expand(
                  child: FittedBox(
                    child: Image.asset(
                      UIData.shoppingImage,
                    ),
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
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10, 10, 10),
                    child: Text(
                      widget.post['text'].toString(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      maxLines: 10,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: ListTile(
                    leading: userDetails.isEmpty ? null : _profileImage(),
                    title: Container(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                        // minHeight: 20,
                      ),
                      child: TextFormField(
                        key: Key("leaveCommentField"),
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        validator: (String value) {
                          if (value.length > 500) {
                            return "Comment cannot be longer than 500 letters";
                          }
                          if (value.length == 0) {
                            return "Comment cannot be empty";
                          }
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(500)
                        ],
                        //minLines: 1,//Normal textInputField will be displayed
                        //maxLines: 10,// when user presses enter it will adapt to it
                        maxLines: null,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            key: Key("leaveCommentButton"),
                            color: Colors.grey,
                            icon: Icon(Icons.send),
                            onPressed: () {
                              print(commentController.text);
                              createComment();
                            },
                          ),
                          hintText: 'Leave a Comment...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                        ),
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

  // For getting length of Comments to be displayed
  int getCommentslength() {
    getPostComments();
    return comments.length;
  }

  // a new widget for comment list
  Widget commentList() {
    int lenthOfCommentList = getCommentslength();

    if (lenthOfCommentList > 3) {
      if (moreComments == false) {
        lenthOfCommentList = 3;
      }
    }

    return Column(
      children: [
        ListTile(
          key: ValueKey('commentIcon'),
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
