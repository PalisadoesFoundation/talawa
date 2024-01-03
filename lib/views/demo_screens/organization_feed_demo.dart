import 'package:flutter/material.dart';
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

  /// a_line_ending_with_end_punctuation.
  ///
  /// more_info_if_required
  static const List<Map<String, String>> pinnedPosts = [
    {
      'text': 'Church Meeting',
      '_id': 'hdkahfu567',
      'imageUrl':
          'https://i2-prod.manchestereveningnews.co.uk/incoming/article25630061.ece/ALTERNATES/s615/2_Church-PA.jpg',
      'createdAt': '2023-12-14T08:30:00Z',
    },
    {
      'text': 'Russia-Ukraine war leads to Hike in Gas prices in Europe.',
      '_id': 'hfkajhk669',
      'imageUrl':
          'https://gdb.voanews.com/3B960F7F-786C-452C-8ABD-9D5AEEAED9D9.jpg',
      'createdAt': '2023-12-14T08:30:00Z',
    },
    {
      'text': 'Flood in near village.',
      '_id': 'adadada555',
      'imageUrl':
          'https://www.deccanherald.com/sites/dh/files/styles/article_detail/public/articleimages/2022/08/03/file7m4trf3i92e1krs53cn6-1132513-1659475940.jpg?itok=oVs3TTP8',
      'createdAt': '2023-12-14T08:30:00Z',
    },
    {
      'text': 'The craze behind auto-tech stocks.',
      '_id': 'nvikaebkf',
      'imageUrl':
          'https://akm-img-a-in.tosshub.com/businesstoday/images/assets/202303/stock-market-02136-4-sixteen_nine.jpg',
      'createdAt': '2023-12-14T08:30:00Z',
    },
    {
      'text': 'High seas treaty',
      '_id': 'nfqbkbd',
      'imageUrl':
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/A194/production/_128846314_humpbackwhale.jpg',
      'createdAt': '2023-12-14T08:30:00Z',
    },
    {
      'text': 'WWE Wrestking and Gambling',
      '_id': 'dadadada',
      'imageUrl':
          'https://staticc.sportskeeda.com/editor/2023/03/a9b3a-16783664764772-1920.jpg',
      'createdAt': '2023-12-14T08:30:00Z',
    },
    {
      'text': 'Dead of Silicon Valley Bank.',
      '_id': 'hfkaaddadajhk669',
      'imageUrl':
          'https://thechainsaw.com/wp-content/uploads/2023/03/2023-50.jpg?w=1200',
      'createdAt': '2023-12-14T08:30:00Z',
    },
    {
      'text': 'What if women were paid for chores',
      '_id': 'kofapjfn',
      'imageUrl':
          'https://www.shethepeople.tv/wp-content/uploads/2019/06/household.png',
      'createdAt': '2023-12-14T08:30:00Z',
    },
    {
      'text': 'Debate over stocks bybacks.',
      '_id': 'agdjvfhsjaf',
      'imageUrl':
          'https://m.wsj.net/video/20200105/wsjglossarystockbuybackssplash/wsjglossarystockbuybackssplash_640x360.jpg',
      'createdAt': '2023-12-14T08:30:00Z',
    },
  ];

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
            pinnedPost: pinnedPosts.map((map) => Post.fromJson(map)).toList(),
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
