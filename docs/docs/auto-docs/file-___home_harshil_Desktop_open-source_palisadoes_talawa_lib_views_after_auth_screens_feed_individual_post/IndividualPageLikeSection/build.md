




build method - IndividualPageLikeSection class - individual\_post library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/feed/individual\_post.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/)
3. [IndividualPageLikeSection](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/IndividualPageLikeSection-class.html)
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
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildPadding(
        context,
        AppLocalizations.of(context)!.strictTranslate(
          "Liked by",
        ),
      ),
      Row(
        children: [
          // Looping through the usersLiked list,
          for (int i = 0; i < usersLiked.length; i++)
            // renders the custom widget for invidual user.
            likedUserCircleAvatar(usersLiked[i]),
        ],
      ),
    ],
  );
}
```

 


1. [talawa](../../index.html)
2. [individual\_post](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/)
3. [IndividualPageLikeSection](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/IndividualPageLikeSection-class.html)
4. build method

##### IndividualPageLikeSection class





talawa
1.0.0+1






