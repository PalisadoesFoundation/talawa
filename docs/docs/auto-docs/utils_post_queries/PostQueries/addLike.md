
<div>

# addLike method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Add Like to a post.

**params**: None

**returns**:

-   `String`: The query related to addingLike



## Implementation

``` language-dart
String  {
  return """
   mutation likePost(\$postID: ID!) {
    likePost( id: \$postID,)
    {
      _id
    }
  }
""";
}
```







1.  [talawa](../../index.html)
2.  [post_queries](../../utils_post_queries/)
3.  [PostQueries](../../utils_post_queries/PostQueries-class.html)
4.  addLike method

##### PostQueries class







