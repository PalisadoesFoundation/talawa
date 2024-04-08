import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';

/// a_line_ending_with_end_punctuation.
///
/// more_info_if_required
class PinnedPost extends StatelessWidget {
  const PinnedPost({super.key, required this.pinnedPost, required this.model});

  /// contains the pinned post.
  ///
  final List<Post> pinnedPost;

  /// gives access mainScreenViewModel's attributes.
  final MainScreenViewModel model;

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
                  key: index == 0 ? model.keySHPinnedPost : const Key(''),
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 7,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // final Map<String, dynamic> arg = {"index": "$index","post": pinnedPost};
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PinnedPostScreen(
                            post: toMap(index),
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
                              cacheKey: pinnedPost[index].sId,
                              imageUrl:
                                  (pinnedPost[index].imageUrl ?? '').isEmpty
                                      ? 'placeHolderUrl'
                                      : pinnedPost[index].imageUrl!,
                              errorWidget: (context, url, error) {
                                return const SizedBox(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                              height: SizeConfig.screenHeight! * 0.15,
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
                                    getTimeDifferenceInHours(
                                      pinnedPost[index]
                                          .createdAt!
                                          .toIso8601String(),
                                    ),
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

  /// converts date time to hrs.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `createdAtString`: the time from post
  ///
  /// **returns**:
  /// * `String`: return a string
  String getTimeDifferenceInHours(String createdAtString) {
    final DateTime now = DateTime.now();
    final DateTime createdAt = DateTime.parse(createdAtString).toLocal();
    final Duration difference = now.difference(createdAt);
    final int hours = difference.inHours;
    return '$hours hrs';
  }

  /// converts post to mapped string.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `index`: current index
  ///
  /// **returns**:
  /// * `Map<String, String>`: returns a map
  Map<String, String> toMap(int index) {
    return {
      'title': this.pinnedPost[index].description!,
      'postId': this.pinnedPost[index].sId,
      'imageUrl': this.pinnedPost[index].imageUrl!,
      'time': getTimeDifferenceInHours(
        this.pinnedPost[index].createdAt!.toIso8601String(),
      ),
    };
  }
}
