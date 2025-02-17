
<div>

# removePost method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Mutation to remove the post.

**params**: None

**returns**:

-   `String`: query is returned



## Implementation

``` language-dart
String  {
  return '''
  mutation RemovePost(\$id: ID!) {
    removePost(id: \$id) {
      _id
    }
  }
  ''';
}
```







1.  [talawa](../../index.html)
2.  [post_queries](../../utils_post_queries/)
3.  [PostQueries](../../utils_post_queries/PostQueries-class.html)
4.  removePost method

##### PostQueries class







