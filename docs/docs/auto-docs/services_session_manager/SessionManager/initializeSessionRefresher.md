
<div>

# initializeSessionRefresher method

</div>


[[Timer](https://api.flutter.dev/flutter/dart-async/Timer-class.html)]




Initializes as session refresher.

Invokes
[refreshSession](../../services_session_manager/SessionManager/refreshSession.html)
periodically at regular refresh intervals.

**params**: None

**returns**:

-   `Timer`: refresh timer.



## Implementation

``` language-dart
Timer  {
  return Timer.periodic(
    const Duration(seconds: _refreshInterval),
    (Timer timer) async {
      ;
    },
  );
}
```







1.  [talawa](../../index.html)
2.  [session_manager](../../services_session_manager/)
3.  [SessionManager](../../services_session_manager/SessionManager-class.html)
4.  initializeSessionRefresher method

##### SessionManager class







