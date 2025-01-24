




uploadPost method - PostQueries class - post\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/post\_queries.dart](../../utils_post_queries/utils_post_queries-library.html)
3. [PostQueries](../../utils_post_queries/PostQueries-class.html)
4. uploadPost method

uploadPost


dark\_mode

light\_mode




# uploadPost method


String
uploadPost()

Upload a post to database.

**params**:
None

**returns**:

* `String`: The query related to uploadingPost.

## Implementation

```
String uploadPost() {
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

 


1. [talawa](../../index.html)
2. [post\_queries](../../utils_post_queries/utils_post_queries-library.html)
3. [PostQueries](../../utils_post_queries/PostQueries-class.html)
4. uploadPost method

##### PostQueries class





talawa
1.0.0+1






