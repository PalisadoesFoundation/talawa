import 'package:flutter/material.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/widgets/pinned_post.dart';

/// OrganizationFeed returns a widget that shows the feed of the organization.
class DemoOrganizationFeed extends StatelessWidget {
  const DemoOrganizationFeed({
    required Key key,
    this.homeModel,
    this.forTest = false,
  }) : super(key: key);

  /// MainScreenViewModel.
  final MainScreenViewModel? homeModel;

  /// To implement the test.
  final bool forTest;

  Widget demoOrganisationFeedPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar returns a widget for the header of the page.
        backgroundColor: Colors.green,
        // Theme.of(context).primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Organisation Name",
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
      body: ListView(
        shrinkWrap: true,
        children: [
          // If the organization has pinned posts then renders PinnedPostCarousel widget else Container.
          PinnedPost(
            pinnedPost: [],
            model: homeModel!,
          ),
          // If the organization has posts then renders PostListWidget widget else Container.
          Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return demoOrganisationFeedPage(context);
  }
}
