<<<<<<< HEAD
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// the widget which contains the actual image.
///
class PostContainer extends StatefulWidget {
  const PostContainer({
    super.key,
    required this.photoUrl,
  });

  /// image url.
  ///
  final String? photoUrl;

  @override
  PostContainerState createState() => PostContainerState();
}

class PostContainerState extends State<PostContainer> {
  /// video was removed for mvp.
  ///
  bool startedPlaying = false;

  /// same as above.
  ///
  bool inView = true;
=======
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:talawa/models/attachments/attachment_model.dart';

/// Actual widget where files(images/videos) are displayed in a post.
class PostContainer extends StatefulWidget {
  const PostContainer({
    super.key,
    required this.fileAttachmentList,
  });

  /// Attachments of a post.
  final List<AttachmentModel>? fileAttachmentList;

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  /// Named constants for UI dimensions and spacing
  static const double _containerHeight = 250.0;
  static const double _errorIconSize = 48.0;
  static const double _indicatorSize = 8.0;
  static const double _indicatorSpacingHorizontal = 2.0;
  static const double _indicatorSpacingVertical = 8.0;

  /// Controller for multiple attachments.
  late final PageController controller;

  /// Index of current post displayed.
  int pindex = 0;
>>>>>>> upstream/develop

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
=======
    controller = PageController(initialPage: 0);
>>>>>>> upstream/develop
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

<<<<<<< HEAD
  /// manage the carousel.
  ///

  final PageController controller = PageController(initialPage: 0);

  /// to manage the image index in carousel.
  ///
  int pindex = 0;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(Random().nextInt(1000).toString()),
      onVisibilityChanged: (info) {
        info.visibleFraction > 0.5 ? inView = true : inView = false;
        if (mounted) setState(() {});
      },
      child: Center(
        child: widget.photoUrl != null
            ? Image.network(widget.photoUrl!)
            : Container(),
      ),
=======
  @override
  Widget build(BuildContext context) {
    final attachments = widget.fileAttachmentList ?? [];
    if (attachments.isEmpty) return Container();

    return Column(
      children: [
        SizedBox(
          height: _containerHeight,
          child: PageView.builder(
            controller: controller,
            itemCount: attachments.length,
            onPageChanged: (i) => setState(() => pindex = i),
            itemBuilder: (context, index) {
              final att = attachments[index];
              final mimeType = att.mimetype ?? '';
              if (mimeType.isEmpty) {
                return Center(
                  child: Text('MIME type is not available $mimeType'),
                );
              } else if (mimeType.startsWith('image/')) {
                return CachedNetworkImage(
                  imageUrl: att.url ?? '',
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: _errorIconSize,
                      color: Colors.grey,
                    ),
                  ),
                  cacheKey: att.url, // Using the URL as cache key
                );
              } else if (mimeType.startsWith('video/')) {
                // Handle video attachments.
                // This is a placeholder as video handling requires a video player and proper backend support.
                return const SizedBox();
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
        if (attachments.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              attachments.length,
              (i) => Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: _indicatorSpacingHorizontal,
                  vertical: _indicatorSpacingVertical,
                ),
                width: _indicatorSize,
                height: _indicatorSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pindex == i
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
              ),
            ),
          ),
      ],
>>>>>>> upstream/develop
    );
  }
}
