




getPostById method - PostQueries class - post\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/post\_queries.dart](../../utils_post_queries/utils_post_queries-library.html)
3. [PostQueries](../../utils_post_queries/PostQueries-class.html)
4. getPostById method

getPostById


dark\_mode

light\_mode




# getPostById method


String
getPostById(

1. String postId

)

Getting Post by Post Id.

**params**:

* `postId`: The post id

**returns**:

* `String`: The query related to gettingPostsbyId

## Implementation

```
String getPostById(String postId) {
  return """
    query {
      post(id: "$postId")
      {
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
         _id,
          text,
           createdAt
      creator{
        firstName
        lastName
      }
        }
      }
    }
""";
}
```

 


1. [talawa](../../index.html)
2. [post\_queries](../../utils_post_queries/utils_post_queries-library.html)
3. [PostQueries](../../utils_post_queries/PostQueries-class.html)
4. getPostById method

##### PostQueries class





talawa
1.0.0+1






