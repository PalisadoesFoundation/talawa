




showTalawaErrorSnackBar method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. showTalawaErrorSnackBar method

showTalawaErrorSnackBar


dark\_mode

light\_mode




# showTalawaErrorSnackBar method


void
showTalawaErrorSnackBar(

1. String errorMessage,
2. [MessageType](../../enums_enums/MessageType.html) messageType

)

This is used for the quick error of `duration: 2 seconds`.

**params**:

* `errorMessage`: Error Message shown in snackbar
* `messageType`: Type of Message
* `duration`: Duration of snackbar

**returns**:
None


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [navigation\_service](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. showTalawaErrorSnackBar method

##### NavigationService class





talawa
1.0.0+1






