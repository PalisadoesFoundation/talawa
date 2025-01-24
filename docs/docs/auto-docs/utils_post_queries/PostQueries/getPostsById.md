




getPostsById method - PostQueries class - post\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/post\_queries.dart](../../utils_post_queries/utils_post_queries-library.html)
3. [PostQueries](../../utils_post_queries/PostQueries-class.html)
4. getPostsById method

getPostsById


dark\_mode

light\_mode




# getPostsById method


String
getPostsById(

1. String orgId,
2. String? after,
3. String? before,
4. int? first,
5. int? last,

)

Getting Posts by Id.

**params**:

* `orgId`: The organisation id
* `after`: The cursor after which the posts are to be fetched
* `before`: The cursor before which the posts are to be fetched
* `first`: The number of posts to be fetched from the start
* `last`: The number of posts to be fetched from the end

**returns**:

* `String`: The query related to gettingPostsbyId

## Implementation

```
String getPostsById(
  String orgId,
  String? after,
  String? before,
  int? first,
  int? last,
) {
  print(after);
  final String? afterValue = after != null ? '"$after"' : null;
  final String? beforeValue = before != null ? '"$before"' : null;

  return """
    query {
      organizations(id: "$orgId") {
        posts(first: $first, last:$last,after:  $afterValue, before: $beforeValue) {
        edges {
        node {
          _id
          title
          text
          imageUrl
          videoUrl
          creator {
            _id
            firstName
            lastName
            email
          }
          createdAt
          likeCount
          commentCount
            likedBy{
          _id
        }
        comments{
          _id
        }
          pinned
        }
        cursor
      }
      pageInfo {
        startCursor
        endCursor
        hasNextPage
        hasPreviousPage
      }
      totalCount
        }
      }
    }
""";
}
```

 


1. [talawa](../../index.html)
2. [post\_queries](../../utils_post_queries/utils_post_queries-library.html)
3. [PostQueries](../../utils_post_queries/PostQueries-class.html)
4. getPostsById method

##### PostQueries class





talawa
1.0.0+1






