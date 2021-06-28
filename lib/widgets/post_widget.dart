import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/post_detailed_page.dart';

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
                            ? Theme.of(context).accentColor
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
