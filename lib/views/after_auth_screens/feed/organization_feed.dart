import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/pinned_post.dart';
import 'package:talawa/widgets/post_widget.dart';

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
    // Check if we're at the bottom for pagination
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_isLoadingMore) {
        setState(() {
          _isLoadingMore = true;
        });
        await model.nextPage();
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
        await model.initialise();
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
              key: widget.homeModel?.keys.keySHOrgName,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
            ),
            leading: IconButton(
              key: widget.homeModel?.keys.keySHMenuIcon,
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
                  onRefresh: () async => await model.refreshPosts(),
                  child: model.posts.isEmpty && model.pinnedPosts.isEmpty
                      ? ListView(
                          key: const Key('listView'),
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: SizeConfig.screenHeight! * 0.21,
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .strictTranslate(
                                      'There are no posts in this organization',
                                    ),
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.screenHeight! * 0.026,
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
                                    AppLocalizations.of(context)!
                                        .strictTranslate(
                                      'Create your first post',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          key: const Key('listView'),
                          itemCount: (model.pinnedPosts.isNotEmpty ? 1 : 0) +
                              1 + // For SizedBox
                              (model.posts.isEmpty ? 1 : model.posts.length) +
                              (_isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            int currentIndex = index;

                            // 1. Pinned Post
                            if (model.pinnedPosts.isNotEmpty) {
                              if (currentIndex == 0) {
                                return PinnedPost(
                                  key: const Key('pinnedPosts'),
                                  pinnedPost: model.pinnedPosts,
                                );
                              }
                              currentIndex--;
                            }

                            // 2. SizedBox (Spacer)
                            if (currentIndex == 0) {
                              return SizedBox(
                                height: SizeConfig.screenHeight! * 0.01,
                              );
                            }
                            currentIndex--;

                            // 3. Empty State
                            if (model.posts.isEmpty) {
                              if (currentIndex == 0) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: SizeConfig.screenHeight! * 0.21,
                                      ),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .strictTranslate(
                                          'There are no posts in this organization',
                                        ),
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.screenHeight! * 0.026,
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
                                        AppLocalizations.of(context)!
                                            .strictTranslate(
                                          'Create your first post',
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }

                            // 4. Posts
                            if (currentIndex < model.posts.length) {
                              final post = model.posts[currentIndex];
                              return PostWidget(
                                key: ValueKey(post.id),
                                post: post,
                                redirectToIndividualPage:
                                    model.navigateToIndividualPage,
                                deletePost: model.deletePost,
                              );
                            }

                            // 5. Loading Indicator
                            if (_isLoadingMore) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.screenHeight! * 0.02,
                                ),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
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
