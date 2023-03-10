// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/pinned_carousel_widget.dart';
import 'package:talawa/widgets/post_list_widget.dart';

/// OrganizationFeed returns a widget that shows the feed of the organization.
class OrganizationFeed extends StatelessWidget {
  const OrganizationFeed({
    required Key key,
    this.homeModel,
    this.forTest = false,
  }) : super(key: key);
  final MainScreenViewModel? homeModel;
  final bool forTest;

  @override
  Widget build(BuildContext context) {
    return BaseView<OrganizationFeedViewModel>(
      onModelReady: (model) => model.initialise(isTest: forTest),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            // AppBar returns a widget for the header of the page.
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              model.currentOrgName,
              key: homeModel?.keySHOrgName,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
            leading: IconButton(
              key: homeModel?.keySHMenuIcon,
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () =>
                  MainScreenViewModel.scaffoldKey.currentState!.openDrawer(),
            ),
          ),
          // if the model is fetching the data then renders Circular Progress Indicator else renders the result.
          body: model.isBusy
              ? const CircularProgressIndicator()
              : RefreshIndicator(
                  onRefresh: () async => model.fetchNewPosts(),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      // If the organization has pinned posts then renders PinnedPostCarousel widget else Container.
                      model.pinnedPosts.isNotEmpty
                          ? PinnedPostCarousel(
                              key: homeModel?.keySHPinnedPost,
                              pinnedPosts: model.pinnedPosts,
                              navigateToPinnedPostPage:
                                  model.navigateToPinnedPostPage,
                              navigateToIndividualPostPage:
                                  model.navigateToIndividualPage,
                            )
                          : Container(),
                      // If the organization has posts then renders PostListWidget widget else Container.
                      model.posts.isNotEmpty
                          ? PostListWidget(
                              key: homeModel?.keySHPost,
                              posts: model.posts,
                              function: model.navigateToIndividualPage,
                            )
                          : Container(),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
