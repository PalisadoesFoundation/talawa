import 'package:flutter/material.dart';
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
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const PinnedPostCarousel(),
        ListTile(
          leading: CustomAvatar(
            isImageNull: post.creator!.image == null,
            firstAlphabet:
                post.creator!.firstName!.substring(0, 1).toUpperCase(),
            imageUrl: post.creator!.image,
            fontSize: 24,
          ),
          title: Text(
            "${post.creator!.firstName} ${post.creator!.lastName}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          subtitle: Text(post.getPostCreatedDuration()),
        ),
        DescriptionTextWidget(text: post.description!),
        Container(
          height: 400,
          color: Theme.of(context).colorScheme.primaryVariant.withOpacity(0.5),
          child: PostContainer(id: post.sId),
        ),
        BaseView<LikeButtonViewModel>(
          onModelReady: (model) =>
              model.initialize(post.likedBy ?? [], post.sId),
          builder: (context, model, child) => Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => function != null ? function!(post) : {},
                      child: Text(
                        "${model.likedBy.length} ${AppLocalizations.of(context)!.strictTranslate("Likes")}",
                        style: const TextStyle(
                            fontFamily: 'open-sans',
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => function != null ? function!(post) : {},
                        child: Text(
                            "${post.comments!.length} ${AppLocalizations.of(context)!.strictTranslate("comments")}"))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        model.toggleIsLiked();
                      },
                      child: Icon(
                        Icons.thumb_up,
                        color: model.isLiked
                            ? Theme.of(context).colorScheme.secondary
                            : const Color(0xff737373),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => function != null ? function!(post) : {},
                        child: const Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Icon(
                            Icons.comment,
                            color: Color(0xff737373),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
        setState(() {});
      },
      child: Stack(children: [
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
            (index) => index == 0
                ? Center(
                    child: VideoWidget(
                        url:
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                        play: inView))
                : const Image(
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                    horizontal: 100.0, vertical: 10.0),
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
      ]),
    );
  }
}
