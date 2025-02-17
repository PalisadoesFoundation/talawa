
<div>

# showTalawaErrorSnackBar method

</div>


void showTalawaErrorSnackBar(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    errorMessage,
    ]
2.  [[[MessageType](../../enums_enums/MessageType.html)]
    messageType]

)



This is used for the quick error of `duration: 2 seconds`.

**params**:

-   `errorMessage`: Error Message shown in snackbar
-   `messageType`: Type of Message
-   `duration`: Duration of snackbar

**returns**: None



## Implementation

``` language-dart
void showTalawaErrorSnackBar(
  String errorMessage,
  MessageType messageType,
) {
  final Duration duration = Duration(milliseconds: errorMessage.length * 80);
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      padding: EdgeInsets.zero,
      duration: duration,
      content: TalawaErrorSnackBar(
        duration: duration,
        messageType: messageType,
        errorMessage: errorMessage,
      ),
      backgroundColor: const Color.fromRGBO(65, 65, 66, 1),
    ),
  );
}
```







1.  [talawa](../../index.html)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  showTalawaErrorSnackBar method

##### NavigationService class







