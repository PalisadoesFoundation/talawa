import 'dart:math';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PostContainer extends StatefulWidget {
  const PostContainer({
    Key? key,
    required this.photoUrl,
  }) : super(key: key);
  final String? photoUrl;

  @override
  PostContainerState createState() => PostContainerState();
}

class PostContainerState extends State<PostContainer> {
  bool startedPlaying = false;
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

  final PageController controller = PageController(initialPage: 0);
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
            ? Image(
                image: NetworkImage(
                  widget.photoUrl != null
                      ? widget.photoUrl!
                      : 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                ),
              )
            : Container(),
      ),
    );
  }
}
