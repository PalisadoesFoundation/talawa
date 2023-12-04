import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/pinned_post.dart';
import 'package:talawa/widgets/post_list_widget.dart';

/// OrganizationFeed returns a widget that shows the feed of the organization.
class OrganizationFeed extends StatelessWidget {
  const OrganizationFeed({
    required Key key,
    this.homeModel,
    this.forTest = false,
  }) : super(key: key);

  /// MainScreenViewModel.
  final MainScreenViewModel? homeModel;

  /// To implement the test.
  final bool forTest;

  @override
  Widget build(BuildContext context) {
    return BaseView<OrganizationFeedViewModel>(
      onModelReady: (model) => model.initialise(isTest: forTest),
      builder: (context, model, child) {
        print(model.posts);
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(side: BorderSide.none),
            key: const Key('floating_action_btn'),
            backgroundColor: Colors.green,
            onPressed: () {
              navigationService.pushScreen('/addpostscreen');
            },
            child: const Icon(
              Icons.add,
              size: 35,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            // AppBar returns a widget for the header of the page.
            backgroundColor: Colors.green,
            // Theme.of(context).primaryColor,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              model.currentOrgName,
              key: homeModel?.keySHOrgName,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                  ),
            ),
            leading: IconButton(
              key: homeModel?.keySHMenuIcon,
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                MainScreenViewModel.scaffoldKey.currentState!.openDrawer();
              },
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
                          ? PinnedPost(pinnedPost: model.pinnedPosts)
                          : Container(),
                      // If the organization has posts then renders PostListWidget widget else Container.
                      model.posts.isNotEmpty
                          ? PostListWidget(
                              key: homeModel?.keySHPost,
                              posts: model.posts,
                              function: model.navigateToIndividualPage,
                              deletePost: model.removePost,
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
