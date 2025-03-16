
<div>

# getPostsById method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
getPostsById(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    orgId, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
    after, ]
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
    before, ]
4.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
    first, ]
5.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
    last, ]

)



Getting Posts by Id.

**params**:

-   `orgId`: The organisation id
-   `after`: The cursor after which the posts are to be fetched
-   `before`: The cursor before which the posts are to be fetched
-   `first`: The number of posts to be fetched from the start
-   `last`: The number of posts to be fetched from the end

**returns**:

-   `String`: The query related to gettingPostsbyId



## Implementation

``` language-dart
String getPostsById(
  String orgId,
  String? after,
  String? before,
  int? first,
  int? last,
) 
```







1.  [talawa](../../index.md)
2.  [post_queries](../../utils_post_queries/)
3.  [PostQueries](../../utils_post_queries/PostQueries-class.md)
4.  getPostsById method

##### PostQueries class







