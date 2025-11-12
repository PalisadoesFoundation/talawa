



menu

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/chat/widgets/chat_message_bubble.dart](../../views_after_auth_screens_chat_widgets_chat_message_bubble/)
3.  [Message](../../views_after_auth_screens_chat_widgets_chat_message_bubble/Message-class.md)
4.  formatTime method


formatTime


 dark_mode   light_mode 




<div>

# formatTime method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
formatTime(

1.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.md)]
    dateTime]

)



Formats the given DateTime into a human-readable time string for chat
messages.

Returns different formats based on the time difference:

-   For messages older than a day: \"day/month\" format
-   For messages within a day: \"hour:minute\" format
-   For messages within an hour: \"Xm ago\" format
-   For very recent messages: \"now\"

**params**:

-   `dateTime`: The DateTime to format

**returns**:

-   `String`: Formatted time string appropriate for chat messages



## Implementation

``` language-dart
String formatTime(DateTime dateTime) 
```







1.  [talawa](../../index.md)
2.  [chat_message_bubble](../../views_after_auth_screens_chat_widgets_chat_message_bubble/)
3.  [Message](../../views_after_auth_screens_chat_widgets_chat_message_bubble/Message-class.md)
4.  formatTime method

##### Message class









 talawa 1.0.0+1 
