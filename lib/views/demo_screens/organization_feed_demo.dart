import 'package:flutter/material.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/utils/app_localization.dart';
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

  /// List of dummy pinned posts.
  static List<Post> pinnedPosts = [
    Post(
      id: '1',
      caption: 'Church Meeting',
      attachments: [
        AttachmentModel(
          url:
              'https://i2-prod.manchestereveningnews.co.uk/incoming/article25630061.ece/ALTERNATES/s615/2_Church-PA.jpg',
        ),
      ],
      createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
    ),
    Post(
      id: '2',
      caption: 'Russia-Ukraine war leads to Hike in Gas prices in Europe.',
      attachments: [
        AttachmentModel(
          url:
              'https://gdb.voanews.com/3B960F7F-786C-452C-8ABD-9D5AEEAED9D9.jpg',
        ),
      ],
      createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
    ),
    Post(
      id: '3',
      caption: 'Flood in near village.',
      attachments: [
        AttachmentModel(
          url:
              'https://erepublic.brightspotcdn.com/dims4/default/4e37784/2147483647/strip/true/crop/940x490+0+68/resize/840x438!/quality/90/?url=http%3A%2F%2Ferepublic-brightspot.s3.us-west-2.amazonaws.com%2Fce%2F69%2F6caac7fe2454d0fb0922defc950d%2Fshutterstock-506444641.jpg',
        ),
      ],
      createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
    ),
    Post(
      id: '4',
      caption: 'The craze behind auto-tech stocks.',
      attachments: [
        AttachmentModel(
          url:
              'https://akm-img-a-in.tosshub.com/businesstoday/images/assets/202303/stock-market-02136-4-sixteen_nine.jpg',
        ),
      ],
      createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
    ),
    Post(
      id: '5',
      caption: 'High seas treaty',
      attachments: [
        AttachmentModel(
          url:
              'https://ichef.bbci.co.uk/news/976/cpsprodpb/A194/production/_128846314_humpbackwhale.jpg',
        ),
      ],
      createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
    ),
    Post(
      id: '6',
      caption: 'WWE Wrestking and Gambling',
      attachments: [
        AttachmentModel(
          url:
              'https://staticc.sportskeeda.com/editor/2023/03/a9b3a-16783664764772-1920.jpg',
        ),
      ],
      createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
    ),
    Post(
      id: '7',
      caption: 'Dead of Silicon Valley Bank.',
      attachments: [
        AttachmentModel(
          url:
              'https://thechainsaw.com/wp-content/uploads/2023/03/2023-50.jpg?w=1200',
        ),
      ],
      createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
    ),
    Post(
      id: '8',
      caption: 'What if women were paid for chores',
      attachments: [
        AttachmentModel(
          url:
              'https://www.shethepeople.tv/wp-content/uploads/2019/06/household.png',
        ),
      ],
      createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
    ),
    Post(
      id: '9',
      caption: 'Debate over stocks bybacks.',
      attachments: [
        AttachmentModel(
          url:
              'https://m.wsj.net/video/20200105/wsjglossarystockbuybackssplash/wsjglossarystockbuybackssplash_640x360.jpg',
        ),
      ],
      createdAt: DateTime.tryParse('2023-12-14T08:30:00Z'),
    ),
  ];

  /// function returns a widget that shows the feed of the organization.
  ///
  /// **params**:
  /// * `context`: build context of the widget.
  ///
  /// **returns**:
  /// * `Widget`: returns a widget that shows the feed of the organization.
  Widget demoOrganisationFeedPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar returns a widget for the header of the page.
        backgroundColor: Colors.green,
        // Theme.of(context).primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.strictTranslate("Organisation Name"),
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
            pinnedPost: pinnedPosts,
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
