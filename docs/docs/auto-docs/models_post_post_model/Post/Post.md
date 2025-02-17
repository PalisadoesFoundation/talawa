
<div>

# Post constructor

</div>


Post({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    sId, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
    description, ]
3.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]
    createdAt, ]
4.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
    imageUrl, ]
5.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
    base64String, ]
6.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
    videoUrl, ]
7.  [required
    [[User](../../models_user_user_info/User-class.html)?]
    creator, ]
8.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)?]
    organization, ]
9.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[LikedBy](../../models_post_post_model/LikedBy-class.html)]\>]?]
    likedBy, ]
10. [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Comments](../../models_post_post_model/Comments-class.html)]\>]?]
    comments, ]

})



## Implementation

``` language-dart
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







1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [Post](../../models_post_post_model/Post-class.html)
4.  Post constructor

##### Post class







