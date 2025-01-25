




fetchDirectChatsByUserId method - ChatQueries class - chat\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/chat\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/)
3. [ChatQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/ChatQueries-class.html)
4. fetchDirectChatsByUserId method

fetchDirectChatsByUserId


dark\_mode

light\_mode




# fetchDirectChatsByUserId method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
fetchDirectChatsByUserId(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId

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
2. [chat\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/)
3. [ChatQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/ChatQueries-class.html)
4. fetchDirectChatsByUserId method

##### ChatQueries class





talawa
1.0.0+1






