
<div>

# removeLike method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Remove Like from a post.

**params**: None

**returns**:

-   `String`: The query related to removingLike



## Implementation

``` language-dart
String  {
  return """
   mutation unlikePost(\$postID: ID!) {
    unlikePost( id: \$postID,)
    {
      _id
      likedBy{
      _id
      }
    }
  }
""";
}
```







1.  [talawa](../../index.md)
2.  [post_queries](../../utils_post_queries/)
3.  [PostQueries](../../utils_post_queries/PostQueries-class.md)
4.  removeLike method

##### PostQueries class







