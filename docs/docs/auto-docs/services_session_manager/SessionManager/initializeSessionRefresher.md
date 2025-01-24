




initializeSessionRefresher method - SessionManager class - session\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/session\_manager.dart](../../services_session_manager/services_session_manager-library.html)
3. [SessionManager](../../services_session_manager/SessionManager-class.html)
4. initializeSessionRefresher method

initializeSessionRefresher


dark\_mode

light\_mode




# initializeSessionRefresher method


Timer
initializeSessionRefresher()

Initializes as session refresher.

Invokes [refreshSession](../../services_session_manager/SessionManager/refreshSession.html) periodically at regular
refresh intervals.

**params**:
None

**returns**:

* `Timer`: refresh timer.

## Implementation

```
Timer initializeSessionRefresher() {
  return Timer.periodic(
    const Duration(seconds: _refreshInterval),
    (Timer timer) async {
      refreshSession();
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [session\_manager](../../services_session_manager/services_session_manager-library.html)
3. [SessionManager](../../services_session_manager/SessionManager-class.html)
4. initializeSessionRefresher method

##### SessionManager class





talawa
1.0.0+1






