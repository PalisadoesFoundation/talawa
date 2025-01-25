




removePost method - PostQueries class - post\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/post\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_post_queries/)
3. [PostQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_post_queries/PostQueries-class.html)
4. removePost method

removePost


dark\_mode

light\_mode




# removePost method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
removePost()

Mutation to remove the post.

**params**:
None

**returns**:

* `String`: query is returned

## Implementation

```
String removePost() {
  return '''
  mutation RemovePost(\$id: ID!) {
    removePost(id: \$id) {
      _id
    }
  }
  ''';
}
```

 


1. [talawa](../../index.html)
2. [post\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_post_queries/)
3. [PostQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_post_queries/PostQueries-class.html)
4. removePost method

##### PostQueries class





talawa
1.0.0+1






