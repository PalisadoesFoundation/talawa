




removeLike method - PostQueries class - post\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/post\_queries.dart](../../utils_post_queries/utils_post_queries-library.html)
3. [PostQueries](../../utils_post_queries/PostQueries-class.html)
4. removeLike method

removeLike


dark\_mode

light\_mode




# removeLike method


String
removeLike()

Remove Like from a post.

**params**:
None

**returns**:

* `String`: The query related to removingLike

## Implementation

```
String removeLike() {
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

 


1. [talawa](../../index.html)
2. [post\_queries](../../utils_post_queries/utils_post_queries-library.html)
3. [PostQueries](../../utils_post_queries/PostQueries-class.html)
4. removeLike method

##### PostQueries class





talawa
1.0.0+1






