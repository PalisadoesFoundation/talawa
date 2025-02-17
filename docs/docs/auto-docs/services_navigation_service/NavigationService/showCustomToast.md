
<div>

# showCustomToast method

</div>


void showCustomToast(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    msg]

)



Shows an Custom Toast.

**params**:

-   `msg`: Message shown in Toast

**returns**: None



## Implementation

``` language-dart
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
        color: Colors.black.withAlpha((1.0 * 255).),
      );
    },
  ).show(navigatorKey.currentContext!);
}
```







1.  [talawa](../../index.html)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.html)
4.  showCustomToast method

##### NavigationService class







