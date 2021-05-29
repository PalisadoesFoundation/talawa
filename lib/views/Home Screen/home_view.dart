import 'package:flutter/material.dart';
import 'package:talawa/textstyles.dart';
import 'package:talawa/views/Home%20Screen/Home%20screen%20widgets/NewsPostWidget.dart';
import 'package:talawa/views/Home%20Screen/Home%20screen%20widgets/PinnedPostCarousel.dart';

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
          backgroundColor: Colors.white,
          title: const Text(
            'Organization Name',
            style: appBarTitle,
          ),
        ),
        body: ListView(
          children: [PinnedPostCarousel(), NewsPost(description: description)],
        ));
  }
}
