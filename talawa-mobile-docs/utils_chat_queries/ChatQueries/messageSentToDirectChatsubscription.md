


# messageSentToDirectChatsubscription property









[String](https://api.flutter.dev/flutter/dart-core/String-class.html) messageSentToDirectChatsubscription
  







## Implementation

```dart
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








