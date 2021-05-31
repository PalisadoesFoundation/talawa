import 'package:flutter/material.dart';
import 'package:talawa/viewModel/organization_feed_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/pinned_carousel_widget.dart';
import 'package:talawa/widgets/post_widget.dart';

class OrganizationFeed extends StatelessWidget {
  const OrganizationFeed({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OrganizationFeedViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
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
          body: model.isBusy
              ? const CircularProgressIndicator()
              : ListView(
                  children: [
                    model.pinnedPosts.isNotEmpty
                        ? PinnedPostCarousel(
                            pinnedPosts: model.pinnedPosts,
                          )
                        : Container(),
                    model.posts.isNotEmpty
                        ? Column(
                            children: [
                              for (int i = 0; i < model.posts.length; i++)
                                Column(
                                  children: [
                                    NewsPost(post: model.posts[i]),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      child: Divider(
                                        height: 8,
                                        thickness: 8,
                                      ),
                                    )
                                  ],
                                )
                            ],
                          )
                        : Container(),
                  ],
                )),
    );
  }
}
