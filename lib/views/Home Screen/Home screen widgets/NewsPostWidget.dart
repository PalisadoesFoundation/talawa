import 'package:flutter/material.dart';
import 'package:talawa/views/Home%20Screen/Home%20screen%20widgets/PostDescriptionWidget.dart';

class NewsPost extends StatelessWidget {
  const NewsPost({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const PinnedPostCarousel(),
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Color(0xFF737373),
          ),
          title: const Text("Rutvik Chandla"),
          subtitle: const Text("3m"),
        ),
        DescriptionTextWidget(text: description),
        Container(
          height: 400,
          color: Theme.of(context).colorScheme.primaryVariant.withOpacity(0.5),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1,165 Likes",
                style: TextStyle(
                    fontFamily: 'open-sans', fontWeight: FontWeight.w800),
              ),
              Text("10 comments")
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Color(0XFF737373),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Icon(
                  Icons.comment,
                  color: Color(0XFF737373),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
