




PostListWidget constructor - PostListWidget - post\_list\_widget library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/post\_list\_widget.dart](../../widgets_post_list_widget/widgets_post_list_widget-library.html)
3. [PostListWidget](../../widgets_post_list_widget/PostListWidget-class.html)
4. PostListWidget const constructor

PostListWidget


dark\_mode

light\_mode




# PostListWidget constructor


const
PostListWidget({

1. [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key,
2. required List<[Post](../../models_post_post_model/Post-class.html)> posts,
3. dynamic function(
   1. [Post](../../models_post_post_model/Post-class.html))?,
4. dynamic deletePost(
   1. [Post](../../models_post_post_model/Post-class.html))?,

})

## Implementation

```
const PostListWidget({
  super.key,
  required this.posts,
  this.function,
  this.deletePost,
});
```

 


1. [talawa](../../index.html)
2. [post\_list\_widget](../../widgets_post_list_widget/widgets_post_list_widget-library.html)
3. [PostListWidget](../../widgets_post_list_widget/PostListWidget-class.html)
4. PostListWidget const constructor

##### PostListWidget class





talawa
1.0.0+1






