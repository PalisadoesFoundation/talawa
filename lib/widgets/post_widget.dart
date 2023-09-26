import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/post_container.dart';
import 'package:talawa/widgets/post_detailed_page.dart';

class NewsPost extends StatelessWidget {
  const NewsPost({
    Key? key,
    required this.post,
    this.function,
  }) : super(key: key);

  final Post post;
  final Function(Post)? function;

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
            // const PinnedPostCarousel(),
            ListTile(
              leading: CustomAvatar(
                isImageNull: post.creator!.image == null,
                firstAlphabet:
                    post.creator!.firstName!.substring(0, 1).toUpperCase(),
                imageUrl: post.creator!.image,
                fontSize: 20,
              ),
              title: Row(
                children: [
                  Text(
                    "${post.creator!.firstName} ${post.creator!.lastName}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38,
                    ),
                  ),
                  const SizedBox(
                    width: 115,
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              ),
                            ),
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Icon(
                                      Icons.report_gmailerrorred_outlined,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      navigationService.showTalawaErrorSnackBar(
                                        'Your Report has been sent to the Admin',
                                        MessageType.info,
                                      );
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Report the post to the Admin',
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 20,
                                        fontFamily: 'open-sans',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
              // subtitle: Text(post.getPostCreatedDuration()),
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
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16.0),
                  //   child: Divider(),
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // decoration: BoxDecoration(color: Colors.green),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  model.toggleIsLiked();
                                },
                                child: SvgPicture.asset(
                                  'assets/images/🦆 icon _like_.svg',
                                ),
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
                          // decoration: BoxDecoration(color: Colors.black38),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    function != null ? function!(post) : {},
                                child: SvgPicture.asset(
                                  'assets/images/comment.svg',
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
                          padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
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
                            "${AppLocalizations.of(context)!.strictTranslate("Liked")} by Ayush Chaudhary...",
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
