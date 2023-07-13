// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/post_detailed_page.dart';
import 'package:talawa/widgets/video_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
            borderRadius: BorderRadius.all(Radius.circular(16)),),
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
                        color: Colors.black38,),
                  ),
                  Text(
                    '    ${post.getPostCreatedDuration()}',
                    style: const TextStyle(color: Colors.black38, fontSize: 12),
                  )
                ],
              ),
              // subtitle: Text(post.getPostCreatedDuration()),
            ),
            // DescriptionTextWidget(text: post.description!),
            Container(
              height: 380,
              color: Colors.white,
              child: PostContainer(id: post.sId),
            ),
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
                                    'assets/images/🦆 icon _like_.svg',),
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
                                    'assets/images/comment.svg',),
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
                        // GestureDetector(
                        //   onTap: () => function != null ? function!(post) : {},
                        //   child: Padding(
                        //     padding: EdgeInsets.only(left: 18.0),
                        //     child: SvgPicture.asset('assets/images/repost.svg'),
                        //     // child: Icon(
                        //     //   Icons.comment,
                        //     //   color: Color(0xff737373),
                        //     // ),
                        //   ),
                        // ),

                        DescriptionTextWidget(text: post.description!),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10,),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostContainer extends StatefulWidget {
  const PostContainer({
    required this.id,
    Key? key,
  }) : super(key: key);
  final String id;

  @override
  PostContainerState createState() => PostContainerState();
}

class PostContainerState extends State<PostContainer> {
  bool startedPlaying = false;
  bool inView = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final PageController controller = PageController(initialPage: 0);
  int pindex = 0;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.id),
      onVisibilityChanged: (info) {
        info.visibleFraction > 0.5 ? inView = true : inView = false;
        if (mounted) setState(() {});
      },
      child: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                pindex = index;
                inView = pindex == 0;
              });
            },
            children: List.generate(
              4,
              (index) =>
                  // index == 0
                  // ? Center(
                  //     child: VideoWidget(
                  //       url:
                  //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                  //       play: inView,
                  //     ),
                  //   )
                  // :
                  const Image(
                image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    children: [
                      for (int i = 0; i < 4; i++)
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Divider(
                              thickness: 3.0,
                              color: pindex == i
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey,
                            ),
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
