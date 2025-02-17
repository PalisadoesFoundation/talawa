
<div>

# showTalawaErrorDialog method

</div>


void showTalawaErrorDialog(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    errorMessage,
    ]
2.  [[[MessageType](../../enums_enums/MessageType.html)]
    messageType]

)



Shows an Error Dialog Box.

**params**:

-   `errorMessage`: Message shown in dialog
-   `messageType`: Type of Message

**returns**: None



## Implementation

``` language-dart
void showTalawaErrorDialog(String errorMessage, MessageType messageType) {
  showDialog(
    context: navigatorKey.currentContext!,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return TalawaErrorDialog(
        errorMessage,
        messageType: messageType,
      );
    },
  );
}
```







1.  [talawa](../../index.html)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  showTalawaErrorDialog method

##### NavigationService class







