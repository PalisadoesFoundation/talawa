
<div>

# fetchDirectChatsByUserId method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
fetchDirectChatsByUserId(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    userId]

)



## Implementation

``` language-dart
String fetchDirectChatsByUserId(String userId) {
  return '''
    query {
    directChatsByUserID(id: "$userId") {
      _id
      users{
        _id
        firstName
        email
      }
    }
  }
 ''';
}
```







1.  [talawa](../../index.html)
2.  [chat_queries](../../utils_chat_queries/)
3.  [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4.  fetchDirectChatsByUserId method

##### ChatQueries class







