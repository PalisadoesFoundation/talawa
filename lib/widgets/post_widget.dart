import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/multi_reaction.dart';
import 'package:talawa/widgets/post_container.dart';
import 'package:talawa/widgets/post_detailed_page.dart';
import 'package:talawa/widgets/post_modal.dart';

/// Stateless class to show the fetched post.
///
/// entirely ui based widget
class NewsPost extends StatelessWidget {
  const NewsPost({
    super.key,
    required this.post,
    this.function,
    this.deletePost,
  });

  /// Post object containing all the data related to the post.
  ///
  /// see the post model to get more information regarding this
  final Post post;

  /// This function is passed for the handling the action to be performed when the comment button is clicked.
  ///
  /// to see the function check the place where the widget is called.
  final Function(Post)? function;

  /// To delete the post if user can.
  ///
  /// only work if the post is made by the user
  final Function(Post)? deletePost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CustomAvatar(
                isImageNull: post.creator!.image == null,
                firstAlphabet:
                    post.creator!.firstName!.substring(0, 1).toUpperCase(),
                imageUrl:
                    "${'${GraphqlConfig.orgURI}'.replaceFirst('/graphql', '')}/${post.creator!.image}",
                fontSize: 20,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${post.creator!.firstName} ${post.creator!.lastName}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context1) {
                          return Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              ),
                            ),
                            child: PostBottomModal(
                              post: post,
                              deletePost: deletePost,
                              function: function,
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.report_gmailerrorred_outlined,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
            post.imageUrl == null
                ? DescriptionTextWidget(text: post.description!)
                : Container(),
            post.imageUrl != null
                ? Container(
                    height: 380,
                    color: Colors.white,
                    child: PostContainer(photoUrl: post.imageUrl),
                  )
                : Container(),
            BaseView<LikeButtonViewModel>(
              onModelReady: (model) {
                model.initialize(post.likedBy ?? [], post.sId);
              },
              builder: (context, model, child) => Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              MultiReactButton(
                                toggle: () {
                                  model.toggleIsLiked();
                                },
                              ),
                              Text(
                                "${model.likedBy.length}",
                                style: const TextStyle(
                                  fontFamily: 'open-sans',
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    function != null ? function!(post) : {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: (MediaQuery.sizeOf(context).width /
                                            392) *
                                        35,
                                    width: (MediaQuery.sizeOf(context).width /
                                            392) *
                                        35,
                                    child: SvgPicture.asset(
                                      'assets/images/comment.svg',
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "${post.comments!.length}",
                                style: const TextStyle(
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                          child: Text(
                            '    ${post.getPostCreatedDuration()}',
                            style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => function != null ? function!(post) : {},
                          child: Text(
                            //TODO: Currently the Liked Model contain on SID of USER who liked the post, thus my name here
                            "${AppLocalizations.of(context)!.strictTranslate("Liked")} by ...",
                            style: const TextStyle(
                              fontFamily: 'open-sans',
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        post.imageUrl != null
                            ? DescriptionTextWidget(text: post.description!)
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
