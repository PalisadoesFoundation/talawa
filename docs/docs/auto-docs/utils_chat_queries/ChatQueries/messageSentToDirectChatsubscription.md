
<div>

# messageSentToDirectChatsubscription property

</div>



[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
get messageSentToDirectChatsubscription



## Implementation

``` language-dart
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








1.  [talawa](../../index.html)
2.  [chat_queries](../../utils_chat_queries/)
3.  [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4.  messageSentToDirectChatsubscription property

##### ChatQueries class







