//the flutter packages are imported here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:talawa/model/posts.dart';
import 'package:talawa/services/app_localization.dart';

//the pages are called here
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/view_models/newwfeed_view_model/new_article_page_view_model.dart';
import 'package:talawa/views/base_view.dart';

const String newLineKey = "@123TALAWA321@";

// ignore: must_be_immutable
class NewsArticle extends StatefulWidget {
  const NewsArticle({Key key, @required this.index, @required this.post})
      : super(key: key);
  final Posts post;
  final int index;

  @override
  _NewsArticleState createState() => _NewsArticleState();
}

class _NewsArticleState extends State<NewsArticle> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  //return profile image of current user
  Widget _profileImage(NewsArticleViewModel model) {
    return model.userDetails[0]['image'] != null
        ? CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                Provider.of<GraphQLConfiguration>(context).displayImgRoute +
                    model.userDetails[0]['image'].toString()))
        : CircleAvatar(
            radius: 45.0,
            backgroundColor: Colors.white,
            child: Text(
                model.userDetails[0]['firstName']
                        .toString()
                        .substring(0, 1)
                        .toUpperCase() +
                    model.userDetails[0]['lastName']
                        .toString()
                        .substring(0, 1)
                        .toUpperCase(),
                style: const TextStyle(
                  color: UIData.primaryColor,
                )),
          );
  }

  //main build starts here
  @override
  Widget build(BuildContext context) {
    return BaseView<NewsArticleViewModel>(
      onModelReady: (model) =>
          model.initialize(widget.post, widget.index, context),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(model.isCommentAdded);
          return true;
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(model.isCommentAdded);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(
                          UIData.shoppingImage,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          widget.post.title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30.0),
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
                          widget.post.text,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          maxLines: 10,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: ListTile(
                        leading: model.userDetails.isEmpty
                            ? null
                            : _profileImage(model),
                        title: Container(
                          constraints: const BoxConstraints(
                            maxHeight: double.infinity,
                            // minHeight: 20,
                          ),
                          child: TextFormField(
                            key: const Key("leaveCommentField"),
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            validator: (String value) {
                              if (value.length > 500) {
                                return AppLocalizations.of(context).translate(
                                    "Comment cannot be longer than 500 letters");
                              }
                              if (value.isEmpty) {
                                return AppLocalizations.of(context)
                                    .translate("Comment cannot be empty");
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
                                key: const Key("leaveCommentButton"),
                                color: Colors.grey,
                                icon: const Icon(Icons.send),
                                onPressed: () {
                                  print(model.commentController.text);
                                  model.createComment();
                                },
                              ),
                              hintText:
                                  '${AppLocalizations.of(context).translate("Leave a Comment")}...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                            controller: model.commentController,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 10,
                      child: Container(
                          child: model.showLoadComments == false
                              ? Align(
                                  alignment: Alignment.topCenter,
                                  child: loadCommentsButton(model))
                              : commentList(model)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //this loads the comments button
  Widget loadCommentsButton(NewsArticleViewModel model) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[200]),
      ),
      onPressed: () {
        model.changeLoading(value: true);
      },
      child: Text(
        AppLocalizations.of(context).translate('Load Comments'),
        style: const TextStyle(color: Colors.black54),
      ),
    );
  }

  // a new widget for comment list
  Widget commentList(NewsArticleViewModel model) {
    int lenthOfCommentList = model.getCommentslength();

    if (lenthOfCommentList > 3) {
      if (model.moreComments == false) {
        lenthOfCommentList = 3;
      }
    }

    return Column(
      children: [
        ListTile(
          key: const ValueKey('commentIcon'),
          leading: const Icon(Icons.chat),
          title: Text(
              '${model.comments.length}  ${AppLocalizations.of(context).translate("Comments")}'),
        ),
        Flexible(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: lenthOfCommentList,
              itemBuilder: (context, index) {
                final Map<String, dynamic> creator =
                    model.comments[index]['creator'] as Map<String, dynamic>;
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: UIData.secondaryColor,
                    child: Icon(
                      Icons.person,
                      color: Colors.white10,
                    ),
                  ),
                  title: Text(
                    model.comments[index]['text'].toString(),
                  ),
                  subtitle: Row(
                    children: [
                      Text('${creator['firstName']} ${creator['lastName']}'),
                      const Text(
                        " - ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(model.commentTime(index)),
                    ],
                  ),
                );
              }),
        ),
        (model.moreComments || model.comments.length <= 3)
            ? const SizedBox(
                width: 0,
                height: 0,
              )
            : TextButton(
                onPressed: () {
                  model.showMoreComments(value: true);
                },
                child: Text(AppLocalizations.of(context)
                    .translate("View More Comments")))
      ],
    );
  }
}
