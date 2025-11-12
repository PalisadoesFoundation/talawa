



menu

1.  [talawa](../../index.md)
2.  [utils/chat_queries.dart](../../utils_chat_queries/)
3.  [ChatQueries](../../utils_chat_queries/ChatQueries-class.md)
4.  chatMessageCreate property


chatMessageCreate


 dark_mode   light_mode 




<div>

# chatMessageCreate property

</div>



[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
get chatMessageCreate



Gets the GraphQL subscription for chat message creation events.

**params**: None

**returns**:

-   `String`: The GraphQL subscription string for listening to chat
    message creation



## Implementation

``` language-dart
String get chatMessageCreate => '''
    subscription chatMessageCreate(\$input: SubscriptionChatMessageCreateInput!) 
''';
```








1.  [talawa](../../index.md)
2.  [chat_queries](../../utils_chat_queries/)
3.  [ChatQueries](../../utils_chat_queries/ChatQueries-class.md)
4.  chatMessageCreate property

##### ChatQueries class









 talawa 1.0.0+1 
