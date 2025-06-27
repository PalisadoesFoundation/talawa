import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';

/// PinnedPost returns a widget that shows the pinned post.
class PinnedPost extends StatelessWidget {
  const PinnedPost({
    super.key,
    required this.pinnedPost,
  });

  /// contains the pinned post.
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
                    top: 7,
                  ),
                  child: GestureDetector(
                    key: Key('GestureDetectorPinnedPost$index'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PinnedPostScreen(
                            post: pinnedPost[index],
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: SizeConfig.screenWidth! / 4.1,
                      child: Column(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              cacheKey: pinnedPost[index].id,
                              imageUrl: pinnedPost[index]
                                          .attachments
                                          ?.isNotEmpty ==
                                      true
                                  ? pinnedPost[index].attachments![0].url ?? ''
                                  : '',
                              errorWidget: (context, url, error) {
                                return const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Text(
                                    pinnedPost[index].getPostPinnedDuration(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            pinnedPost[index].caption ?? '',
                            maxLines: 1,
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
