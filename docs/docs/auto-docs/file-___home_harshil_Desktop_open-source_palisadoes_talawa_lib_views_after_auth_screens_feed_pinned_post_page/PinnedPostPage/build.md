




build method - PinnedPostPage class - pinned\_post\_page library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/feed/pinned\_post\_page.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_pinned_post_page/)
3. [PinnedPostPage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_pinned_post_page/PinnedPostPage-class.html)
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
  return Scaffold(
    appBar: AppBar(
      iconTheme: Theme.of(context).iconTheme,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
      title: Text(
        AppLocalizations.of(context)!.strictTranslate('Pinned Posts'),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
      ),
    ),
    body: ListView(
      children: [PostListWidget(posts: pinnedPosts)],
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [pinned\_post\_page](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_pinned_post_page/)
3. [PinnedPostPage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_pinned_post_page/PinnedPostPage-class.html)
4. build method

##### PinnedPostPage class





talawa
1.0.0+1






