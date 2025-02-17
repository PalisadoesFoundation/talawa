
<div>

# uploadPost method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Upload a post to database.

**params**: None

**returns**:

-   `String`: The query related to uploadingPost.



## Implementation

``` language-dart
String  {
  return '''
  mutation CreatePost(
  \$text: String!
  \$title: String!
  \$imageUrl: URL
  \$videoUrl: URL
  \$organizationId: ID!
  \$file: String
) {
  createPost(
    data: {
      text: \$text
      title: \$title
      imageUrl: \$imageUrl
      videoUrl: \$videoUrl
      organizationId: \$organizationId
    }
    file: \$file
  ) {
    _id
    text
    createdAt
    imageUrl
    videoUrl
    title
    commentCount
    likeCount
    creator{
      _id
      firstName
      lastName
      image
    }
    organization{
      _id
    }
    likedBy{
      _id
    }
    comments{
      _id
        }
  }
}
  ''';
}
```







1.  [talawa](../../index.html)
2.  [post_queries](../../utils_post_queries/)
3.  [PostQueries](../../utils_post_queries/PostQueries-class.html)
4.  uploadPost method

##### PostQueries class







