
<div>

# updateAccessToken method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
updateAccessToken({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    accessToken,
    ]
2.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    refreshToken,
    ]

})



Updates the access token of the user.

**params**:

-   `accessToken`: current user\'s accesstoken.
-   `refreshToken`: current user\'s refreshtoken.

**returns**: None



## Implementation

``` language-dart
Future<void> updateAccessToken({
  required String accessToken,
  required String refreshToken,
}) async {
  _currentUser!.refreshToken = refreshToken;
  _currentUser!.authToken = accessToken;
  ;
}
```







1.  [talawa](../../index.md)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.md)
4.  updateAccessToken method

##### UserConfig class







