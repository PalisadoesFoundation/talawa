
<div>

# addNewpost method

</div>


void addNewpost(

1.  [[[Post](../../models_post_post_model/Post-class.html)]
    newPost]

)



Method to add newly created post at the very top of the feed.

**params**:

-   `newPost`: new post made by user to add in feed

**returns**: None



## Implementation

``` language-dart
void addNewpost(Post newPost) {
  if (!_posts.contains(newPost)) {
    _posts.insert(0, newPost);
  }
  _postStreamController.add(_posts);
}
```







1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  addNewpost method

##### PostService class







