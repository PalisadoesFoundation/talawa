




build method - NewsPost class - post\_widget library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/post\_widget.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_widget/)
3. [NewsPost](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_widget/NewsPost-class.html)
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
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      surfaceTintColor: Theme.of(context).colorScheme.secondaryContainer,
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CustomAvatar(
              isImageNull: post.creator!.image == null,
              firstAlphabet:
                  post.creator!.firstName!.substring(0, 1).toUpperCase(),
              imageUrl:
                  "${'${GraphqlConfig.orgURI}'.replaceFirst('/graphql', '')}/${post.creator!.image}",
              fontSize: 20,
            ),
            title: Text(
              "${post.creator!.firstName} ${post.creator!.lastName}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            trailing: IconButton(
              key: const Key('reportButton'),
              onPressed: () => showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context1) => Container(
                  key: const Key('reportPost'),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                  ),
                  child: PostBottomModal(
                    post: post,
                    deletePost: deletePost,
                    function: function,
                  ),
                ),
              ),
              icon: Icon(
                Icons.report_gmailerrorred_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          post.imageUrl != null
              ? Container(
                  key: const Key('postParentContainer'),
                  height: 340,
                  color: Colors.white,
                  child: PostContainer(photoUrl: post.imageUrl),
                )
              : DescriptionTextWidget(text: post.description!),
          BaseView<LikeButtonViewModel>(
            onModelReady: (model) {
              model.initialize(post.likedBy ?? [], post.sId);
            },
            builder: (context, model, child) => Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            MultiReactButton(
                              toggle: () => model.toggleIsLiked(),
                            ),
                            Text(
                              "${model.likedBy.length}",
                              style: TextStyle(
                                fontFamily: 'open-sans',
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            GestureDetector(
                              key: const Key('commentButton'),
                              onTap: () => function?.call(post),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: (MediaQuery.sizeOf(context).width /
                                          392) *
                                      35,
                                  width: (MediaQuery.sizeOf(context).width /
                                          392) *
                                      35,
                                  child: SvgPicture.asset(
                                    'assets/images/comment.svg',
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "${post.comments!.length}",
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                        child: Text(
                          '    ${post.getPostCreatedDuration()}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => function?.call(post),
                        child: Text(
                          "${AppLocalizations.of(context)!.strictTranslate("Liked")} by ...",
                          style: TextStyle(
                            fontFamily: 'open-sans',
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (post.imageUrl != null)
                        DescriptionTextWidget(text: post.description!),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [post\_widget](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_widget/)
3. [NewsPost](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_widget/NewsPost-class.html)
4. build method

##### NewsPost class





talawa
1.0.0+1






