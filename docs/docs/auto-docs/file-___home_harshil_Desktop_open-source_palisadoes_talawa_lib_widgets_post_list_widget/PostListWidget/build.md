




build method - PostListWidget class - post\_list\_widget library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/post\_list\_widget.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_list_widget/)
3. [PostListWidget](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_list_widget/PostListWidget-class.html)
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
  return ListView.builder(
    scrollDirection: Axis.vertical,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: posts.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          NewsPost(
            key: ValueKey(posts[index].sId),
            post: posts[index],
            function: function,
            deletePost: deletePost,
          ),
        ],
      );
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [post\_list\_widget](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_list_widget/)
3. [PostListWidget](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_list_widget/PostListWidget-class.html)
4. build method

##### PostListWidget class





talawa
1.0.0+1






