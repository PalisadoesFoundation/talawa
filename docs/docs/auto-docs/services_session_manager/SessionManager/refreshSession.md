
<div>

# refreshSession method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]




Asynchronously refreshes the user session.

**params**: None

**returns**:

-   `Future<bool>`: indicates if session refresh was successful.



## Implementation

``` language-dart
Future<bool>  async {
  if (userConfig.loggedIn && userConfig.currentUser.refreshToken != null) {
    final refreshed = await databaseFunctions
        .refreshAccessToken(userConfig.currentUser.refreshToken!);
    return refreshed;
  }
  return false;
}
```







1.  [talawa](../../index.html)
2.  [session_manager](../../services_session_manager/)
3.  [SessionManager](../../services_session_manager/SessionManager-class.html)
4.  refreshSession method

##### SessionManager class







