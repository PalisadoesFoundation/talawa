




initializeSessionRefresher method - SessionManager class - session\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/session\_manager.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_session_manager/)
3. [SessionManager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_session_manager/SessionManager-class.html)
4. initializeSessionRefresher method

initializeSessionRefresher


dark\_mode

light\_mode




# initializeSessionRefresher method


[Timer](https://api.flutter.dev/flutter/dart-async/Timer-class.html)
initializeSessionRefresher()

Initializes as session refresher.

Invokes [refreshSession](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_session_manager/SessionManager/refreshSession.html) periodically at regular
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
2. [session\_manager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_session_manager/)
3. [SessionManager](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_session_manager/SessionManager-class.html)
4. initializeSessionRefresher method

##### SessionManager class





talawa
1.0.0+1






