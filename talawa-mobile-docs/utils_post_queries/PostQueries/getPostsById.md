


# getPostsById method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) getPostsById
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId)





<p>Getting Posts by Id.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>orgId</code>: The organisation id</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>String</code>: The query related to gettingPostsbyId</li>
</ul>



## Implementation

```dart
String getPostsById(String orgId) {
  return """
    query {
      postsByOrganization(id: "$orgId",orderBy: createdAt_DESC )
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
          _id
        }
      }
    }
""";
}
```







