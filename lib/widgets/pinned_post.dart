import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';

class PinnedPost extends StatelessWidget {
  const PinnedPost({Key? key, required this.pinnedPost}) : super(key: key);
  final List<Post> pinnedPost;
  static const List<Map<String, String>> pinnedPosts = [
    {
      'title': 'Church Meeting',
      'postId': 'hdkahfu567',
      'imageUrl':
      'https://i2-prod.manchestereveningnews.co.uk/incoming/article25630061.ece/ALTERNATES/s615/2_Church-PA.jpg',
      'time': '1'
    },
    {
      'title': 'Russia-Ukraine war leads to Hike in Gas prices in Europe.',
      'postId': 'hfkajhk669',
      'imageUrl':
      'https://gdb.voanews.com/3B960F7F-786C-452C-8ABD-9D5AEEAED9D9.jpg',
      'time': '3'
    },
    {
      'title': 'Flood in near village.',
      'postId': 'adadada555',
      'imageUrl':
      'https://www.deccanherald.com/sites/dh/files/styles/article_detail/public/articleimages/2022/08/03/file7m4trf3i92e1krs53cn6-1132513-1659475940.jpg?itok=oVs3TTP8',
      'time': '3'
    },
    {
      'title': 'The craze behind auto-tech stocks.',
      'postId': 'nvikaebkf',
      'imageUrl':
      'https://akm-img-a-in.tosshub.com/businesstoday/images/assets/202303/stock-market-02136-4-sixteen_nine.jpg',
      'time': '7'
    },
    {
      'title': 'High seas treaty',
      'postId': 'nfqbkbd',
      'imageUrl':
      'https://ichef.bbci.co.uk/news/976/cpsprodpb/A194/production/_128846314_humpbackwhale.jpg',
      'time': '5'
    },
    {
      'title': 'WWE Wrestking and Gambling',
      'postId': 'dadadada',
      'imageUrl':
      'https://staticc.sportskeeda.com/editor/2023/03/a9b3a-16783664764772-1920.jpg',
      'time': '6'
    },
    {
      'title': 'Dead of Silicon Valley Bank.',
      'postId': 'hfkaaddadajhk669',
      'imageUrl':
      'https://thechainsaw.com/wp-content/uploads/2023/03/2023-50.jpg?w=1200',
      'time': '7'
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
      child: pinnedPosts.isNotEmpty
          ? SizedBox(
        height: SizeConfig.screenHeight! * 0.25,
        child: ListView.builder(
          itemCount: pinnedPosts.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: GestureDetector(
              onTap: (){
                // final Map<String, dynamic> arg = {"index": "$index","post": pinnedPosts};
                navigationService.pushScreen('/pinnedpostscreen', arguments: pinnedPosts[index]);
              },
              child: SizedBox(
                width: SizeConfig.screenWidth! / 4.1,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      cacheKey: pinnedPosts[index]['postId'],
                      imageUrl:
                      (pinnedPosts[index]['imageUrl'] ?? '').isEmpty
                          ? 'placeHolderUrl'
                          : pinnedPosts[index]['imageUrl']!,
                      errorWidget: (context, url, error) {
                        return const CircularProgressIndicator();
                      },
                      height: SizeConfig.screenHeight! * 0.15,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${pinnedPosts[index]['time']!}hr',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      pinnedPosts[index]['title']!,
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
          : Container(),
    );
  }
}





