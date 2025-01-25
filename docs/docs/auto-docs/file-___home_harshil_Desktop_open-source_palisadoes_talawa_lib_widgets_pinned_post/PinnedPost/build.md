




build method - PinnedPost class - pinned\_post library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/pinned\_post.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/)
3. [PinnedPost](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/PinnedPost-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
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
                              print(error);
                              return const SizedBox(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
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
```

 


1. [talawa](../../index.html)
2. [pinned\_post](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/)
3. [PinnedPost](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_post/PinnedPost-class.html)
4. build method

##### PinnedPost class





talawa
1.0.0+1






