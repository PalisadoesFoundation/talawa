import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
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
      children: [
        // const PinnedPostCarousel(),
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Color(0xFF737373),
          ),
          title: Text(
            "${post.creator!.firstName} ${post.creator!.lastName}",
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: const Text("3m"),
        ),
        DescriptionTextWidget(text: post.description!),
        Container(
          height: 400,
          color: Theme.of(context).colorScheme.primaryVariant.withOpacity(0.5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => function != null ? function!(post) : {},
                child: Text(
                  "${post.likedBy!.length} Likes",
                  style: const TextStyle(
                      fontFamily: 'open-sans', fontWeight: FontWeight.w800),
                ),
              ),
              GestureDetector(
                  onTap: () => function != null ? function!(post) : {},
                  child: Text("${post.comments!.length} comments"))
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Row(
            children: [
              const Icon(
                Icons.thumb_up,
                color: Color(0xff737373),
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
    );
  }
}
