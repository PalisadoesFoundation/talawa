import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:video_player/video_player.dart';

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
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child:
                        Icon(Icons.broken_image, size: 48, color: Colors.grey),
                  ),
                  cacheKey: att.url, // Using the URL as cache key
                );
              } else if (mimeType.startsWith('video/')) {
                return _VideoPlayerWidget(url: att.url ?? '');
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

/// Basic video player class to show video.
class _VideoPlayerWidget extends StatefulWidget {
  const _VideoPlayerWidget({required this.url});

  /// url of the video to be played.
  final String url;

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {
          _initialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        VideoProgressIndicator(_controller, allowScrubbing: true),
        Align(
          alignment: Alignment.center,
          child: IconButton(
            icon: Icon(
              _controller.value.isPlaying
                  ? Icons.pause_circle
                  : Icons.play_circle,
              size: 48,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
          ),
        ),
      ],
    );
  }
}
