import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';

/// PinnedPost returns a widget that shows the pinned post.
class PinnedPost extends StatefulWidget {
  const PinnedPost(
      {super.key,
      required this.pinnedPost,
      required this.model,
      required this.fetchNextPinnedPosts});

  /// contains the pinned post.
  final List<Post> pinnedPost;

  /// gives access mainScreenViewModel's attributes.
  final MainScreenViewModel model;

  /// Callback function to fetch the next set of pinned posts.
  final VoidCallback fetchNextPinnedPosts;

  @override
  State<PinnedPost> createState() => _PinnedPostState();
}

class _PinnedPostState extends State<PinnedPost> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.fetchNextPinnedPosts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('hello'),
      child: widget.pinnedPost.isNotEmpty
          ? SizedBox(
              height: SizeConfig.screenHeight! * 0.28,
              child: ListView.builder(
                itemCount: widget.pinnedPost.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  key:
                      index == 0 ? widget.model.keySHPinnedPost : const Key(''),
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 7,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PinnedPostScreen(
                            post: widget.pinnedPost[index],
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
                              cacheKey: widget.pinnedPost[index].id,
                              imageUrl: widget.pinnedPost[index].attachments
                                          ?.isNotEmpty ==
                                      true
                                  ? widget.pinnedPost[index].attachments![0]
                                          .url ??
                                      ''
                                  : '',
                              errorWidget: (context, url, error) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  widget.pinnedPost[index]
                                      .getPostPinnedDuration(),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.pinnedPost[index].caption ?? '',
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
