




refreshSession method - SessionManager class - session\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/session\_manager.dart](../../services_session_manager/services_session_manager-library.html)
3. [SessionManager](../../services_session_manager/SessionManager-class.html)
4. refreshSession method

refreshSession


dark\_mode

light\_mode




# refreshSession method


Future<bool>
refreshSession()

Asynchronously refreshes the user session.

**params**:
None

**returns**:

* `Future<bool>`: indicates if session refresh was
  successful.

## Implementation

```
Future<bool> refreshSession() async {
  if (userConfig.loggedIn && userConfig.currentUser.refreshToken != null) {
    final refreshed = await databaseFunctions
        .refreshAccessToken(userConfig.currentUser.refreshToken!);
    return refreshed;
  }
  return false;
}
```

 


1. [talawa](../../index.html)
2. [session\_manager](../../services_session_manager/services_session_manager-library.html)
3. [SessionManager](../../services_session_manager/SessionManager-class.html)
4. refreshSession method

##### SessionManager class





talawa
1.0.0+1






