import 'package:flutter/material.dart';
import 'package:talawa/view_model/organization_feed_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_drawer.dart';
import 'package:talawa/widgets/pinned_carousel_widget.dart';
import 'package:talawa/widgets/post_list_widget.dart';

class OrganizationFeed extends StatelessWidget {
  const OrganizationFeed({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OrganizationFeedViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
          drawer: const CustomDrawer(),
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
                            navigateToPinnedPostPage:
                                model.navigateToPinnedPostPage,
                            navigateToIndividualPostPage:
                                model.navigateToIndividualPage,
                          )
                        : Container(),
                    model.posts.isNotEmpty
                        ? PostListWidget(
                            posts: model.posts,
                            function: model.navigateToIndividualPage,
                          )
                        : Container(),
                  ],
                )),
    );
  }
}
