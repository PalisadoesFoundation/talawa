import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';


/// a_line_ending_with_end_punctuation.
///
/// more_info_if_required
class PinnedPost extends StatelessWidget {
  const PinnedPost({super.key, required this.pinnedPost, required this.model});

  /// contains the pinned post.
  ///
  final List<Post> pinnedPost;

  /// gives access mainScreenViewModel's attributes.
  final MainScreenViewModel model;

  /// a_line_ending_with_end_punctuation.
  ///
  /// more_info_if_required
  static const List<Map<String, String>> pinnedPosts = [
    {
      'title': 'Church Meeting',
      'postId': 'hdkahfu567',
      'imageUrl':
          'https://i2-prod.manchestereveningnews.co.uk/incoming/article25630061.ece/ALTERNATES/s615/2_Church-PA.jpg',
      'time': '1',
    },
    {
      'title': 'Russia-Ukraine war leads to Hike in Gas prices in Europe.',
      'postId': 'hfkajhk669',
      'imageUrl':
          'https://gdb.voanews.com/3B960F7F-786C-452C-8ABD-9D5AEEAED9D9.jpg',
      'time': '3',
    },
    {
      'title': 'Flood in near village.',
      'postId': 'adadada555',
      'imageUrl':
          'https://www.deccanherald.com/sites/dh/files/styles/article_detail/public/articleimages/2022/08/03/file7m4trf3i92e1krs53cn6-1132513-1659475940.jpg?itok=oVs3TTP8',
      'time': '3',
    },
    {
      'title': 'The craze behind auto-tech stocks.',
      'postId': 'nvikaebkf',
      'imageUrl':
          'https://akm-img-a-in.tosshub.com/businesstoday/images/assets/202303/stock-market-02136-4-sixteen_nine.jpg',
      'time': '7',
    },
    {
      'title': 'High seas treaty',
      'postId': 'nfqbkbd',
      'imageUrl':
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/A194/production/_128846314_humpbackwhale.jpg',
      'time': '5',
    },
    {
      'title': 'WWE Wrestking and Gambling',
      'postId': 'dadadada',
      'imageUrl':
          'https://staticc.sportskeeda.com/editor/2023/03/a9b3a-16783664764772-1920.jpg',
      'time': '6',
    },
    {
      'title': 'Dead of Silicon Valley Bank.',
      'postId': 'hfkaaddadajhk669',
      'imageUrl':
          'https://thechainsaw.com/wp-content/uploads/2023/03/2023-50.jpg?w=1200',
      'time': '7',
    },
    {
      'title': 'What if women were paid for chores',
      'postId': 'kofapjfn',
      'imageUrl':
          'https://www.shethepeople.tv/wp-content/uploads/2019/06/household.png',
      'time': '8',
    },
    {
      'title': 'Debate over stocks bybacks.',
      'postId': 'agdjvfhsjaf',
      'imageUrl':
          'https://m.wsj.net/video/20200105/wsjglossarystockbuybackssplash/wsjglossarystockbuybackssplash_640x360.jpg',
      'time': '9',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('hello'),
      child: pinnedPost.isNotEmpty
          ? SizedBox(
              height: SizeConfig.screenHeight! * 0.28,
              child: ListView.builder(
                itemCount: pinnedPost.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  key: index == 0 ? model.keySHPinnedPost : const Key(''),
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 7,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // final Map<String, dynamic> arg = {"index": "$index","post": pinnedPost};
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PinnedPostScreen(
                            post: toMap(index),
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: SizeConfig.screenWidth! / 4.1,
                      child: Column(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              cacheKey: pinnedPost[index].sId,
                              imageUrl:
                                  (pinnedPost[index].imageUrl ?? '').isEmpty
                                      ? 'placeHolderUrl'
                                      : pinnedPost[index].imageUrl!,
                              errorWidget: (context, url, error) {
                                return const CircularProgressIndicator();
                              },
                              height: SizeConfig.screenHeight! * 0.15,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Text(
                                    getTimeDifferenceInHours(
                                      pinnedPost[index]
                                          .createdAt!
                                          .toIso8601String(),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            pinnedPost[index].description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Container(
              key: const Key('hi'),
            ),
    );
  }

  /// converts date time to hrs.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `createdAtString`: the time from post
  ///
  /// **returns**:
  /// * `String`: return a string
  String getTimeDifferenceInHours(String createdAtString) {
    final DateTime now = DateTime.now();
    final DateTime createdAt = DateTime.parse(createdAtString).toLocal();
    final Duration difference = now.difference(createdAt);
    final int hours = difference.inHours;
    return '$hours hrs';
  }

  /// converts post to mapped string.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `index`: current index
  ///
  /// **returns**:
  /// * `Map<String, String>`: returns a map
  Map<String, String> toMap(int index) {
    return {
      'title': this.pinnedPost[index].description!,
      'postId': this.pinnedPost[index].sId,
      'imageUrl': this.pinnedPost[index].imageUrl!,
      'time': getTimeDifferenceInHours(
        this.pinnedPost[index].createdAt!.toIso8601String(),
      ),
    };
  }
}
