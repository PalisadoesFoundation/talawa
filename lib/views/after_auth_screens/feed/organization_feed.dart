import 'package:flutter/material.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/pinned_carousel_widget.dart';
import 'package:talawa/widgets/post_list_widget.dart';

class OrganizationFeed extends StatelessWidget {
  const OrganizationFeed({required Key key, this.drawerKey}) : super(key: key);
  final GlobalKey<ScaffoldState>? drawerKey;

  @override
  Widget build(BuildContext context) {
    return BaseView<OrganizationFeedViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                model.currentOrgName,
                // "hii",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => drawerKey!.currentState!.openDrawer(),
              ),
            ),
            body: model.isBusy
                ? const CircularProgressIndicator()
                : RefreshIndicator(
                    onRefresh: () async => model.fetchNewPosts(),
                    child: ListView(
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
                    ),
                  ));
      },
    );
  }
}
