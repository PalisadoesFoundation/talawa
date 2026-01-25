import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:talawa/apptheme.dart';
<<<<<<< HEAD
=======
import 'package:talawa/models/post/post_model.dart';
>>>>>>> upstream/develop

import 'package:talawa/services/size_config.dart';

/// Pinned post screen.
///
class PinnedPostScreen extends StatefulWidget {
  const PinnedPostScreen({super.key, required this.post, this.cacheManager});

  /// Contains the data of the post.
  ///
<<<<<<< HEAD
  final Map<String, String> post;
=======
  final Post post;
>>>>>>> upstream/develop

  /// Custom avatar data.
  final BaseCacheManager? cacheManager;

  @override
  State<PinnedPostScreen> createState() => _PinnedPostScreenState();
}

class _PinnedPostScreenState extends State<PinnedPostScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.black38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
<<<<<<< HEAD
                widget.post['title']!,
=======
                widget.post.caption ?? '',
>>>>>>> upstream/develop
                maxLines: 2,
                style: AppTheme.title.copyWith(
                  color: Colors.white,
                  decorationThickness: 0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
<<<<<<< HEAD
                    '${widget.post['time']!}hr',
=======
                    widget.post.getPostPinnedDuration(),
>>>>>>> upstream/develop
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                      decorationThickness: 0,
                    ),
                  ),
                ),
              ],
            ),
            CachedNetworkImage(
              cacheManager: widget.cacheManager,
<<<<<<< HEAD
              imageUrl: widget.post['imageUrl']!,
              errorWidget: (context, url, error) {
                return const SizedBox(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
=======
              imageUrl: widget.post.attachments?.isNotEmpty == true
                  ? widget.post.attachments![0].url ?? ''
                  : '',
              errorWidget: (context, url, error) {
                return const Center(
                  child: Icon(Icons.broken_image, size: 48, color: Colors.grey),
>>>>>>> upstream/develop
                );
              },
              height: SizeConfig.screenHeight! * .75,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
