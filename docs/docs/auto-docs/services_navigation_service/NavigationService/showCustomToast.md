




showCustomToast method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. showCustomToast method

showCustomToast


dark\_mode

light\_mode




# showCustomToast method


void
showCustomToast(

1. String msg

)

Shows an Custom Toast.

**params**:

* `msg`: Message shown in Toast

**returns**:
None


## Implementation

```
void showCustomToast(String msg) {
  DelightToastBar(
    builder: (context) {
      return ToastCard(
        title: Text(
          msg,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        leading: const Icon(
          Icons.error_outline,
          color: Colors.redAccent,
        ),
        color: Colors.black.withOpacity(0.8),
      );
    },
  ).show(navigatorKey.currentContext!);
}
```

 


1. [talawa](../../index.html)
2. [navigation\_service](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. showCustomToast method

##### NavigationService class





talawa
1.0.0+1






