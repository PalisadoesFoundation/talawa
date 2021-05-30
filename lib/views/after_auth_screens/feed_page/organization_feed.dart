import 'package:flutter/material.dart';
import 'package:talawa/widgets/pinned_carousel_widget.dart';
import 'package:talawa/widgets/post_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String description =
        "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Organization Name',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
          ),
        ),
        body: ListView(
          children: [
            const PinnedPostCarousel(),
            const NewsPost(description: description)
          ],
        ));
  }
}
