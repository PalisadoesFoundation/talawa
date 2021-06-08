import 'package:flutter/material.dart';
import 'package:talawa/view_model/organization_feed_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/pinned_carousel_widget.dart';
import 'package:talawa/widgets/post_list_widget.dart';

class OrganizationFeed extends StatelessWidget {
  const OrganizationFeed({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OrganizationFeedViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
          drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).iconTheme.color!.withOpacity(0.2),
                        child: Text(
                          "R",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 40),
                        ),
                      ),
                      accountName: Text("Rutvik Chandla"),
                      accountEmail: Text("Selected Organization"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8.0),
                      child: Text(
                        "Switch Organization",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Container(
                      height: 250,
                      child: ListView.builder(
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(),
                            title: Text(
                              'Organization ${index}',
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.add,
                        size: 30,
                      ),
                      title: Text("Join new Organization"),
                      trailing: Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.switch_right,
                        size: 30,
                      ),
                      title: Text("Switch Organization"),
                      trailing: Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    children: [
                      Text(
                        'from',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        'PALISADOES',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
