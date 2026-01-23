import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/pinned_post.dart';
import 'package:talawa/widgets/post_list_widget.dart';

/// OrganizationFeed returns a widget that shows the feed of the organization.
class OrganizationFeed extends StatefulWidget {
  const OrganizationFeed({
    required Key key,
    this.homeModel,
  }) : super(key: key);

  /// MainScreenViewModel.
  final MainScreenViewModel? homeModel;

  @override
  State<OrganizationFeed> createState() => _OrganizationFeedState();
}

class _OrganizationFeedState extends State<OrganizationFeed> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  /// This function is used to listen to the scroll events and fetch more posts when the user scrolls to the bottom.
  ///
  /// **params**:
  /// * `model`: The OrganizationFeedViewModel instance.
  ///
  /// **returns**:
  ///   None
  Future<void> _scrollListener(OrganizationFeedViewModel model) async {
    // Check if we're at the bottom for pagination and if more data is available
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_isLoadingMore && model.hasMore) {
        setState(() {
          _isLoadingMore = true;
        });
        model.nextPage();
        setState(() {
          _isLoadingMore = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<OrganizationFeedViewModel>(
      onModelReady: (model) async {
        model.initialise();
        _scrollController.addListener(() {
          _scrollListener(model);
        });
      },
      builder: (context, model, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            heroTag: "org_feed_fab",
            shape: const CircleBorder(side: BorderSide.none),
            key: const Key('floating_action_btn'),
            backgroundColor: Colors.green,
            onPressed: () {
              navigationService.pushScreen('/addpostscreen');
            },
            child: Icon(
              Icons.add,
              size: SizeConfig.screenHeight! * 0.045,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              model.currentOrgName,
              key: widget.homeModel?.keySHOrgName,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
            ),
            leading: IconButton(
              key: widget.homeModel?.keySHMenuIcon,
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                // Open the drawer if it exists
                Scaffold.maybeOf(context)?.openDrawer();
              },
            ),
          ),
          // if the model is fetching the data then renders Circular Progress Indicator else renders the result.
          body: model.isFetchingPosts || model.isBusy
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: () async => model.fetchNewPosts(),
                  // Using ListView.builder for efficient, lazy loading of feed items.
                  // This prevents memory spikes and scroll jank when the feed is large.
                  child: ListView.builder(
                    controller: _scrollController,
                    key: const Key('listView'),
                    itemCount: (model.pinnedPosts.isNotEmpty ? 1 : 0) +
                      (model.posts.isNotEmpty ? 1 : 0) +
                      (model.posts.isEmpty && model.pinnedPosts.isEmpty
                        ? 1
                        : 0) +
                      ((_isLoadingMore && model.hasMore) ? 1 : 0),
                    itemBuilder: (context, index) {
                      int currentIndex = 0;
                      // Show pinned posts if available
                      if (model.pinnedPosts.isNotEmpty) {
                        if (index == currentIndex) {
                          return PinnedPost(
                            key: const Key('pinnedPosts'),
                            pinnedPost: model.pinnedPosts,
                          );
                        }
                        currentIndex++;
                      }
                      // Show posts if available
                      if (model.posts.isNotEmpty) {
                        if (index == currentIndex) {
                          return Column(
                            children: [
                              SizedBox(
                                height: SizeConfig.screenHeight! * 0.01,
                              ),
                              PostListWidget(
                                key: widget.homeModel?.keySHPost,
                                posts: model.posts,
                                redirectToIndividualPage:
                                    model.navigateToIndividualPage,
                                deletePost: model.removePost,
                              ),
                            ],
                          );
                        }
                        currentIndex++;
                      }
                      // Show no posts message if no posts
                      if (model.posts.isEmpty && model.pinnedPosts.isEmpty) {
                        if (index == currentIndex) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: SizeConfig.screenHeight! * 0.21,
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.strictTranslate(
                                    'There are no posts in this organization',
                                  ),
                                  style: TextStyle(
                                    fontSize: SizeConfig.screenHeight! * 0.026,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  navigationService
                                      .pushScreen('/addpostscreen');
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.strictTranslate(
                                    'Create your first post',
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        currentIndex++;
                      }
                      // Show end-of-list loader if loading more and hasMore
                      if (_isLoadingMore && model.hasMore) {
                        if (index == currentIndex) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.screenHeight! * 0.02,
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
        );
      },
    );
  }
}
