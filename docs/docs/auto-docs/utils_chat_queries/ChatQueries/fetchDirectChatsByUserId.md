




fetchDirectChatsByUserId method - ChatQueries class - chat\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/chat\_queries.dart](../../utils_chat_queries/utils_chat_queries-library.html)
3. [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4. fetchDirectChatsByUserId method

fetchDirectChatsByUserId


dark\_mode

light\_mode




# fetchDirectChatsByUserId method


String
fetchDirectChatsByUserId(

1. String userId

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [chat\_queries](../../utils_chat_queries/utils_chat_queries-library.html)
3. [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4. fetchDirectChatsByUserId method

##### ChatQueries class





talawa
1.0.0+1






