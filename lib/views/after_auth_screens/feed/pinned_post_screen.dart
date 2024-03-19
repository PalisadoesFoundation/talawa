import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:talawa/apptheme.dart';

import 'package:talawa/services/size_config.dart';

/// Pinned post screen.
///
class PinnedPostScreen extends StatefulWidget {
  const PinnedPostScreen({super.key, required this.post, this.cacheManager});

  /// Contains the data of the post.
  ///
  final Map<String, String> post;

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
                widget.post['title']!,
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
                    '${widget.post['time']!}hr',
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
              imageUrl: widget.post['imageUrl']!,
              errorWidget: (context, url, error) {
                return Center(
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal! * 16,
                    // Adjust the width to change the size of the circular indicator
                    height: SizeConfig.safeBlockVertical! * 8,
                    // Adjust the height to change the size of the circular indicator
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      // Maintain a 1:1 aspect ratio for a circular shape
                      child: CircularProgressIndicator(
                        strokeWidth: 4.0,
                      ),
                    ),
                  ),
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
