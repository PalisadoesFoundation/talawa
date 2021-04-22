//the flutter packages are imported here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/post_controller.dart';

//the pages are called here
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/apiFunctions.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/timer.dart';

const String newLineKey = "@123TALAWA321@";

// ignore: must_be_immutable
class NewsArticle extends StatefulWidget {
  int index;
  Map post;

  NewsArticle({Key key, @required this.index, @required this.post})
      : super(key: key);

  @override
  _NewsArticleState createState() => _NewsArticleState();
}

class _NewsArticleState extends State<NewsArticle> {
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  TextEditingController commentController;
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  bool showLoadComments = false;
  Timer timer = Timer();
  List comments = [];
  bool moreComments = false;
  bool isCommentAdded = false;
  int index;
  Map post;

  Queries _query = Queries();
  List userDetails = [];
  String userID;
  String orgName;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  PostController postController;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController(
        text: Provider.of<CommentHandler>(context, listen: false)
            .comment(widget.post["_id"]));
    fetchUserDetails();
    index = widget.index;
    post = widget.post;
    commentController.addListener(_notifyData);
  }

  void _notifyData() {
    Provider.of<CommentHandler>(context, listen: false)
        .commentEntry(widget.post["_id"], commentController.text);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getPostComments();
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
    String mutation = Queries().getPostsComments(post['_id']);
    Map result = await apiFunctions.gqlmutation(mutation);
    comments = result == null ? [] : result['commentsByPost'].reversed.toList();
  }

  //this method helps us to create any comments we are willing to
  Future createComment() async {
    FocusScope.of(context).unfocus();
    String queryText = '';
    if (commentController.text.isNotEmpty) {
      Fluttertoast.showToast(msg: "Adding Comment...");
      queryText = commentController.text.replaceAll("\n", newLineKey).trim();
      Map result = await Queries().createComments(post['_id'], queryText);
      print(result);
      if (result == null) {
        Fluttertoast.showToast(
          msg: "Sorry, this comment could not be posted.",
        );
      } else {
        isCommentAdded = true;
        FocusScope.of(context).requestFocus(FocusNode());
        commentController.text = '';
        await Fluttertoast.showToast(
          msg: "Comment added.",
        );
        postController.addComment(index, result["createComment"]);
      }
    } else {
      Fluttertoast.showToast(msg: "Please write comment");
    }
  }

  //get time of comment
  String commentTime(int index) {
    Duration commentTimeDuration = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(
          int.parse(comments[index]['createdAt'])),
    );

    String timeText = '';

    if (commentTimeDuration.inMinutes < 1) {
      if (commentTimeDuration.inSeconds == 1) {
        timeText = ' second ago';
      } else {
        timeText = ' seconds ago';
      }
      return commentTimeDuration.inSeconds.toString() + timeText;
    } else if (commentTimeDuration.inHours < 1) {
      if (commentTimeDuration.inMinutes == 1) {
        timeText = ' min ago';
      } else {
        timeText = ' mins ago';
      }
      return commentTimeDuration.inMinutes.toString() + timeText;
    } else if (commentTimeDuration.inDays < 1) {
      if (commentTimeDuration.inHours == 1) {
        timeText = ' hour ago';
      } else {
        timeText = ' hours ago';
      }
      return commentTimeDuration.inHours.toString() + timeText;
    } else if (commentTimeDuration.inDays < 7) {
      if (commentTimeDuration.inDays == 1) {
        timeText = ' day ago';
      } else {
        timeText = ' days ago';
      }
      return commentTimeDuration.inDays.toString() + timeText;
    } else if (commentTimeDuration.inDays < 52) {
      int weeks = commentTimeDuration.inDays ~/ 7;
      if (weeks == 1) {
        timeText = ' week ago';
      } else {
        timeText = ' weeks ago';
      }
      return weeks.toString() + timeText;
    } else {
      int years = commentTimeDuration.inDays ~/ 365;
      if (years == 1) {
        timeText = ' year ago';
      } else {
        timeText = ' years ago';
      }
      return years.toString() + timeText;
    }
  }

  String addNewline(String rawComment) {
    rawComment = rawComment.replaceAll(newLineKey, "\n");
    return rawComment;
  }

  //main build starts here
  @override
  Widget build(BuildContext context) {
    return Consumer<PostController>(
      builder: (context, controller, child) {
        postController = controller;
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
                          post['title'].toString(),
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
                          child: showLoadComments == false
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
      },
    );
  }

  //this loads the comments button
  Widget loadCommentsButton() {
    return FlatButton(
        color: Colors.grey[200],
        onPressed: () {
          setState(() {
            showLoadComments = true;
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
                      Text(commentTime(index)),
                      // Text(timer.hoursOrDays(comments[index]['createdAt']))
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
