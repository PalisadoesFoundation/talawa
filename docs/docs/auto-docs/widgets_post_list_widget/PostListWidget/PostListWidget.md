
<div>

# PostListWidget constructor

</div>


const PostListWidget({

1.  [[[Key](https://api.flutter.dev/flutter/foundation/Key-class.md)?]
    key, ]
2.  [required
    [[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../../models_post_post_model/Post-class.md)]\>]]
    posts, ]
3.  [dynamic
    function(]
    1.  [[[Post](../../models_post_post_model/Post-class.md)]]

    )?,
4.  [dynamic
    deletePost(]
    1.  [[[Post](../../models_post_post_model/Post-class.md)]]

    )?,

})



## Implementation

``` language-dart
const PostListWidget({
  super.key,
  required this.posts,
  this.function,
  this.deletePost,
});
```







1.  [talawa](../../index.md)
2.  [post_list_widget](../../widgets_post_list_widget/)
3.  [PostListWidget](../../widgets_post_list_widget/PostListWidget-class.md)
4.  PostListWidget const constructor

##### PostListWidget class







