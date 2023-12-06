import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';

/// a_line_ending_with_end_punctuation.
///
/// more_info_if_required
class PinnedPost extends StatelessWidget {
  const PinnedPost({super.key, required this.pinnedPost});

  /// contains the pinned post.
  ///
  final List<Post> pinnedPost;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('hello'),
      child: pinnedPost.isNotEmpty
          ? SizedBox(
              height: SizeConfig.screenHeight! * 0.28,
              child: ListView.builder(
                itemCount: pinnedPost.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // final Map<String, dynamic> arg = {"index": "$index","post": pinnedPosts};
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            PinnedPostScreen(post: pinnedPost[index]),
                      ));
                    },
                    child: SizedBox(
                      width: SizeConfig.screenWidth! / 4.1,
                      child: Column(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              cacheKey: pinnedPost[index].sId,
                              imageUrl:
                                  (pinnedPost[index].imageUrl ?? '').isEmpty
                                      ? 'placeHolderUrl'
                                      : pinnedPost[index].imageUrl!,
                              errorWidget: (context, url, error) {
                                return const CircularProgressIndicator();
                              },
                              height: SizeConfig.screenHeight! * 0.15,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${pinnedPost[index].createdAt!}hr',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            pinnedPost[index].description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Container(
              key: const Key('hi'),
            ),
    );
  }
}
