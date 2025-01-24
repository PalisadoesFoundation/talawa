




Post constructor - Post - post\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/post/post\_model.dart](../../models_post_post_model/models_post_post_model-library.html)
3. [Post](../../models_post_post_model/Post-class.html)
4. Post constructor

Post


dark\_mode

light\_mode




# Post constructor


Post({

1. required String sId,
2. String? description,
3. DateTime? createdAt,
4. String? imageUrl,
5. String? base64String,
6. String? videoUrl,
7. required [User](../../models_user_user_info/User-class.html)? creator,
8. [OrgInfo](../../models_organization_org_info/OrgInfo-class.html)? organization,
9. List<[LikedBy](../../models_post_post_model/LikedBy-class.html)>? likedBy,
10. List<[Comments](../../models_post_post_model/Comments-class.html)>? comments,

})

## Implementation

```
Post({
  required this.sId,
  this.description,
  this.createdAt,
  this.imageUrl,
  this.base64String,
  this.videoUrl,
  required this.creator,
  this.organization,
  this.likedBy,
  this.comments,
});
```

 


1. [talawa](../../index.html)
2. [post\_model](../../models_post_post_model/models_post_post_model-library.html)
3. [Post](../../models_post_post_model/Post-class.html)
4. Post constructor

##### Post class





talawa
1.0.0+1






