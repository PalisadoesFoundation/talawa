




build method - CommentTemplate class - individual\_post library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/feed/individual\_post.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/)
3. [CommentTemplate](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/CommentTemplate-class.html)
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
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const CircleAvatar(),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).iconTheme.color!.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "${comment.creator!.firstName!} ${comment.creator!.lastName!}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Text(
                comment.text!,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
```

 


1. [talawa](../../index.html)
2. [individual\_post](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/)
3. [CommentTemplate](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/CommentTemplate-class.html)
4. build method

##### CommentTemplate class





talawa
1.0.0+1






