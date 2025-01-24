




removePost method - PostQueries class - post\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/post\_queries.dart](../../utils_post_queries/utils_post_queries-library.html)
3. [PostQueries](../../utils_post_queries/PostQueries-class.html)
4. removePost method

removePost


dark\_mode

light\_mode




# removePost method


String
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
2. [post\_queries](../../utils_post_queries/utils_post_queries-library.html)
3. [PostQueries](../../utils_post_queries/PostQueries-class.html)
4. removePost method

##### PostQueries class





talawa
1.0.0+1






