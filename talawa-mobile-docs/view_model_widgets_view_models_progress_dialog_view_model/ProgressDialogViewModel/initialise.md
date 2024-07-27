


# initialise method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> initialise
()








## Implementation

```dart
Future<void> initialise() async {
  setState(ViewState.busy);
  connectivityResult = await connectivity.checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    connectivityPresent = false;
    Future.delayed(const Duration(seconds: 2))
        .then((value) => navigationService.pop());
  } else {
    connectivityPresent = true;
  }
  setState(ViewState.idle);
}
```







