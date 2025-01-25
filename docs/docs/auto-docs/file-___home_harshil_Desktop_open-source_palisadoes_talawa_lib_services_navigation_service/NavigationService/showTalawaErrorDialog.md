




showTalawaErrorDialog method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/)
3. [NavigationService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/NavigationService-class.html)
4. showTalawaErrorDialog method

showTalawaErrorDialog


dark\_mode

light\_mode




# showTalawaErrorDialog method


void
showTalawaErrorDialog(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) errorMessage,
2. dynamic messageType

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
2. [navigation\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/)
3. [NavigationService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/NavigationService-class.html)
4. showTalawaErrorDialog method

##### NavigationService class





talawa
1.0.0+1






