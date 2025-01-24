




showTalawaErrorDialog method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. showTalawaErrorDialog method

showTalawaErrorDialog


dark\_mode

light\_mode




# showTalawaErrorDialog method


void
showTalawaErrorDialog(

1. String errorMessage,
2. [MessageType](../../enums_enums/MessageType.html) messageType

)

Shows an Error Dialog Box.

**params**:

* `errorMessage`: Message shown in dialog
* `messageType`: Type of Message

**returns**:
None


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [navigation\_service](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. showTalawaErrorDialog method

##### NavigationService class





talawa
1.0.0+1






