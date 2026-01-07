import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/post_list_widget.dart';

/// User Feed to shows posts by user in current organisation.
class UserFeed extends StatefulWidget {
  const UserFeed({
    required Key key,
    this.forTest = false,
  }) : super(key: key);

  /// for testing.
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
      onModelReady: (model) => model.initialise(),
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
                            AppLocalizations.of(context)!.strictTranslate(
                              'You have no post in this organization',
                            ),
                            style: TextStyle(
                              fontSize: SizeConfig.screenHeight! * 0.026,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              navigationService.pushScreen('/addpostscreen');
                            },
                            child: Text(
                              AppLocalizations.of(context)!.strictTranslate(
                                'Create your first post',
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: PostListWidget(
                        key: const Key('UserPostWidget'),
                        posts: model.userPosts,
                        redirectToIndividualPage:
                            model.navigateToIndividualPage,
                        deletePost: model.deletePost,
                      ),
                    )),
        );
      },
    );
  }
}
