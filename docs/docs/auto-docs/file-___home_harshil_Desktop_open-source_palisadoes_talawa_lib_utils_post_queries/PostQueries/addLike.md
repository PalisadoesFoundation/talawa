




addLike method - PostQueries class - post\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/post\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_post_queries/)
3. [PostQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_post_queries/PostQueries-class.html)
4. addLike method

addLike


dark\_mode

light\_mode




# addLike method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
addLike()

Add Like to a post.

**params**:
None

**returns**:

* `String`: The query related to addingLike

## Implementation

```
String addLike() {
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

 


1. [talawa](../../index.html)
2. [post\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_post_queries/)
3. [PostQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_post_queries/PostQueries-class.html)
4. addLike method

##### PostQueries class





talawa
1.0.0+1






