import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/post_list_widget.dart';

/// User Feed to shows posts by user in current organisation.
class UserFeed extends StatefulWidget {
  const UserFeed({
    required Key key,
    this.forTest = false,
  }) : super(key: key);

  final bool forTest;

  @override
  State<UserFeed> createState() => _UserFeedState();
}

class _UserFeedState extends State<UserFeed>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BaseView<OrganizationFeedViewModel>(
      onModelReady: (model) => model.initialise(isTest: widget.forTest),
      builder: (context, model, child) {
        model.userPosts.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
        return Scaffold(
          body: model.isFetchingPosts
              ? const Center(child: CircularProgressIndicator())
              : (model.userPosts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You have no post in this organization',
                            style: TextStyle(
                              fontSize: SizeConfig.screenHeight! * 0.0275,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              navigationService.pushScreen('/addpostscreen');
                            },
                            child: const Text('Create your first post'),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: PostListWidget(
                        key: const Key('UserPostWidget'),
                        posts: model.userPosts,
                        function: model.navigateToIndividualPage,
                        deletePost: model.removePost,
                      ),
                    )),
        );
      },
    );
  }
}
