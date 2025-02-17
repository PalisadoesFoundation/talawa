
<div>

# getPostById method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
getPostById(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    postId]

)



Getting Post by Post Id.

**params**:

-   `postId`: The post id

**returns**:

-   `String`: The query related to gettingPostsbyId



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [post_queries](../../utils_post_queries/)
3.  [PostQueries](../../utils_post_queries/PostQueries-class.md)
4.  getPostById method

##### PostQueries class







