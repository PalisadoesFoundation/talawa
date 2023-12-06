import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:talawa/apptheme.dart';
import 'package:talawa/models/post/post_model.dart';

import 'package:talawa/services/size_config.dart';

/// Pinned post screen.
///
class PinnedPostScreen extends StatefulWidget {
  const PinnedPostScreen({super.key, required this.post, this.cacheManager});

  /// Contains the data of the post.
  ///
  final Post post;

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
                widget.post.description ?? '',
                maxLines: 2,
                style: AppTheme.title.copyWith(
                  color: Colors.white,
                  decorationThickness: 0,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.post.createdAt ?? ""}hr',
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
            ),
            Expanded(
              child: CachedNetworkImage(
                cacheManager: widget.cacheManager,
                 imageUrl:
                                    (widget.post.imageUrl ?? '').isEmpty
                                        ? 'placeHolderUrl'
                                        : widget.post.imageUrl!,
                                errorWidget: (context, url, error) {
                                  return const CircularProgressIndicator();
                                },
                height: SizeConfig.screenHeight! * .75,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
