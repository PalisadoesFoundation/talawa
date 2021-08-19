import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/widgets/post_widget.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({
    Key? key,
    required this.posts,
    this.function,
  }) : super(key: key);
  final List<Post> posts;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return InViewNotifierList(
      contextCacheCount: 15,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      initialInViewIds: ['0'],
      isInViewPortCondition:
          (double deltaTop, double deltaBottom, double viewPortDimension) {
        return deltaTop < (0.5 * viewPortDimension) &&
            deltaBottom > (0.5 * viewPortDimension);
      },
      itemCount: posts.length,
      builder: (BuildContext context, int index) {
        return InViewNotifierWidget(
          id: '$index',
          builder: (BuildContext context, bool isInView, Widget? child) {
            return Column(
              children: [
                NewsPost(
                  post: posts[index],
                  function: function,
                  isInView: isInView,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(
                    height: 8,
                    thickness: 8,
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
