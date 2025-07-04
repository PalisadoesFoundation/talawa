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
  /// Controller for multiple attachments.
  final PageController controller = PageController(initialPage: 0);

  /// Index of current post displayed.
  int pindex = 0;

  @override
  Widget build(BuildContext context) {
    final attachments = widget.fileAttachmentList ?? [];
    if (attachments.isEmpty) return Container();

    return Column(
      children: [
        SizedBox(
          height: 250,
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
                    child:
                        Icon(Icons.broken_image, size: 48, color: Colors.grey),
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
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                width: 8,
                height: 8,
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
    );
  }
}
