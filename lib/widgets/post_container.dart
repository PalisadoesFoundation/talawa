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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
    );
  }
}
