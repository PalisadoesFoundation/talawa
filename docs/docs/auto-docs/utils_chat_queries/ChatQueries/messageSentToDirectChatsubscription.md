




messageSentToDirectChatsubscription property - ChatQueries class - chat\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/chat\_queries.dart](../../utils_chat_queries/utils_chat_queries-library.html)
3. [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4. messageSentToDirectChatsubscription property

messageSentToDirectChatsubscription


dark\_mode

light\_mode




# messageSentToDirectChatsubscription property


String
get
messageSentToDirectChatsubscription

## Implementation

```
String get messageSentToDirectChatsubscription => '''
    subscription{
      messageSentToDirectChat{
        _id
        messageContent
        sender {
            _id
            firstName
            image
          }
          receiver {
            _id
            firstName
            image
          }
      }
    }
''';
```


 


1. [talawa](../../index.html)
2. [chat\_queries](../../utils_chat_queries/utils_chat_queries-library.html)
3. [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4. messageSentToDirectChatsubscription property

##### ChatQueries class





talawa
1.0.0+1






